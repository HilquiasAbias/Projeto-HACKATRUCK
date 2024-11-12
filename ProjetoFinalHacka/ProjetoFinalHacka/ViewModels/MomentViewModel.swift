//
//  FamilyViewModel.swift
//  ProjetoFinalHacka
//
//  Created by Turma02-7 on 11/11/24.
//

import Foundation

class MomentViewModel: ObservableObject {
    
    let apiurl = "http://127.0.0.1:1880"
    @Published var moments = [Moment]()
    @Published var moment: Moment? = nil

    func getMomentsById(id: String) {
        guard let url = URL(string: apiurl + "/moments/\(id)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let moment = try JSONDecoder().decode(Moment.self, from: data)
                DispatchQueue.main.async {
                    self.moments.append(moment)
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func getMomentByUserId(id: String) {
        guard let url = URL(string: apiurl + "/moments/user/\(id)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let moment = try JSONDecoder().decode(Moment.self, from: data)
                DispatchQueue.main.async {
                    self.moments.append(moment)
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func getMoments() {
        guard let url = URL(string: apiurl + "/moments") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let moments = try JSONDecoder().decode([Moment].self, from: data)
                DispatchQueue.main.async {
                    self.moments = moments
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func postMoment(moment: Moment) {
        guard let url = URL(string: apiurl + "/moments") else {
            return
        }
        
        let body = MomentPostRequest(moment: moment)
        let bodyData = try? JSONEncoder().encode(body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = bodyData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let moment = try JSONDecoder().decode(Moment.self, from: data)
                DispatchQueue.main.async {
                    self.moments.append(moment)
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func putMoment(moment: Moment) {
        guard let url = URL(string: apiurl + "/moments/\(moment._id)") else {
            return
        }
        
        let body = MomentPutRequest(moment: moment)
        let bodyData = try? JSONEncoder().encode(body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = bodyData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let moment = try JSONDecoder().decode(Moment.self, from: data)
                DispatchQueue.main.async {
                    self.moments.append(moment)
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func deleMoment(id: String) {
        guard let url = URL(string: apiurl + "/moments/\(id)") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let moment = try JSONDecoder().decode(Moment.self, from: data)
                DispatchQueue.main.async {
                    self.moments.append(moment)
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}