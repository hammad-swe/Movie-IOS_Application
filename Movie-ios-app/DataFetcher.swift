//
//  DataFetcher.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 06/12/2025.
//

import Foundation
struct DataFetcher {
    let tmdbBaseURL = APIConfig.shared?.tmdbBaseURL
    let tmdbAPIKey = APIConfig.shared?.tmdbAPIKey
    
    
    //https://api.themoviedb.org/3/trending/movie/day?api_key=Your_API_KEY
    //https://api.themoviedb.org/3/movie/top_rated?api_key=Your_API_KEY
    func fetchTitles(for media: String, by type:String) async throws -> [Title]{
     let fetchTitleURL = try buildURL(media: media, type: type)
        
        guard let fetchTitleURL =  fetchTitleURL else{
            throw NetworkError.urlbuildFailed
        }
        print(fetchTitleURL)
        
        let (data, urlResponse) = try await URLSession.shared.data(from: fetchTitleURL)
        guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badURLResponse(underlayingError: NSError(
                domain: "DataFetcher",
                code: (urlResponse as? HTTPURLResponse)?.statusCode ?? -1,
                userInfo: [NSLocalizedDescriptionKey: "Invalid HTTP Response"]))
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var titles = try decoder.decode(APIObject.self, from: data).result
        constant().addPosterPath(to: &titles)
        return titles
    }
    private func buildURL(media: String, type: String) throws -> URL? {
        guard let baseURL = tmdbBaseURL else {
            throw NetworkError.missingConfig
        }
        guard let apiKey = tmdbAPIKey else {
            throw NetworkError.missingConfig
        }
        
        var path: String
        
        if type == "trending" {
            path = "3/trendin/\(media)/day"
        }else if type == "top_rated"{
            path = "3/\(media)/top_rated"
            
        } else {
            throw NetworkError.urlbuildFailed
        }
        
        guard let url = URL(string: baseURL)?
            .appending(path: path)
            .appending(queryItems: [
                URLQueryItem(name: "api_key", value: apiKey)
            ])
        else {
            throw NetworkError.urlbuildFailed
        }
        return url
    }
}
