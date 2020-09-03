//
//  Movie.swift
//  Movs
//
//  Created by Jéssica Trindade on 01/09/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import Foundation

struct BaseData: Decodable {
    var totalResults: Int
    var results: [Movie]?
}

struct Movie: Decodable {
    var title: String?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var genre_ids: [Int]?
    
}

extension Movie {
    var posterURL: String {
        let baseURL: String = "https://image.tmdb.org/t/p"
        let size: String = "/w185"
        return baseURL + size + (posterPath ?? "")
    }
    
    var releaseYear: String {
        let fullDate = (releaseDate ?? "").components(separatedBy: "-")
        return fullDate.first ?? ""
    }
}
