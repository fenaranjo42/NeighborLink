//
//  UserCredentials.swift
//  Authentication
//
//  Created by Felipe Naranjo on 2/13/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import Foundation

public struct UserCredentials {
    
    public private(set) var username: String
    public private(set) var password: String
    
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

extension UserCredentials {
    func toDictionary() -> Dictionary<String, String> {
        return ["username": username, "password": password]
    }
}
