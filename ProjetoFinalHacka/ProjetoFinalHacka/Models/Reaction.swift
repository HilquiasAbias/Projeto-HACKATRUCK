//
//  Reaction.swift
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
    var password: String
    var families: [Family]
    
    // Estrutura Family aninhada dentro de User
    struct Family: Encodable, Decodable, Hashable {
        var _id: String
        var nome: String
    }
    
    // Estrutura Coment aninhada dentro de User
    struct Coment: Encodable, Decodable, Hashable {
        var _id: String
        var text: String
        var user: User // Relacionamento de volta para User
        var createdAt: String
    }
    
    // Estrutura Moment aninhada dentro de User
    struct Moment: Encodable, Decodable, Hashable {
        var _id: String
        var text: String
        var image: String
        var location: String
        var createdAt: String
        var coments: [Coment] // Relacionamento com Coment
        var reactions: [Reaction] // Relacionamento com Reaction
    }
    
    // Estrutura Reaction aninhada dentro de User
    struct Reaction: Encodable, Decodable, Hashable {
        var _id: String
        var user: User // Relacionamento de volta para User
        var createdAt: String
    }
}