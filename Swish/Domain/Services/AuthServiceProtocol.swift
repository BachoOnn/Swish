//
//  AuthServiceProtocol.swift
//  Auth
//
//  Created by Bacho on 04.01.26.
//

protocol AuthServiceProtocol {
    func signIn(email: String, password: String) async throws -> User
    func signUp(email: String, password: String) async throws -> User
    func signInWithGoogle() async throws -> User
    func signOut() throws
    
    var currentUser: User? { get }
    var isAuthenticated: Bool { get }
}
