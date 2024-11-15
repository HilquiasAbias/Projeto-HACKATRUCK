//
//  ContentView.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
//

import SwiftUI



struct ContentView: View {
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    //    @State private var texto : String = ""
    
    @State var isTabViewShown = true
    
    var body: some View {
        
        //        VStack {
        ////            TextField("comentário", text: $texto)
        ////            Button(action: {
        ////                userViewModel.user?.moments[0].coments.append(Coment(text: texto, username: "logado", createdat: "agora", image: ""))
        ////                userViewModel.put(user: userViewModel.user!)
        ////            }) {
        ////                Text("comentar")
        ////            }
        //
        //
        //
        //        }
        //        .onAppear() {
        //            userViewModel.getUsers()
        //        }
        VStack {
            if isTabViewShown {
                TabView() {
                    PortaRetrato(isTabViewShown: $isTabViewShown)
                        .tabItem{
                            Label("Porta Retrato", systemImage: "photo")
                        }
                    SwiftUIView()
                        .tabItem {
                            Label("Family Feed", systemImage: "house")
                        }
                    Aaaa()
                        .tabItem{
                            Label("Meu Perfil", systemImage: "person.crop.circle")
                        }
                }
            }
            
        }
        
    }
    
    func encode(img: UIImage) -> String {
        return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }
    
    func decode(base:String) -> UIImage{
        let imageData =  Data(base64Encoded: base, options: .ignoreUnknownCharacters)
        let image = UIImage(data: imageData!)
        return image!
    }
}

#Preview {
    ContentView()
}

// Image(uiImage: decode(base: index.image))
