//
//  LoginStorageService.swift
//  LoginProtocolOrientedUIKit
//
//  Created by Berkay Sazak on 3.11.2023.
//

import Foundation

protocol LoginStorageService {
    var userAccessTokenKey : String {get}
    func setUserAccessToken(token: String)
    func getUserAccessToken() -> String?
}
