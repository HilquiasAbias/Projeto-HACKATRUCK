//
//  FamilyViewModel.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
//

import Foundation

class ComentViewModel: ObservableObject {
    
    let apiurl = "http://127.0.0.1:1880"
    @Published var coments = [Coment]()
    @Published var coment: Coment? = nil

    func ComentsByMomentId(id: String) {
        guard let url = URL(string: apiurl + "/coments/moment/\(id)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let coment = try JSONDecoder().decode(Coment.self, from: data)
                DispatchQueue.main.async {
                    self.coments.append(coment)
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func getComentsByUserId(id: String) { //Não deve ser usado
        guard let url = URL(string: apiurl + "/coments/user/\(id)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let coment = try JSONDecoder().decode(Coment.self, from: data)
                DispatchQueue.main.async {
                    self.coments.append(coment)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
   
    func getComents() {  //Não deve ser usado
        guard let url = URL(string: apiurl + "/coments") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let coments = try JSONDecoder().decode([Coment].self, from: data)
                DispatchQueue.main.async {
                    self.coments = coments
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func postComent(coment: Coment) {
        guard let url = URL(string: apiurl + "/coments") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(coment)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let coment = try JSONDecoder().decode(Coment.self, from: data)
                DispatchQueue.main.async {
                    self.coment = coment
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func putComent(coment: Coment) {
        guard let url = URL(string: apiurl + "/coments/\(coment._id)") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = try? JSONEncoder().encode(coment)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let coment = try JSONDecoder().decode(Coment.self, from: data)
                DispatchQueue.main.async {
                    self.coment = coment
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func deleteComent(id: String) {
        guard let url = URL(string: apiurl + "/coments/\(id)") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let coment = try JSONDecoder().decode(Coment.self, from: data)
                DispatchQueue.main.async {
                    self.coment = coment
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}