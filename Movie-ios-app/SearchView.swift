//
//  SearchView.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 16/02/2026.
//

import SwiftUI

struct SearchView: View {
    var titles = Title.previewTitles
    @State private var searchByMovies = true
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]) {
                    ForEach(titles) { title in
                        AsyncImage(url: URL(string: title.posterPath ?? "")){
                            image in
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(.rect(cornerRadius: 10))
                        }
                        placeholder : {
                            ProgressView()
                        }.frame(width: 120, height: 200)
                    }
                }
            }
        }
        .navigationTitle(searchByMovies ? constant.movieSearchString : constant.tvSearchString)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    searchByMovies.toggle()
                } label: {
                    Image(systemName: searchByMovies ? constant.movieIcon : constant.tvIcon)
                }
            }
        }
        .searchable(text: $searchText, prompt: searchByMovies ? constant.moviePlaceholderString : constant.tvPlaceholderString)
    }
}

#Preview {
    SearchView()
}
