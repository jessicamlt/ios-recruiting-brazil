//
//  REST.swift
//  Movs
//
//  Created by Jéssica Trindade on 02/09/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import Foundation

enum MovieError {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

class REST {
    
    private static let basePath = "https://api.themoviedb.org/3/movie/550?api_key="
    private static let privateKey = "f6f65fb2af513727cf97296cf7f31f0c"
    private static let session = URLSession.shared
    
    // MARK: - GET
    
    static func getMovies(onComplete: @escaping ([Movie]) -> Void, onError: @escaping (MovieError) -> Void) {
        guard let url = URL(string: basePath + privateKey) else {
            onError(.url)
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                        let movies = try jsonDecoder.decode([Movie].self, from: data)
                        onComplete(movies)
                    } catch {
                        print(error.localizedDescription)
                        onError(.invalidJSON)
                    }
                } else {
                    print("Status inválido pelo servidor")
                    onError(.responseStatusCode(code: response.statusCode))
                }
            } else {
                onError(.taskError(error: error!))
            }
        }
        dataTask.resume()
    }
}
