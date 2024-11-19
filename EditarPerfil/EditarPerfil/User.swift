//
//  User.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
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
