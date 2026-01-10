//
//  AppDIContainer.swift
//  Swish
//
//  Created by Bacho on 04.01.26.
//

import Foundation

@MainActor
final class AppDIContainer {
    
    let authService: AuthRepositoryProtocol
    let authDIContainer: AuthDIContainer
    let mainDIContainer: MainDIContainer
    
    init() {
        let googleService = GoogleSignInService()
        self.authService = FirebaseAuthRepository(googleSignInService: googleService)
        self.authDIContainer = AuthDIContainer(authService: authService)
        self.mainDIContainer = MainDIContainer()
    }
}
