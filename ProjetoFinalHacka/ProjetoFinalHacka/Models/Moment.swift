//
//  Moment.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
//

import Foundation

struct Moment: Encodable, Decodable, Hashable {
    var text: String
    var name: String?
    var image: String
    var createdat: String
    var coments: [Coment]
    var reactions: Int
}
