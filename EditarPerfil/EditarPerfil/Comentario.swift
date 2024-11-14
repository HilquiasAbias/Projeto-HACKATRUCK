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
            
            VStack{
                ForEach(userViewModel.users, id: \.self) { u in
                    ForEach(u.moments, id: \.self) { m in
                        ForEach(m.coments, \.self) { c in
                            HStack {
                                Text(c.text)
                                    .padding()
                            }
                        }
                        
//                        Spacer()
//                        m.name == c.username
//                        if m.name == c.username {
//                            
//                        }
                    }
//                    HStack{
//                        
//                    }
                }
//                HStack{
//                    Text("")
//                        .padding()
//                        Spacer()
//                }
//                HStack{
//                    Spacer()
//                    Text("Obrigada tiaa")
//                        .padding()
//                    Spacer()
//                }

                
            }
            
            Spacer()
        }
        .onAppear(){
            userViewModel.getUsers()
        }
    }

}

#Preview {
    Comentario()
}
