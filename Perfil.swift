//
//  Perfil.swift
//  EditarPerfil
//
//  Created by Turma02-3 on 12/11/24.
//

import SwiftUI

struct Perfil: View {
    @StateObject var viewModel: UserViewModel = UserViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text(viewModel.user?.name ?? "")
                        .foregroundStyle(.color)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .padding()
                    Spacer()
                }
                VStack{
                    
                    AsyncImage(url: URL(string: viewModel.user?.image ?? "")){image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }placeholder: {
                        Image(systemName: "photo.fill")
                    }
                        //.resizable()
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
                }.onAppear()
                {
                    viewModel.getUser(id: "5b0d4074664528131833c5684f2e2d0c")
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
