//
//  Coment.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
//

import Foundation

struct Coment: Encodable, Decodable, Hashable {
    var _id: String
    var _rev: String
    var text: String
    var user: User
    var moment: Moment
    var createdat: String
}
