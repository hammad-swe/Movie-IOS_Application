//
//  Title.swift
//  Movie-ios-app
//
//  Created by Hammad Ali on 01/12/2025.
//

import SwiftData

struct TMDBAPIObject: Decodable {
    var results: [Title] = []
}

@Model
class Title : Decodable, Identifiable , Hashable {
    @Attribute(.unique) var id: Int?
    var title: String?
    var name: String?
    var overView: String?
    var posterPath: String?
    
    
    init(id: Int? = nil, title: String? = nil, name: String? = nil, overView: String? = nil, posterPath: String? = nil) {
        self.id = id
        self.title = title
        self.name = name
        self.overView = overView
        self.posterPath = posterPath
    }
    
    enum CodingKeys: CodingKey{
        case id
        case title
        case name
        case overview
        case posterPath
    }
    
    required init(from decoder: any Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        overView = try container.decodeIfPresent(String.self, forKey: .overview)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    }

    static var previewTitles = [
        Title(id: 1, title: "BeetleJuice" , name: "BeetleJuice", overView: "A movie about BeetleJuice", posterPath: constant.testtitleURL),
        Title(id: 2 , title: "PulpeFiction", name: "PulpeFiction", overView: "A movie about PupleFiction", posterPath: constant.testtitleURL2),
        Title(id: 3 , title: "The Dark Knight" , name: "The Dark Knight", overView: "A movie about the Dark Knight", posterPath: constant.testtitleURL3)
    ]
}
