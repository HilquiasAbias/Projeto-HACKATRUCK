//
//  Perfil.swift
//  maisfamilia
//
//  Created by Turma02-15 on 13/11/24.
//
import SwiftUI

struct Perfil: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Meu Perfil")
                        .foregroundStyle(.color)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding()
                    Spacer()
                }
                
                VStack {
                    Image(.jkkk)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(10.0)
                    
                    NavigationLink(destination: EditProfileView()) {
                        Text("Editar perfil")
                            .foregroundColor(.white)
                            .frame(width: 100, height: 40)
                            .buttonStyle(.bordered)
                            .background(Color.color)
                            .cornerRadius(20)
                    }
                }
                Spacer()
                
                HStack {
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
