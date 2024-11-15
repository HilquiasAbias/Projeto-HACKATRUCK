//
//  Feed.swift
//  maisfamilia
//
//  Created by Turma02-15 on 13/11/24.
//

import SwiftUI



struct Feed: View{
    @State private var ShowingSheet = false
    @State private var buscar: String = ""
    
    @StateObject var viewModel: UserViewModel = UserViewModel()
    
    var body: some View{
        VStack {
            
            //titulo
            
            VStack{
                HStack{
                    Text("Memórias")
                        .padding(.leading,20)
                    Spacer()
                }
                HStack{
                    Text("Compartilhadas")
                        .padding(.leading,20)
                    Spacer()
                }
                
            }
            .font(.system(size:25))
            .bold()
            .foregroundColor(Color("Green"))
            
            //barra pesquisa
            
            HStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color("Green"))
                        .padding(.leading,10)
                    
                    TextField("Buscar", text: $buscar)
                    
                }
                .frame(width: 200, height: 34)
                .background()
                .cornerRadius(40)
                .shadow(color:Color("LightGreen"), radius:9, x:10, y:10)
                
                // botão criar
                
                Button("Criar"){
                    
                }
                .frame(width:120, height: 40)
                .background(Color("Green"))
                .cornerRadius(40)
                .foregroundColor(.white)
                .shadow(color:Color("LightGreen"), radius:9, x:10, y:10)
            }
            .padding(.bottom,15)
            
            
            
            ScrollView{
                
                ForEach(viewModel.momentUser, id:\.self){ element in
                    //post
                    VStack{
                        HStack{
                            AsyncImage(url: URL(string: element.image ?? "")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(40)
                            } placeholder: {
                                Image(systemName: "photo.fill")
                            }
                            VStack{
                                HStack{
                                    Text(element.name ?? "")
                                    Image(systemName: "ellipsis")
                                        .foregroundStyle(Color("Green"))
                                }
                                
                                Text(element.createdat)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                            }
                        }
                        
                        VStack{
                            Text(element.text)
                                .font(.system(size: 14))
                                .padding()
                        }
                        
                        AsyncImage(url: URL(string: element.image ?? "")){
                            image in image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        } placeholder: {Color.gray}
                        HStack{
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 24, height:22)
                                .foregroundColor(Color("Red"))
                            Text("\(element.reactions)")
                            
                                .bold()
                                .foregroundColor(Color("Red"))
                                .padding(.trailing, 15)
                            Image(systemName: "bubble")
                                .onTapGesture {
                                    ShowingSheet.toggle()
                                }
                                .sheet(isPresented: $ShowingSheet) {
                                    SheetView()
                                }
                            //ontapgesture
                            Text("2")
                            Image(systemName: "paperplane")
                        }
                        .padding(.trailing, 180)
                        .padding(.top, 10)
                        
                    }
                    .frame(width: 370, height: 700)
                    .background()
                    .cornerRadius(20)
                    .shadow(color:Color("LightGreen"), radius:9, x:10, y:10)
                    
                    Spacer()
                }
                }
        
                
        }
        .padding()
        .onAppear(){
            viewModel.getUser(id: "5b0d4074664528131833c5684f2e2d0c")
        }
    }
    
    
}

#Preview {
    Feed()
}

