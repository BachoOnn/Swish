//
//  FirebaseAuthService.swift
//  Swish
//
//  Created by Bacho on 04.01.26.
//

import UIKit
import FirebaseAuth
import AuthDomain

public final class FirebaseAuthRepository: AuthRepositoryProtocol {
    
    private let googleSignInService: GoogleSignInService
    
    public init(googleSignInService: GoogleSignInService) {
        self.googleSignInService = googleSignInService
    }
    
    public var currentUser: AuthDomain.User? {
        guard let firebaseUser = Auth.auth().currentUser else { return nil }
        
        let fallbackName = firebaseUser.email?.components(separatedBy: "@").first ?? "Swisher"
        let displayName = firebaseUser.displayName ?? fallbackName
        
        return User(
            id: firebaseUser.uid,
            email: firebaseUser.email ?? "",
            createdAt: firebaseUser.metadata.creationDate ?? Date(),
            name: displayName
        )
    }
    
    public var isAuthenticated: Bool {
        Auth.auth().currentUser != nil
    }
    
    public func signIn(email: String, password: String) async throws -> AuthDomain.User {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return User(
            id: result.user.uid,
            email: result.user.email ?? email,
            createdAt: result.user.metadata.creationDate ?? Date(),
            name: result.user.displayName ?? ""
        )
    }
    
    public func signUp(email: String, password: String) async throws -> AuthDomain.User {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        return User(
            id: result.user.uid,
            email: result.user.email ?? email,
            createdAt: result.user.metadata.creationDate ?? Date(),
            name: result.user.displayName ?? ""
        )
    }
    
    public func signInWithGoogle() async throws -> AuthDomain.User {
        let (idToken, accessToken) = try await googleSignInService.signIn()
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        let authResult = try await Auth.auth().signIn(with: credential)
        
        return User(
            id: authResult.user.uid,
            email: authResult.user.email ?? "",
            createdAt: authResult.user.metadata.creationDate ?? Date(),
            name: authResult.user.displayName ?? ""
        )
    }
    
    public func signOut() throws {
        googleSignInService.signOut()
        try Auth.auth().signOut()
    }
}
