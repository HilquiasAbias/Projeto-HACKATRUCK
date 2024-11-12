//
//  Moment.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
//

import Foundation

struct Moment: Encodable, Decodable, Hashable {
    var _id: String
    var _rev: String
    var text: String
    var image: String
    var location: String
    var user: User
   // var family: Family
    var createdat: String
    var coments: [Coment]
    var reactions: [Reaction]
}
