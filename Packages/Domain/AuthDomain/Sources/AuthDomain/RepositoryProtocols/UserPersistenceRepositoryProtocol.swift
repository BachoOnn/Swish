//
//  UserPersistenceRepositoryProtocol.swift
//  AuthDomain
//
//  Created by Bacho on 14.01.26.
//

public protocol UserPersistenceRepositoryProtocol {
    func fetchUser() -> (email: String, name: String)?
    func saveUser(email: String, name: String)
    func clear()
}
