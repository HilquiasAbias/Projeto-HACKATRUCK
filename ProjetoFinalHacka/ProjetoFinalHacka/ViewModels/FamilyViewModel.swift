//
//  FamilyViewModel.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
//

import Foundation

class FamilyViewModel: ObservableObject {

    let apiurl = "http://127.0.0.1:1880"
    @Published var families = [Family]()
    @Published var family: Family? = nil

    func getFamilyByUserId(id: String) {
        guard let url = URL(string: apiurl + "/families/user/\(id)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let family = try JSONDecoder().decode(Family.self, from: data)
                DispatchQueue.main.async {
                    self.families.append(family)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getFamilyById(id: String) {
        guard let url = URL(string: apiurl + "/families/\(id)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let family = try JSONDecoder().decode(Family.self, from: data)
                DispatchQueue.main.async {
                    self.families.append(family)
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func getFamilies() {
        guard let url = URL(string: apiurl + "/families") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let families = try JSONDecoder().decode([Family].self, from: data)
                DispatchQueue.main.async {
                    self.families = families
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func postFamily(family: Family) {
        guard let url = URL(string: apiurl + "/families") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(family)
            request.httpBody = jsonData
        } catch {
            print(error)
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let family = try JSONDecoder().decode(Family.self, from: data)
                DispatchQueue.main.async {
                    self.families.append(family)
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func deleteFamily(id: String) {
        guard let url = URL(string: apiurl + "/families/\(id)") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let family = try JSONDecoder().decode(Family.self, from: data)
                DispatchQueue.main.async {
                    self.families.removeAll { $0.id == family.id }
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func putFamily(family: Family) {
        guard let url = URL(string: apiurl + "/families/\(family.id)") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(family)
            request.httpBody = jsonData
        } catch {
            print(error)
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let family = try JSONDecoder().decode(Family.self, from: data)
                DispatchQueue.main.async {
                    if let index = self.families.firstIndex(where: { $0.id == family.id }) {
                        self.families[index] = family
                    }
                }
            } catch {
                print(error)
            }
        }.resume()
    }   

}