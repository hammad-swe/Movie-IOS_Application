//
//  TitleDetailView.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 25/12/2025.
//

import SwiftUI

struct TitleDetailView: View {
    let title : Title
    var body: some View {
        GeometryReader {geometry in
            ScrollView{
                LazyVStack(alignment: .leading){
                    AsyncImage(url: URL(string: title.posterPath ?? "")){ image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.85)
                    
                    Text((title.name ?? title.title) ?? "")
                        .bold()
                        .font(.title2)
                        .padding(5)
                        .padding(.top, -20)
                    Text(title.overView ?? "")
                        .padding(5)
                }
            }
            
        }
    }
}

#Preview {
    TitleDetailView(title: Title.previewTitles[0])
}
