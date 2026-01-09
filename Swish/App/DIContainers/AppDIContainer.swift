//
//  AppDIContainer.swift
//  Auth
//
//  Created by Bacho on 04.01.26.
//

import Foundation

@MainActor
final class AppDIContainer {
    
    // MARK: - Sub-Containers
    lazy var authDIContainer = AuthDIContainer()
    lazy var mainDIContainer = MainDIContainer()
    
    // MARK: - Services (Add later when implementing Firebase)
    // lazy var authService: AuthServiceProtocol = FirebaseAuthService()
    // lazy var playerRepository: PlayerRepositoryProtocol = DefaultPlayerRepository()
}
