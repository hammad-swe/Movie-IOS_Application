//
//  viewModel.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 22/12/2025.
//

import Foundation

@Observable
class viewModel {
    enum fetchStatus{
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    private(set) var homestatus: fetchStatus = .notStarted
    private let datafetcher = DataFetcher()
    
    var trendingMovies: [Title] = []
    
    func getTitles() async{
        homestatus = .fetching
        do{
            trendingMovies = try await datafetcher.fetchTitles(for: "movie")
            homestatus = .success
        }
        catch{
            print(error)
            homestatus = .failed(underlyingError: error)
        }
    }
}
