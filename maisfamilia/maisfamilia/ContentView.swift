//
//  ContentView.swift
//  maisfamilia
//
//  Created by Turma02-15 on 12/11/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        TabView{
           
            PhotoFrameView()
                .tabItem{
                    Label("Porta Retrato", systemImage: "photo")
                }   .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(Color.white.opacity(0.8), for: .tabBar)
                
            .badge(2)
            Feed()
                .tabItem {
                    Label("Family Feed", systemImage: "house")
                    
                }  .toolbarBackground(.visible, for: .tabBar).toolbarBackground(Color.white.opacity(0.8), for: .tabBar)
            Perfil()
                .tabItem{
                    Label("Meu Perfil", systemImage: "person.crop.circle")
                }  .toolbarBackground(.visible, for: .tabBar).toolbarBackground(Color.white.opacity(0.8), for: .tabBar)
        }.tint(Color("Green"))
           
          
//        .toolbar(.visible, for: .tabBar)
//        .toolbarBackground(
//                Color.yellow,
//                for: .tabBar)
        
//        .toolbarBackground(.white, for: .tabBar)
//        .toolbarBackground(.visible, for: .tabBar)
//        .frame(width: 400, height: 70)
//        .background()
//        .shadow(color:Color("LightGreen"), radius:9, x:10, y:10)
//        
    }
}
#Preview {
    ContentView()
}
