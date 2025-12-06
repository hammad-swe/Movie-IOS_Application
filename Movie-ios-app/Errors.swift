//
//  Errroe.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 05/12/2025.
//

import Foundation

enum APIConfigError: Error, LocalizedError{
    case filenotfound
    case dataloadingfailed(underlyingError: Error)
    case decodingfailded(underlyingError: Error)
    
    var errorDescription: String?{
        switch self{
            case
                .filenotfound:
            return "API Configuration File not found"
            case
                .dataloadingfailed(underlyingError: let error):
            return  "Failed to load data from Configuration File : \(error.localizedDescription)"
            
        case .decodingfailded(underlyingError: let error):
            return "Failed to decode data from Configuration File : \(error.localizedDescription)"
        }
    }
}

enum NetworkError :Error , LocalizedError{
    case badURLResponse(underlayingError: Error)
    case missingConfig
    case urlbuildFailed
    
    
    var errorDescription: String?{
        switch self{
        case .badURLResponse(underlayingError: let error):
            return "Failed to Parse URL Response: \(error.localizedDescription)."
        case .missingConfig:
            return "Missing Api Configuation"
        case .urlbuildFailed:
            return "Failed to build URL"
        }
    }
}
