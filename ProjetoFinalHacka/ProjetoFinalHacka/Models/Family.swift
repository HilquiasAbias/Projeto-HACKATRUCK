//
//  Family.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
//

import Foundation

struct Family: Encodable, Decodable, Hashable{
    var _id: String
    var _rev: String
    var nome: String
    var users: [User]
}

