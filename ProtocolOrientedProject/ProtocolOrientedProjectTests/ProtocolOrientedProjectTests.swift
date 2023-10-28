//
//  ProtocolOrientedProjectTests.swift
//  ProtocolOrientedProjectTests
//
//  Created by Berkay Sazak on 28.10.2023.
//

import XCTest
@testable import ProtocolOrientedProject

final class ProtocolOrientedProjectTests: XCTestCase {

    private var viewModel : UserViewModel!
    private var userService : MockUserService!
    private var output : MockuserViewModelOutput
    
    
    override func setUpWithError() throws {
        userService = MockUserService()
        viewModel = UserViewModel(userService: userService)
        output = MockuserViewModelOutput()
        viewModel.deleget = output
        
    }

    override func tearDownWithError() throws {
        viewModel = nil
        userService = nil
    }
    
    func testUpdateView_whenAPISuccess_showsEmailNameUserName() throws {
        //given - when - then
        
        
        let mockUser = User(id: 1, name: "berk", username: "berkoszk", email: "berk@mail.com", address: "asdasd", phone: "12321", website: "asdsd", company: "asdad")
        
        userService.fetchUserMockResult = .success(mockUser)
        
        viewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.count, 1)
    }
    
    func testUpdateView_whenAPIFailture_showsNoUser() throws {
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    class MockUserService : UserService {
        var fetchUserMockResult : Result<User, Error>?
        func fetchUser(completion: @escaping (Result<User, Error>) -> ()) {
            if let result = fetchUserMockResult {
                    completion(result)
            }
        }
    }
    
    class MockuserViewModelOutput : UserViewModelOutput {
        
        var updateViewArray : [(name:String, username:String, email:String)] = []
        func updateView(name: String, username: String, email: String) {
            updateViewArray.append((name,username,email))
        }
        
    }

}
