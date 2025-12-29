//
//  YoutubeSearchResponse.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 29/12/2025.
//

import Foundation

struct YoutubeSearchResponse: Codable{
    let items: [ItemProperties]?
}

struct ItemProperties : Codable{
    let id : idproperties?
}
struct idproperties : Codable {
    let videoid: String?
}
