//
//  Coment.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
//

import Foundation

struct Coment: Encodable, Decodable, Identifiable {
    var id: Int
    var text: String
    var username: String
    var createdat: String
    var image: String
}
