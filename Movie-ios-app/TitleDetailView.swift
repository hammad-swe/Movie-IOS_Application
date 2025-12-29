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
                   YoutubePlayer(videoid: "pbiQKOmsIKg")
                        .aspectRatio(1.33, contentMode: .fit)
                    
                    Text((title.name ?? title.title) ?? "")
                        .bold()
                        .font(.title2)
                        .padding(5)
                       
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
