//
//  ContentView.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
//

import SwiftUI



struct ContentView: View {
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    @State var isTabViewShown = true
    
    var body: some View {
        VStack {
            if isTabViewShown {
                TabView{
                    PhotoFrameView()
                        .tabItem{
                            Label("Porta Retrato", systemImage: "photo")
                        }
                        .toolbarBackground(.visible, for: .tabBar)
                        .toolbarBackground(Color.white.opacity(0.8), for: .tabBar)
                        .badge(2)
                    FeedView()
                        .tabItem {
                            Label("Feed", systemImage: "house")
                            
                        }
                        .toolbarBackground(.visible, for: .tabBar).toolbarBackground(Color.white.opacity(0.8), for: .tabBar)
                    Perfil()
                        .tabItem{
                            Label("Meu Perfil", systemImage: "person.crop.circle")
                        } 
                        .toolbarBackground(.visible, for: .tabBar).toolbarBackground(Color.white.opacity(0.8), for: .tabBar)
                }.tint(Color("Green"))
            }
        }
    }
    
    // func encode(img: UIImage) -> String {
    //     return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    // }
    
    // func decode(base:String) -> UIImage{
    //     let imageData =  Data(base64Encoded: base, options: .ignoreUnknownCharacters)
    //     let image = UIImage(data: imageData!)
    //     return image!
    // }
}

#Preview {
    ContentView()
}
