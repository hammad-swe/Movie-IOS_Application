//
//  DataFetcher.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 06/12/2025.
//

import Foundation
let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey


//https://api.themoviedb.org/3/rending/movie/day?api_key=Your_ApI_KEy
func fetchTitles(for Media: String) async throws -> [Title]{
    guard let baseURL = tmdbBaseURL else {
        throw NetworkError.missingConfig
    }
    guard let apiKey = tmdbAPIKey else {
        throw NetworkError.missingConfig
    }
    guard let fetchTitleURL = URL(string: baseURL)?
        .appending(path: "3/trending/\(Media)/day")
        .appending(queryItems: [
            URLQueryItem(name: "api_key", value: apiKey)
        ])
    else {
        throw NetworkError.urlbuildFailed
    }
    print(fetchTitleURL)
    
    let (data, urlResponse) = try await URLSession.shared.data(from: fetchTitleURL)
}
