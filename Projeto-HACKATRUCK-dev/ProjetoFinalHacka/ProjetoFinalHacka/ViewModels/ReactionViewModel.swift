import Foundation

class ReactionViewModel: ObservableObject {
    
    let apiurl = "http://127.0.0.1:1880"
    @Published var reactions = [Reaction]()
    @Published var reaction: Reaction? = nil

    func getReactionsByMomentId(id: String) {
        guard let url = URL(string: apiurl + "/reactions/moment/\(id)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let reaction = try JSONDecoder().decode(Reaction.self, from: data)
                DispatchQueue.main.async {
                    self.reactions.append(reaction)
                }
            } catch {
                print(error)
            }
        }.resume()
    } 

    func getReactionsByUserId(id: String) {
        guard let url = URL(string: apiurl + "/reactions/user/\(id)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let reaction = try JSONDecoder().decode(Reaction.self, from: data)
                DispatchQueue.main.async {
                    self.reactions.append(reaction)
                }
            } catch {
                print(error)
            }
        }.resume()
    }   

    func getReactions() {
        guard let url = URL(string: apiurl + "/reactions") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let reaction = try JSONDecoder().decode(Reaction.self, from: data)
                DispatchQueue.main.async {
                    self.reactions.append(reaction)
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func postReaction(reaction: Reaction) {
        guard let url = URL(string: apiurl + "/reactions") else {
            return
        }
        
        //let reaction = Reaction(_id: reaction._id, _rev: reaction._rev, user: reaction.user, moment: reaction.moment, type: reaction.type, createdat: reaction.createdat)
        
        guard let encoded = try? JSONEncoder().encode(reaction) else {
            print("Failed to encode reaction")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let reaction = try JSONDecoder().decode(Reaction.self, from: data)
                DispatchQueue.main.async {
                    self.reaction = reaction
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func putReaction(reaction: Reaction) {
        guard let url = URL(string: apiurl + "/reactions/\(reaction._id)") else {
            return
        }
        
        guard let encoded = try? JSONEncoder().encode(reaction) else {
            print("Failed to encode reaction")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let reaction = try JSONDecoder().decode(Reaction.self, from: data)
                DispatchQueue.main.async {
                    self.reaction = reaction
                }
            } catch {
                print(error)
            }
        }.resume()
    }

    func deleteReactionById(id: String) {
        guard let url = URL(string: apiurl + "/reactions/\(id)") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                return
            }
        }.resume()
    }
}