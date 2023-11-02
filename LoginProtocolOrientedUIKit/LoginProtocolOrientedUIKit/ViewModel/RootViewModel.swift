//
//  RootViewModel.swift
//  LoginProtocolOrientedUIKit
//
//  Created by Berkay Sazak on 3.11.2023.
//

import Foundation

class RootViewModel {
    
    private let loginStorageService : LoginStorageService
    
    weak var output : RootViewModelOutput?
    
    init(loginStorageService: LoginStorageService, output: RootViewModelOutput? = nil) {
        self.loginStorageService = loginStorageService
        self.output = output
    }
    
    func checkLogin () {
        if let accessToken = loginStorageService.getUserAccessToken(), !accessToken.isEmpty {
            output?.showMainApp()
        } else {
            output?.showLogin()
        }
    }
}
