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
        VStack{
            AsyncImage(url: URL(string: heroTextTitle)){ image in
                image
                    .resizable()
                    .scaledToFit()
                
            }placeholder: {
              ProgressView()
            }
        }
    }
}

#Preview {
    HomeView()
}
