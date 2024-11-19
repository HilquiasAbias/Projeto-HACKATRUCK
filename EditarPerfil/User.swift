//
//  User.swift
//  EditarPerfil
//
//  Created by Turma02-3 on 13/11/24.
//

import Foundation

struct User: Encodable, Decodable, Hashable {
    var _id: String
    var _rev: String
    var name: String
    var email: String
    var image: String
    var moments: [Moment]
}

