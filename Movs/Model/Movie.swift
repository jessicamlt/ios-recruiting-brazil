//
//  Movie.swift
//  Movs
//
//  Created by Jéssica Trindade on 01/09/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import Foundation


class Movie: Decodable {
    var originalTitle: String?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var genres: [Genre]?
    
}

class Genre: Codable {
    var id: Int?
    var name: String?
}

extension Movie {
    var posterURL: String {
        let baseURL: String = "https://image.tmdb.org/t/p"
        let size: String = "/w185"
        return baseURL + size + (posterPath ?? "")
    }
    
    var getReleaseYear: String {
        let fullDate = (releaseDate ?? "").components(separatedBy: "-")
        return fullDate.first ?? ""
    }
}
