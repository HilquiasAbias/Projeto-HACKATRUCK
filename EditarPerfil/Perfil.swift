//
//  Perfil.swift
//  EditarPerfil
//
//  Created by Turma02-3 on 12/11/24.
//

import SwiftUI

struct Perfil: View {
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Cleiton do Pneu")
                        .foregroundStyle(.color)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding()
                    Spacer()
                }
                
                VStack{
                    
                    Image(.perfil)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(10.0)
                    
                    NavigationLink (destination:  ContentView()){
                        Text("Editar perfil")
                            .foregroundColor(.white)
                        // .padding(2)
                            .frame(width: 100, height: 40)
                            .buttonStyle(.bordered)
                            .background(Color.color)
                            .cornerRadius(20)
                    }
                }
                Spacer()
                
                HStack{
                    //PARA CARREGAR A FOTO
                    
                    //ForEach(back) { back in
                    //Grid {
                    // GridRow {
                    //    Text(back.foto)
                    //          .frame(width: 100, height: 100)
                    //}
                    //     }
                    //}
                }
                
                
            }
        }
    }
}

#Preview {
    Perfil()
}
