//
//  Title.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 01/12/2025.
//

import Foundation

struct APIObject: Decodable {
    var results: [Title] = []
}

struct Title : Decodable, Identifiable , Hashable {
    var id: Int?
    var title: String?
    var name: String?
    var overView: String?
    var posterPath: String?

    static var previewTitles = [
        Title(id: 1, title: "BeetleJuice" , name: "BeetleJuice", overView: "A movie about BeetleJuice", posterPath: constant.testtitleURL),
        Title(id: 2 , title: "PulpeFiction", name: "PulpeFiction", overView: "A movie about PupleFiction", posterPath: constant.testtitleURL2),
        Title(id: 3 , title: "The Dark Knight" , name: "The Dark Knight", overView: "A movie about the Dark Knight", posterPath: constant.testtitleURL3)
    ]
}
