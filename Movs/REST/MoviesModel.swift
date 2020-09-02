//
//  MoviesModel.swift
//  Movs
//
//  Created by Jéssica Trindade on 02/09/20.
//  Copyright © 2020 Jéssica Trindade. All rights reserved.
//

import Foundation

class MoviesModel {
    private let rest: RESTProtocol
    
    init(rest: RESTProtocol = REST()) {
        self.rest = rest
    }
    
    func getMovies(onComplete: @escaping (BaseData) -> Void) {
        rest.getMovies(onComplete: { (baseData) in
            onComplete(baseData)
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
