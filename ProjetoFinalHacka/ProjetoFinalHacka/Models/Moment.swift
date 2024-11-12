//
//  Moment.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
//

import Foundation

struct Moment: Codable, Identifiable {
    var id: UUID
    var text: String
    var image: String
    var location: String
    var userid: Int
    var familyid: Int
    var createdat: String
    var coments: [Coment]
    var reactions: [Reaction]
}
