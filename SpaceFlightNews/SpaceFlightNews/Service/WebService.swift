//
//  WebService.swift
//  SpaceFlightNews
//
//  Created by Berkay Sazak on 31.10.2023.
//

import Foundation

class WebService{
    
    
    func fetchNews(url : URL, completion: @escaping (Result<[News], NewsError>) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.serverError))
            } else if let data = data {
                let newsList = try? JSONDecoder().decode([News].self, from: data)
                
                if let newsList = newsList {
                    completion(.success(newsList))
                }else {
                    completion(.failure(.parsingError))
                }
            }
        }.resume()
    }
    
    
}

enum NewsError : Error {
    case serverError
    case parsingError
}
