//
//  UserViewModel.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
//

import Foundation

class UserViewModel: ObservableObject {
    let apiurl = "http://127.0.0.1:1880" // 192.168.128.66
    @Published var users: [User] = []
    @Published var user: User? = nil

    func getUsers() {
        let task = URLSession.shared.dataTask(with: URL(string: apiurl +  "/get-users")!
        ) { data, _, error in
            do {
                self.users = try JSONDecoder().decode([User].self, from: data!)
                self.user = self.users[0]
                print(self.users)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func put(user: User) {
        var request = URLRequest(url: URL(string: apiurl + "/put-user")!)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do{
            var json = try JSONEncoder().encode(user)
            print(json)
            request.httpBody = json
        }catch{
            print(error)
        }
        
        let task = URLSession.shared.dataTask(with: request){ data, _ , error in
            print(data!)
        }
        task.resume()
    }
}