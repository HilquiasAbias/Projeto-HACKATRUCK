//
//  ContentView.swift
//  EditarPerfil
//
//  Created by Turma02-3 on 11/11/24.
//

import SwiftUI
//struct Global {
//    
//  public static var global = ""
//    
//}


struct ContentView: View {
    @State private var nome : String = ""
    @State private var email : String = ""
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect
    
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    var body: some View {
        VStack {
            HStack
            {
                
                Text(nome)
                    .foregroundStyle(.color)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding()
            
                Spacer()
                
            }
            
            VStack
            {
                ZStack{
                    Image(.perfil)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .cornerRadius(10.0)
                    
                    //                Button("Alterar foto"){
                    //                } .foregroundColor(.white)
                    //                    .buttonStyle(.bordered)
                    //                    .background(Color.color)
                    //                    .cornerRadius(20)
                    //
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "highlighter")
                            .foregroundColor(.gray)
                            .padding(.leading, 90)
                            .padding(.top, 100)
                    }
                    Image(systemName: "")
                        
                        
                    
                }
                
                VStack
                {
                    
                    Text("Nome")
                        .bold()
                        .padding(.trailing, 275)
                        .foregroundColor(.color)
                    TextField("Alterar nome", text: $nome)
                        .padding(.leading, 25)
                    
                }
//                Button("Alterar nome"){
//                    
////                    Global.global = nome
////                    print(Global.global)
//                    testeNome = nome
//                }
                
                VStack
                {
                    Text("Email")
                        .bold()
                        .padding(.trailing, 275)
                        .foregroundColor(.color)
                    TextField("Alterar email", text: $email)
                        .padding(.leading, 25)
                    
                }
                
                
            }
            Spacer()
        }
//        .onAppear(){
//            userViewModel.getUsers()
//        }
        
        
        
        
    }
}

#Preview {
    ContentView()
}
