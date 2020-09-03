//
//  FavoriteManager.swift
//  Movs
//
//  Created by Jéssica Trindade on 03/09/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import Foundation


class FavoriteManager {
    private var favoriteList: [Movie] = []
    private var filename: String = "favoriteList"
    private var destination: String = "/Documents"
    private var path: String {
        return NSHomeDirectory() + destination + "/" + filename
    }
    private var url: URL {
        return URL(fileURLWithPath: path)
    }
    
    init() {
        guard let movies = self.read() else {
            return
        }
        
        favoriteList = movies
    }
    
    func addMoviesInFavoriteList(_ movie: Movie) {
        favoriteList.append(movie)
        save()
    }
        
    func save() {
        let encoder = JSONEncoder()
        
        guard let data = try? encoder.encode(favoriteList) else {
            print("Erro ao codificar Lista de Favoritos")
            return
        }

        do {
            try data.write(to: url)
            return
        } catch {
            print("Erro ao salvar dados")
            return
        }
    }
    
    func read() -> [Movie]? {
        guard let data = try? Data(contentsOf: url) else {
            print("Erro em converter arquivo em Data")
            return nil
        }
        
        let decoder = JSONDecoder()
        
        guard let movies = try? decoder.decode([Movie].self, from: data) else {
            print("Falha em converter JSON em Movie")
            return nil
        }
        
        return movies
    }
}
