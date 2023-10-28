//
//  UserViewModel.swift
//  ProtocolOrientedProject
//
//  Created by Berkay Sazak on 28.10.2023.
//

import Foundation

class UserViewModel {
    
    //dependency injection
    private let userService : UserService
    
    //deleget pattern
    var deleget : UserViewModelOutput?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUsers() {
        
        userService.fetchUser { result in
            switch result {
            case .success(let user):
                self.deleget?.updateView(name: user.name, username: user.username, email: user.email)
            case .failure(_):
                self.deleget?.updateView(name: "No User", username: "", email: "")
            }
        }        
    }
    
    
    
}
