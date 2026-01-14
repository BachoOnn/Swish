//
//  KeychainUserRepository.swift
//  PersistanceService
//
//  Created by Bacho on 14.01.26.
//

import AuthDomain
import Foundation

enum KeyName: String {
    case userEmail
    case userName
}

public final class KeychainUserRepository: UserPersistenceRepositoryProtocol {
    private let keychainWrapper = KeychainWrapper()
    
    public init() {}
    
    public func fetchUser() -> (email: String, name: String)? {
        guard let email = keychainWrapper.get(forKey: KeyName.userEmail.rawValue),
              let name = keychainWrapper.get(forKey: KeyName.userName.rawValue) else {
            return nil
        }
        return (email, name)
    }
    
    public func saveUser(email: String, name: String) {
        keychainWrapper.set(email, forKey: KeyName.userEmail.rawValue)
        keychainWrapper.set(name, forKey: KeyName.userName.rawValue)
    }
    
    public func clear() {
        keychainWrapper.delete(forKey: KeyName.userEmail.rawValue)
        keychainWrapper.delete(forKey: KeyName.userName.rawValue)
    }
}
