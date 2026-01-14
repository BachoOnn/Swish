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
    public init() {}
    
    public func fetchUser() -> (email: String, name: String)? {
        let email = UserDefaults.standard.string(forKey: KeyName.userEmail.rawValue)
        let name = UserDefaults.standard.string(forKey: KeyName.userName.rawValue)
        
        guard let email, let name else { return nil }
        return (email, name)
    }
    
    public func saveUser(email: String, name: String) {
        UserDefaults.standard.set(email, forKey: KeyName.userEmail.rawValue)
        UserDefaults.standard.set(name, forKey: KeyName.userName.rawValue)
    }
    
    public func clear() {
        UserDefaults.standard.removeObject(forKey: KeyName.userEmail.rawValue)
        UserDefaults.standard.removeObject(forKey: KeyName.userName.rawValue)
    }
}
