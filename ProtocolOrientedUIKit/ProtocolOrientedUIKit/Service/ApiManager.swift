//
//  ApiManager.swift
//  ProtocolOrientedUIKit
//
//  Created by Berkay Sazak on 1.11.2023.
//

import Foundation



class ApiManager : UserService {
    
    static let shared = ApiManager()
    init () {}
    
    
    func fetchUser(completion : @escaping (Result<User,Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) {data, res, error in
            guard let data = data else {return}
                DispatchQueue.main.async {
                    if let user = try? JSONDecoder().decode([User].self, from: data).first {
                        completion(.success(user))
                    } else {
                        completion(.failure(NSError()))
                    }
                }
        }.resume()
    }
    
}
