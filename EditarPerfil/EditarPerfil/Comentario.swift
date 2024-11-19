//
//  Comentario.swift
//  EditarPerfil
//
//  Created by Turma02-3 on 13/11/24.
//

import SwiftUI

struct Comentario: View {
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    
    @State private var coments : String = ""
    
    var body: some View {
        VStack{
            //VAI FICAR FOTO ATUAL DO COMENTÁRIO
            Image(.perfil)
                .resizable()
                .frame(width: 100, height: 100)
        }
        
        VStack(alignment: .leading){
//            ZStack {
//
//            }
            ScrollView{
                ForEach(userViewModel.users, id: \.self) { m in
                    ForEach(m.moments, id:\.self) { c in
                        ForEach(c.coments, id: \.self) { co in
                            HStack {
                                if(co.username == m.name){
                                    Text(co.text)
                                        .background(Color.color)
                                        .foregroundStyle(.white)
                                        .cornerRadius(10)
                                        .font(.system(size: 20))
                                        .padding(.bottom)
                                        .padding(.leading, 180)
                                    
                                } else {
                                    Text(co.text)
                                        .background(Color.gray)
                                        .foregroundStyle(.white)
                                        .cornerRadius(10)
                                        .font(.system(size: 20))
                                        .padding(.bottom)
                                        .padding(.leading, 20)
                                        .padding(.trailing, 100)
                                }
                                
                                
                                Spacer()
                            }
                            
                            
                        }
                    }
                }
            }
            HStack {
                TextField("Comentário", text: $coments)
                    .padding(.leading, 40)
                
                Button{
                    userViewModel.user?.moments[3].coments.append(
                        Coment(id: 7, text: coments, username: userViewModel.user!.name, createdat: "agora", image: "")
                    )
                    userViewModel.put()
                    userViewModel.getUsers()
                    coments = ""
                    
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.color)
                        .padding(.trailing, 40)
                }
                
            }
            .frame(width: 400, height: 60)
            .background(.white)
//            VStack {
//                Spacer()
//
//            }
        }
        .onAppear(){
            userViewModel.getUsers()
        }
    }
}
#Preview {
    Comentario()
}
