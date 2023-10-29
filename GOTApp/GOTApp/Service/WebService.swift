//
//  WebService.swift
//  GOTApp
//
//  Created by Berkay Sazak on 28.10.2023.
//

import Foundation

class WebService {
    
    func fetchGOT(url: URL, completion: @escaping (Result<[GameOfThrones], GOTError>) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(.serverError))
            }
            else if let data = data {
               let GOTList = try? JSONDecoder().decode([GameOfThrones].self, from: data)
            
                if let GOTList = GOTList {
                    completion(.success(GOTList))
                   
                }else {
                    completion(.failure(.parsingError))
              
                }
            }
        }.resume()
    }
    
}

enum GOTError : Error{
    case serverError
    case parsingError
    
}
