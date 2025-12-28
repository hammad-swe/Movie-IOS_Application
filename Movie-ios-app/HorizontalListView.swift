//
//  SwiftUIView.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 30/11/2025.
//

import SwiftUI

struct HorizontalListView: View {
    let header : String
    let title : [Title]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.title)
            
            ScrollView(.horizontal){
                LazyHStack {
                ForEach(title) { title in
                    AsyncImage(url: URL(string: title.posterPath ?? "")){ image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } placeholder:{
                        ProgressView()
                    }
                    .frame(width: 120, height: 200)
                }
            }
        }
        }
        .frame(width: 250)
        .padding(10)
    }
}

#Preview {
    HorizontalListView(header: constant.trendingMoviesString, title: Title.previewTitles)
}
