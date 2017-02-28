//
//  AuthenticatorTests.swift
//  Authentication
//
//  Created by Felipe Naranjo on 2/14/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import XCTest
@testable import Authentication

class AuthenticatorTests: XCTestCase {
    
    var classUnderTest: Authenticator!
    var mockAuthenticationService = MockAuthenticationService()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        classUnderTest = Authenticator(authenticationService: mockAuthenticationService)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_loginSucess_LoginResultIsSuccessFull_WithValidUserCredentials() {
        // Arrange
        let e = expectation(description: "Wait for login success")
        let userCredentials = UserCredentials(username: "user1@gmail.com", password: "123456")
        var actual: LoginResult?
        
        // Act
        classUnderTest.login(userCredentials: userCredentials) { result in
            actual = result
            e.fulfill()
        }
        
        waitForExpectations(timeout: 3, handler: nil)
        let expected = LoginResult.Success(userCredentials)
        XCTAssertEqual(actual, expected)
        XCTAssertTrue(mockAuthenticationService.loginCalled())
    }
    
    
    
}

class MockAuthenticationService: AuthenticationServiceable {
    
    var loginCallCount = 0
    
    var error: NSError?
    var isSuccess: Bool = true
    var successHandler: (() -> Void)? = nil
    var failureHandler: ((NSError?) -> Void)? = nil
    
    func login(userCredentials: UserCredentials, successHandler: @escaping () -> Void, failureHandler: @escaping ((NSError?) -> Void)) {
        loginCallCount += 1
        return isSuccess ? successHandler() : failureHandler(error!)
    }
    
    func loginCalled() -> Bool {
        return loginCallCount > 0
    }
}
