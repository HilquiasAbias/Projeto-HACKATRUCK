//
//  SheetView.swift
//  maisfamilia
//
//  Created by Turma02-15 on 13/11/24.
//

import SwiftUI

struct SheetView: View{
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    var body: some View{
        VStack {
          // VAI FICAR FOTO ATUAL DO COMENTÁRIO
          Image(.jkkk)
            .resizable()
            .frame(width: 100, height: 100)
        }
        
        VStack(alignment: .leading) {
          ScrollView {
            ForEach(userViewModel.users, id: \.self) { m in
              ForEach(m.moments, id: \.self) { c in
                ForEach(c.coments, id: \.self) { co in
                  HStack {
                    if co.username == m.name {
                      Text(co.text)
                        .background(Color.color)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                        .font(.system(size: 20))
                        .padding(.bottom)
                        .padding(.leading, 180)
                    } else {
                      Text(co.text)
                        .background(Color.gray)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                        .font(.system(size: 20))
                        .padding(.bottom)
                        .padding(.leading, 20)
                        .padding(.trailing, 100)
                    }
                    
                    Spacer()
                  }
                }
              }
            }
          }
        }
        .onAppear {
          userViewModel.getUsers()
        }
    }
    
}
#Preview {
    SheetView()
}

