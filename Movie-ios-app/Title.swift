//
//  Title.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 01/12/2025.
//

import Foundation

struct APIObject: Decodable{
    var result: [Title] = []
}

struct Title : Decodable, Identifiable{
    var id: Int?
    var title: String?
    var name: String?
    var overView: String?
    var posterPath: String?
    
}
