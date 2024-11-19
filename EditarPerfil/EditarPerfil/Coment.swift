//
//  Coment.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
//

import Foundation

struct Coment: Encodable, Decodable, Hashable {
    var text: String
    var username: String
    var createdat: String
    var image: String
}
