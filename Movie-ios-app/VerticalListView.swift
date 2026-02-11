//
//  VerticalListView.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 10/02/2026.
//

import SwiftUI

struct VerticalListView: View {
    var titles : [Title]
    var body: some View {
        List(titles){title in
            AsyncImage(url: URL(string: title.posterPath ?? "")){ image in
                HStack{
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 10))
                        .padding(5)
                    Text(title.name ?? title.title ?? "")
                        .font(.system(size: 24))
                        .bold()
                }
                
            }
            placeholder : {
                ProgressView()
            }
        }
        
    }
}

#Preview {
    VerticalListView(titles: Title.previewTitles)
}
