//
//  UserService.swift
//  ProtocolOrientedUIKit
//
//  Created by Berkay Sazak on 1.11.2023.
//

import Foundation
protocol UserService {
    
    func fetchUser(completion : @escaping (Result<User,Error>) -> Void)
    
}
