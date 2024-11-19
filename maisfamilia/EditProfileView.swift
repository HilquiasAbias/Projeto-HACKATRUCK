//
//  EditProfileView.swift
//  maisfamilia
//
//  Created by Turma02-15 on 18/11/24.
//


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
    @StateObject var viewModel: UserViewModel = UserViewModel()
    @State var image: Image?
    @State var foto = Image("perfil")
    
    @State private var nome : String = ""
    @State private var email : String = ""
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect
    @State private var showingAlert = false
    
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
                    // $nome = viewModel.user?.name ?? ""
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
                }.onAppear()
                {
                    viewModel.getUser(id: "5b0d4074664528131833c5684f2e2d0c")
                }
                
                VStack
                {
                    
                    Text("Nome")
                        .bold()
                        .padding(.trailing, 275)
                        .foregroundColor(.color)
                    
                    TextField(viewModel.user?.name ?? "",  text: $nome)
                        .padding(.leading, 25)
                    
                }
                
                VStack
                {
                    Text("Email")
                        .bold()
                        .padding(.trailing, 275)
                        .foregroundColor(.color)
                    TextField(viewModel.user?.email ?? "", text: $email)
                        .padding(.leading, 25)
                    
                }
                Button("Salvar"){
                    viewModel.user?.name = nome
                    viewModel.user?.email = email
                    userViewModel.put(user: viewModel.user!)
                    showingAlert.toggle()
                    
                }.alert("Alterado com sucesso!!", isPresented: $showingAlert){
                    Button("OK", role: .cancel){}
                }
                .foregroundColor(.white)
                .buttonStyle(.bordered)
                .background(Color.color)
                .cornerRadius(20)
                .padding(.top, 50)
            }
            Spacer()
        }
        .onAppear(){
            userViewModel.getUsers()
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                nome = viewModel.user?.name ?? ""
                email = viewModel.user?.email ?? ""
            }
        }
    }
}

#Preview {
    EditProfileView()
}
