//
//  ContentView.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 29/11/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Tab(constant.homestring, systemImage: constant.homeicon){
//                Text(constant.homestring)
              HomeView()
            }
            Tab(constant.upcommingtring, systemImage: constant.upcommingicon){
                Text(constant.upcommingtring)
            }
            Tab(constant.search, systemImage: constant.searchicon){
                Text(constant.search)
            }
            Tab(constant.downloadstring, systemImage: constant.downloadicon){
                Text(constant.downloadstring)
            }
        }
        .onAppear{
            if let Config = APIConfig.shared{
                print(Config.tmdbAPIKey)
                print(Config.tmdbBaseURL)
            }
        }
    }
}

#Preview {
    ContentView()
}
