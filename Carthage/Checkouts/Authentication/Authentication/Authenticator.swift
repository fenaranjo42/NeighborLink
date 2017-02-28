//
//  Authenticator.swift
//  Authentication
//
//  Created by Felipe Naranjo on 2/13/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import Foundation

protocol AuthenticatorDelegate: class {
    func didStartLogingServiceCall()
    func didFinishLoginServiceCall()
}

/// Class for interacting with the authenticator services
class Authenticator {
    
    weak var delegate: AuthenticatorDelegate?
    
    private var authenticationService: AuthenticationServiceable!
    
    init(authenticationService: AuthenticationServiceable = AuthenticationMockService()) {
        self.authenticationService = authenticationService
    }
    
    func login(userCredentials: UserCredentials, callback: @escaping (LoginResult) -> ()) {
        callLoginService(userCredentials: userCredentials, callback: callback)
    }
    
    private func callLoginService(userCredentials: UserCredentials, callback: @escaping (_ result: LoginResult) -> ()) {
        delegate?.didStartLogingServiceCall()
        
        authenticationService.login(userCredentials: userCredentials,
            successHandler: {
                self.delegate?.didFinishLoginServiceCall()
                DispatchQueue.main.async(execute: {
                    callback(.Success(userCredentials))
                })},
            failureHandler: { error in
                self.delegate?.didFinishLoginServiceCall()
                DispatchQueue.main.async(execute: {
                    callback(.Failure(NSError()))
                })
        })
    }
    
    
    
}
