//
//  Model.swift
//  Quiz
//
//  Created by Cassiano Carradore Salgado on 12/09/22.
//

import Foundation

class Model {
    static let instance = Model()
    
    private init() {
    }
    
    var listaPerguntas: [Perguntas] = []
}
