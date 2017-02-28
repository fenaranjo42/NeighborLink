//
//  AuthenticationMockService.swift
//  Authentication
//
//  Created by Felipe Naranjo on 2/13/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import Foundation

public protocol AuthenticationServiceable {
    func login(userCredentials: UserCredentials, successHandler: @escaping () -> Void, failureHandler: @escaping ((NSError?) -> Void))
}

class AuthenticationMockService: AuthenticationServiceable {
    func login(userCredentials: UserCredentials, successHandler: @escaping () -> Void, failureHandler: @escaping ((NSError?) -> Void)) {
        let shouldMockReturnSuccess = getMockServiceresult(username: userCredentials.username)
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            if shouldMockReturnSuccess {
                successHandler()
            } else {
                failureHandler(NSError())
            }
        }
    }
    
    private func getMockServiceresult(username: String) -> Bool {
        
        var result = false
        
        if let path = Bundle.main.path(forResource: "MockAuthService", ofType: "json") {
            do {
                let data = try NSData(contentsOfFile: path, options: .mappedIfSafe) as Data
                let mockAuthServiceDictionary = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String:Any]
                let loginMocks = mockAuthServiceDictionary["login"] as! [Any]
                for loginMockItem in loginMocks {
                    if let loginMockItem = loginMockItem as? [String:String] {
                        let mockUsername = loginMockItem["username"]
                        if username == mockUsername {
                            result = loginMockItem["result"] == "success" ? true : false
                            break;
                        }
                    }
                }
            } catch {
                fatalError("Error reading mock auth service file!")
            }
        }
        return result
    }
}
