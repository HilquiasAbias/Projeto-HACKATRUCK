//
//  UserViewModel.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
//

import Foundation

class UserViewModel: ObservableObject {
    let apiurl = "http://127.0.0.1:1880" // 192.168.128.66:1880 se não for no meu pc
    @Published var users: [User] = []
    @Published var user: User? = nil
    
    func getUser(id: String) {
        let task = URLSession.shared.dataTask(with: URL(string:apiurl + "/get-user?_id=\(id)")!) { data, _, error in
            do {
                let user = try JSONDecoder().decode(User.self, from: data!)
                DispatchQueue.main.async {
                    self.user = user
                    self.momentUser = user.moments
                }
            } catch {
                print("Error decoding user: \(error)")
            }
        }
    }

    func getUsers() {
        let task = URLSession.shared.dataTask(with: URL(string: apiurl +  "/get-users")!
        ) { data, _, error in
            do {
                self.users = try JSONDecoder().decode([User].self, from: data!)
                self.user = self.users[0]
                print(self.user)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func post(user: User) {
        var request = URLRequest(url: URL(string: apiurl + "/post-user")!)
        request.httpMethod = "POST"
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
    
    func delete(user: User) {
        var request = URLRequest(url: URL(string: apiurl + "/delete-user")!)
        request.httpMethod = "DELETE"
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
