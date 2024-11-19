//
//  Comentario.swift
//  EditarPerfil
//
//  Created by Turma02-3 on 13/11/24.
//

import SwiftUI

struct Comentario: View {
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    
    var body: some View {
        VStack{
            //VAI FICAR FOTO ATUAL DO COMENTÁRIO
            Image(.perfil)
                .resizable()
                .frame(width: 300, height: 300)
        }
    }
    
}

#Preview {
    Comentario()
}
