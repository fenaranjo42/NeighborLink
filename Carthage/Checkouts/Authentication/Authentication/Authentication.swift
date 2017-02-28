//
//  Authentication.swift
//  Authentication
//
//  Created by Felipe Naranjo on 2/13/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import Foundation

/**
 Authentication Delegate. This delegate method will notify caller for detailed actions from authentication framework.
 */
public protocol AuthenticationDelegate: class {
    
    /// Notifies the caller when the login service call is started.
    func didStartSigningIn()
    
    /// Notifies the caller when the login service call is finished.
    func didFinishSigningIn()
}

/**
 Authentication protocol. Use this class to authenticate a user
 */
public protocol Authenticating {
    
    var delegate: AuthenticationDelegate? { get set }
    
    /**
     Performs login with user credentials. 
     - Parameters:
        - userCredentials: User Credentials class username and password
        - callback: Closure to return login result
     
     -  Returns:
    */
    func login(userCredentials: UserCredentials, callback: @escaping (LoginResult) -> ())
}

/**
 Authentication class. Use this class to authenticate a user
 */
open class Authentication: Authenticating, AuthenticatorDelegate {
    
    public var delegate: AuthenticationDelegate?
    
    private let authenticator = Authenticator()
    
    public init() {
        authenticator.delegate = self
    }
    
    open func login(userCredentials: UserCredentials, callback: @escaping (LoginResult) -> ()) {
        authenticator.login(userCredentials: userCredentials, callback: callback)
    }
    
    internal func didStartLogingServiceCall() {
        delegate?.didStartSigningIn()
    }
    
    internal func didFinishLoginServiceCall() {
        delegate?.didFinishSigningIn()
    }
    
}


