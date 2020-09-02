//
//  MoviesModel.swift
//  Movs
//
//  Created by Jéssica Trindade on 02/09/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import Foundation

class MoviesModel {
    func getMovies(onComplete: @escaping ([Movie]) -> Void) {
        REST.getMovies(onComplete: { (movies) in
            onComplete(movies)
        }) { (error) in
            switch error {
            case .invalidJSON:
                print("JSON inválido")
            case .noData:
                print("Não há dados")
            case .noResponse:
                print("Não houve resposta do Servidor")
            case .responseStatusCode(code: 404):
                print("Não encontrado")
            default:
                print("Erro desconhecido")
            }
        }
    }
}
