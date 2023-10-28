//
//  UserModel.swift
//  ProtocolOrientedProject
//
//  Created by Berkay Sazak on 28.10.2023.
//

import Foundation

struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: String
    let phone, website: String
    let company: String
}

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat, lng: String
}

struct Company: Codable {
    let name, catchPhrase, bs: String
}


