//
//  REST.swift
//  Movs
//
//  Created by Jéssica Trindade on 02/09/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import Foundation

enum BaseDataError {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

protocol RESTProtocol {
    func getMovies(page: Int, onComplete: @escaping (BaseData) -> Void, onError: @escaping (BaseDataError) -> Void)
}

class REST: RESTProtocol {
    
    private let basePath = "https://api.themoviedb.org/3/trending"
    private let mediaType = "/movie"
    private let timeWindow = "/week"
    private let session = URLSession.shared
    
    // MARK: - GET
    
    func getMovies(page: Int, onComplete: @escaping (BaseData) -> Void, onError: @escaping (BaseDataError) -> Void) {
        
        var privateKey: String {
            return "?page=\(page)&api_key=f6f65fb2af513727cf97296cf7f31f0c"
        }
        
        
        guard let url = URL(string: basePath + mediaType + timeWindow + privateKey) else {
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
                        let baseData = try jsonDecoder.decode(BaseData.self, from: data)
                        onComplete(baseData)
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
