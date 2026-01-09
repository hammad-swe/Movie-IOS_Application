//
//  constant.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 29/11/2025.
//

import Foundation
import SwiftUI

struct constant {
    //    name
    static let homestring = "Home"
    static let upcommingtring = "Upcomming"
    static let search = "Search"
    static let downloadstring = "Download"
    static let playstring = "Play"
    static let trendingMoviesString = "Trending Movies"
    static let trendingTVString = "Trending TV"
    static let topratedmoviesstring = "Top Rated Movies"
    static let topratedTVString = "Top Rated TV"
    
    //    icons
    static let homeicon = "house"
    static let upcommingicon = "play.circle"
    static let searchicon = "magnifyingglass"
    static let downloadicon = "arrow.down.to.line"
//    Home
//    static let testtitleURL = "https://images.unsplash.com/photo-1580130775562-0ef92da028de?q=80&w=1050&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    static let testtitleURL = "https://image.tmdb.org/t/p/w500/nnl6OWkyPpuMm595hmAxNW3rZFn.jpg"
    static let testtitleURL2 = "https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg"
    static let testtitleURL3 = "hhttps://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg"
    
    
    static let posterUrlStart = "hhttps://image.tmdb.org/t/p/w500/"
    
   static func addPosterPath(to titles: inout[Title]) {
        for index in titles.indices {
            if let path = titles[index].posterPath {
                titles[index].posterPath =  constant.posterUrlStart + path
            }
        }
    }
}


enum YoutubeURLString : String {
    case trailer = "trailer"
    case queryShorten = "q"
    case space = " "
    case key = "key"
    
    
}

extension Text {
    func ghostbutton() -> some View{
        self
            .frame(width: 100, height: 50)
            .foregroundStyle(.buttonText)
            .bold()
            .background{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.buttonBorder,lineWidth: 5)
            }
    }
}
