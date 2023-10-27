//
//  Crypto.swift
//  CryptoAppSwfitUI
//
//  Created by Berkay Sazak on 27.10.2023.
//

import Foundation
struct Crypto: Decodable, Hashable, Identifiable{
    let id = UUID()
    let currency: String
    let price: String
}

private enum CodingKeys: String, CodingKey{
    case currency = "currency"
    case price = "price"
}
