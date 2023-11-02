//
//  ProtocolOrientedUIKitTests.swift
//  ProtocolOrientedUIKitTests
//
//  Created by Berkay Sazak on 1.11.2023.
//

import XCTest
@testable import ProtocolOrientedUIKit

final class ProtocolOrientedUIKitTests: XCTestCase {
    
    private var userViewModel : UserViewModel!
    private var userService : MockUserService!
    private var output : MockUserViewModelOutput!
    
    override func setUpWithError() throws {
        userService = MockUserService()
        userViewModel = UserViewModel(userService: userService)
        output = MockUserViewModelOutput()
        userViewModel.output = output
    }

    override func tearDownWithError() throws {
        userService = nil
        userViewModel = nil
    }

    func testUpdateView_whenAPISuccess_showsEmailNameUserName() throws {
        let mockUser = User(id: 1, name: "Berk", username: "Berkay", email: "mail", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "asdsad", website: "asdsda", company: Company(name: "", catchPhrase: "", bs: ""))
        
        userService.fetchUserMockResult = .success(mockUser)
        
        userViewModel.fetchUser()
        
        XCTAssertEqual(output.updateViewArray.first?.userName, "Berkay")
    }
    func testUpdateView_whenAPIFailure_showsNoUser() throws {
         
        userService.fetchUserMockResult = .failure(NSError())
        userViewModel.fetchUser()
        XCTAssertEqual(output.updateViewArray.first?.name, "No User")
    }


}

class MockUserService : UserService {
    var fetchUserMockResult : Result<ProtocolOrientedUIKit.User, Error>?
    func fetchUser(completion: @escaping (Result<ProtocolOrientedUIKit.User, Error>) -> Void) {
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
}
class MockUserViewModelOutput : UserViewModelOutput {

    var updateViewArray : [(name: String, email:String, userName: String)] = []
    func updateView(name: String, email: String, userName: String) {
        updateViewArray.append((name,email,userName))
     
        
    }
    
    
}

