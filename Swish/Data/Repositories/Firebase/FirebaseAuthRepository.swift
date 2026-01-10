//
//  FirebaseAuthService.swift
//  Swish
//
//  Created by Bacho on 04.01.26.
//

import UIKit
import FirebaseAuth

final class FirebaseAuthRepository: AuthRepositoryProtocol {
    
    private let googleSignInService: GoogleSignInService
    
    init(googleSignInService: GoogleSignInService) {
        self.googleSignInService = googleSignInService
    }
    
    var currentUser: User? {
        guard let firebaseUser = Auth.auth().currentUser else { return nil }
        return User(
            id: firebaseUser.uid,
            email: firebaseUser.email ?? "",
            createdAt: firebaseUser.metadata.creationDate ?? Date()
        )
    }
    
    var isAuthenticated: Bool {
        Auth.auth().currentUser != nil
    }
    
    func signIn(email: String, password: String) async throws -> User {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return User(
            id: result.user.uid,
            email: result.user.email ?? email,
            createdAt: result.user.metadata.creationDate ?? Date()
        )
    }
    
    func signUp(email: String, password: String) async throws -> User {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        return User(
            id: result.user.uid,
            email: result.user.email ?? email,
            createdAt: result.user.metadata.creationDate ?? Date()
        )
    }
    
    func signInWithGoogle() async throws -> User {
        let (idToken, accessToken) = try await googleSignInService.signIn()
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        let authResult = try await Auth.auth().signIn(with: credential)
        
        return User(
            id: authResult.user.uid,
            email: authResult.user.email ?? "",
            createdAt: authResult.user.metadata.creationDate ?? Date()
        )
    }
    
    func signOut() throws {
        googleSignInService.signOut()
        try Auth.auth().signOut()
    }
}
