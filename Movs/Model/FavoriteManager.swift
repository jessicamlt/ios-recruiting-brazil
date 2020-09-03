//
//  FavoriteManager.swift
//  Movs
//
//  Created by Jéssica Trindade on 03/09/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import Foundation


class FavoriteManager {
    var favoriteList: [Movie] = []
    var filename: String = "favoriteList"
    var destination: String = "/Documents"
        
    func save() {
        let encoder = JSONEncoder()
        
        guard let data = try? encoder.encode(favoriteList) else {
            print("Erro ao codificar Lista de Favoritos")
            return
        }

        do {
            let path = destination + "/" + filename
            let url = URL(fileURLWithPath: path)
            try data.write(to: url)
            return
        } catch {
            print("Erro ao salvar dados")
            return
        }
    }
    
    func read() -> [Movie]? {
        let path = destination + "/" + filename
        let url = URL(fileURLWithPath: path)
        
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
