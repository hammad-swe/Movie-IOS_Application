//
//  HomeView.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 29/11/2025.
//

import SwiftUI

struct HomeView: View {
    var heroTextTitle = constant.testtitleURL
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical){
                LazyVStack{
                    AsyncImage(url: URL(string: heroTextTitle)){ image in
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
                        
                    }placeholder: {
                        ProgressView()
                    }
                    .frame(width: geo.size.width, height: geo.size.height * 0.85)
                    
                    HStack{
                        Button {
                            
                        } label: {
                            Text(constant.playstring)
                                .ghostbutton()
                        }
                        Button {
                            
                        } label: {
                            Text(constant.downloadstring)
                                .ghostbutton()
                        }
                    }
                    
                    HorizontalListView(header: constant.trendingMoviesString)
                    HorizontalListView(header: constant.trendingTVString)
                    HorizontalListView(header: constant.topratedmoviesstring)
                    HorizontalListView(header: constant.topratedTVString)
                    
                }
            }
        }
            }
        }



#Preview {
    HomeView()
}
