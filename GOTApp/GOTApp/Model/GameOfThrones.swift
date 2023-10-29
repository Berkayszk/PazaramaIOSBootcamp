//
//  GameOfThrones.swift
//  GOTApp
//
//  Created by Berkay Sazak on 28.10.2023.
//

import Foundation

struct GameOfThrones: Codable {
    let id: Int
    let firstName, lastName, fullName, title: String
    let family, image: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, fullName, title, family, image
        case imageURL = "imageUrl"
    }
}
    
    

