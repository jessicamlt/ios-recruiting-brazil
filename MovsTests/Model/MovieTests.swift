//
//  MovieTests.swift
//  MovsTests
//
//  Created by Jéssica Trindade on 01/09/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import XCTest
@testable import Movs

class MovieTests: XCTestCase {
    
    func testReleaseDate() throws {
        let movie = Movie()
        movie.releaseDate = "1999-10-23"
        let result = movie.releaseYear
        XCTAssertEqual(result, "1999")
    }

    func testReleaseDateEmpty() throws {
        let movie = Movie()
        movie.releaseDate = nil
        XCTAssertEqual(movie.releaseYear, "")
        
        let movie2 = Movie()
        movie2.releaseDate = ""
        XCTAssertEqual(movie.releaseYear, "")
    }
    
    

}
