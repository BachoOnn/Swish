//
//  GoogleSignInService.swift
//  Swish
//
//  Created by Bacho on 04.01.26.
//

import UIKit
import GoogleSignIn
import FirebaseCore

public final class GoogleSignInService {
    
    public init() {}
    
    @MainActor
    public func signIn() async throws -> (idToken: String, accessToken: String) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            throw NSError(domain: "No window scene", code: -1)
        }
        
        guard let rootViewController = windowScene.windows.first?.rootViewController else {
            throw NSError(domain: "No root view controller", code: -2)
        }
        
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            throw NSError(domain: "No client ID - check GoogleService-Info.plist", code: -3)
        }
                
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: clientID)
        let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
        
        guard let idToken = result.user.idToken?.tokenString else {
            throw NSError(domain: "No ID token", code: -4)
        }
        
        return (idToken, result.user.accessToken.tokenString)
    }
    
    public func signOut() {
        GIDSignIn.sharedInstance.signOut()
    }
}
