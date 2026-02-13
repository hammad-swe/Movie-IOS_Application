//
//  viewModel.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 22/12/2025.
//

import Foundation

@Observable
class ViewModel {
    enum FetchStatus{
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    private(set) var homestatus: FetchStatus = .notStarted
    private(set) var videoIdtatus: FetchStatus = .notStarted
    private(set) var upcomingStatus: FetchStatus = .notStarted
    
    private let datafetcher = DataFetcher()
    var trendingMovies: [Title] = []
    var trendingTV: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTV: [Title] = []
    var upcomingMovies: [Title] = []
    var heroTitle = Title.previewTitles[0]
    var videoId = ""
    
    func getTitles() async {
        homestatus = .fetching
        if trendingMovies.isEmpty {
            do{
                async let tMovies = datafetcher.fetchTitles(for: "movie", by: "trending")
                async let tTV = datafetcher.fetchTitles(for: "tv", by: "trending")
                async let tRMovies = datafetcher.fetchTitles(for: "movie", by: "top_rated")
                async let tRTV =  datafetcher.fetchTitles(for: "tv", by: "top_rated")
                
                trendingMovies = try await tMovies
                trendingTV = try await tTV
                topRatedMovies =  try await tRMovies
                topRatedTV =  try await tRTV
                
                if let title = trendingMovies.randomElement() {
                    heroTitle = title
                }
                
                homestatus = .success
                
            }
            catch{
                print(error)
                homestatus = .failed(underlyingError: error)
            }
        } else{
            homestatus =  .success
        }
    }
    func getVideoId(for title: String) async {
        videoIdtatus = .fetching
        do{
            videoId =  try await datafetcher.fetchVideoId(for: title)
            videoIdtatus = .success
        } catch{
            print(error)
            videoIdtatus = .failed(underlyingError: error)
        }
    }
    
    func getUpcomingMovies() async{
        upcomingStatus = .fetching
        do{
            upcomingMovies = try await datafetcher.fetchTitles(for: "movie", by: "upcoming")
            upcomingStatus = .success
        } catch{
            print(error)
            upcomingStatus = .failed(underlyingError: error)
        }
    }
}
