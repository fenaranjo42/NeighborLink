//
//  LoginResult.swift
//  Authentication
//
//  Created by Felipe Naranjo on 2/13/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import Foundation

public enum LoginResult {
    case Success(UserCredentials)
    case Failure(NSError?)
    
    func value() -> Any? {
        switch self {
        case .Success(let credentials):
            return credentials
        case .Failure(let error):
            return error
        }
    }
}

extension LoginResult: Equatable {
}

public func == (lhs: LoginResult, rhs: LoginResult) -> Bool {
    switch (lhs, rhs) {
    case (let .Success(userCredentials), let .Success(userCredentials2)):
        return userCredentials.username == userCredentials2.username
    case (let .Failure(error1), let .Failure(error2)):
        return error1 == error2
    default:
        return false
    }
}
