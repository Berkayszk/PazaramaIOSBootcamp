//
//  WebService.swift
//  CryptoAppSwfitUI
//
//  Created by Berkay Sazak on 27.10.2023.
//

import Foundation
class WebService {
    
    
    func downloadCurrencyAsync(url: URL) async throws -> [Crypto] {
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let currencyList = try? JSONDecoder().decode([Crypto].self, from: data)
        return currencyList ?? []
    }
    
    func downloadCurrency(url : URL, completion: @escaping (Result<[Crypto], CryptoError>) -> () ){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(.failure(.badUrl))
            }
            guard let data = data, error == nil else {
                return completion(.failure(.serverError))
            }
            
            guard let currencyList = try? JSONDecoder().decode([Crypto].self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            
            completion(.success(currencyList))
        }.resume()
        
        
        
    }
    
    enum CryptoError : Error {
        
        case badUrl
        case decodingError
        case serverError
        
    }
    
    struct CryptoViewModel{
        let crypto: Crypto
        
        var id: UUID? {
            crypto.id
        }
        var currency: String{
            crypto.currency
        }
        var price: String{
            crypto.price
        }
    }

    
    
    
}
