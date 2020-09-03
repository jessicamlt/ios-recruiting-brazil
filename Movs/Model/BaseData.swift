//
//  Movie.swift
//  Movs
//
//  Created by Jéssica Trindade on 01/09/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import Foundation

struct BaseData: Codable {
    var totalResults: Int
    var results: [Movie]?
}

struct Movie: Codable {
    var id: Int?
    var title: String?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var genreIds: [Int]?
    
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
    
    var genres: [String] {
        var result: [String] = []
        for id in (genreIds ?? []) {
            switch id {
            case 12:
                result.append("Adventure")
            case 16:
                result.append("Animation")
            case 18:
                result.append("Drama")
            case 27:
                result.append("Horror")
            case 28:
                result.append("Action")
            case 35:
                result.append("Comedy")
            case 36:
                result.append("History")
            case 37:
                result.append("Western")
            case 53:
                result.append("Thriller")
            case 80:
                result.append("Crime")
            case 99:
                result.append("Documentary")
            case 9648:
                result.append("Mystery")
            case 10402:
                result.append("Music")
            case 10749:
                result.append("Romance")
            case 10751:
                result.append("Family")
            case 10752:
                result.append("War")
            case 10770:
                result.append("TV Movie")
            default:
                break
            }
        }
        return result
    }
}
