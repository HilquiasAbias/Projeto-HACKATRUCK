//
//  ContentView.swift
//  EditarPerfil
//
//  Created by Turma02-3 on 11/11/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
  @State private var selectedItem: PhotosPickerItem?
  @State var image: Image?
  @State var foto = Image("perfil")
  
  @State private var nome: String = ""
  @State private var email: String = ""
  let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect
  
  @StateObject var userViewModel: UserViewModel = UserViewModel()
  
  var body: some View {
    VStack {
      HStack {
        Text(nome)
          .foregroundStyle(.color)
          .font(.title)
          .bold()
          .padding()
        
        Spacer()
      }
      
      VStack {
        ZStack {
          foto
            .resizable()
            .frame(width: 150, height: 150)
            .cornerRadius(10.0)
            .clipShape(Circle())
          
          VStack {
            PhotosPicker("Edit", selection: $selectedItem, matching: .images)
              .onChange(of: selectedItem) {
                Task {
                  if let image = try? await selectedItem?.loadTransferable(type: Image.self) {
                    self.image = image
                    foto = image
                  }
                  print("Failed to load the image")
                }
              }
              .foregroundColor(.color)
              .bold()
              .padding(.leading, 100)
              .padding(.top, 100)
          }
        }
        
        VStack {
          Text("Nome")
            .bold()
            .padding(.trailing, 275)
            .foregroundColor(.color)
          TextField("Alterar nome", text: $nome)
            .padding(.leading, 25)
        }
        
        VStack {
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
  }
}

#Preview {
  EditProfileView()
}
