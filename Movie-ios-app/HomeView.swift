//
//  HomeView.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 29/11/2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    let viewModel = ViewModel()
    @State private var titleDetailPath = NavigationPath()
    @Environment(\.modelContext) var modelContext
    var body: some View {
        NavigationStack(path: $titleDetailPath) {
            GeometryReader { geo in
                ScrollView(.vertical){
                    switch viewModel.homestatus {
                    case .notStarted:
                        EmptyView()
                    case .fetching:
                        ProgressView()
                    case .success:
                        LazyVStack{
                            AsyncImage(url: URL(string: viewModel.heroTitle.posterPath ?? "")){ image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .overlay{
                                        LinearGradient(
                                            stops: [Gradient.Stop(color: .clear, location: 0.8),
                                                    Gradient.Stop(color: .gradient, location: 1)],
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    }
                                
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: geo.size.width, height: geo.size.height)
                            
                            HStack{
                                Button {
                                    titleDetailPath.append(viewModel.heroTitle)
                                } label: {
                                    Text(constant.playstring)
                                        .ghostbutton()
                                }
                                Button {
                                    modelContext.insert(viewModel.heroTitle)
                                    try? modelContext.save()
                                } label: {
                                    Text(constant.downloadstring)
                                        .ghostbutton()
                                }
                            }
                            
                            HorizontalListView(header: constant.trendingMoviesString, title: viewModel.trendingMovies){title in
                                titleDetailPath.append(title)
                            }
                            HorizontalListView(header: constant.trendingTVString, title: viewModel.trendingTV){title in
                                titleDetailPath.append(title)
                            }
                            HorizontalListView(header: constant.topratedmoviesstring, title: viewModel.topRatedMovies){title in
                                titleDetailPath.append(title)
                            }
                            HorizontalListView(header: constant.topratedTVString, title: viewModel.topRatedTV){title in
                                titleDetailPath.append(title)
                            }
                        }
                    case .failed(let error):
                        Text(error.localizedDescription)
                            .errorMessage()
                            .frame(width: geo.size.width, height: geo.size.height)

                    }
                }
                .task {
                    await viewModel.getTitles()
                }
                .navigationDestination(for: Title.self) { title in
                            TitleDetailView(title: title)
                            
                }
            }
        }
    }
}
#Preview {
    HomeView()
}
