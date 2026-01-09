//
//  AuthDIContainer.swift
//  Auth
//
//  Created by Bacho on 04.01.26.
//

import Foundation

@MainActor
final class AuthDIContainer {
    
    // MARK: - Dependencies
    private let authService: AuthServiceProtocol
    
    init(authService: AuthServiceProtocol) {
        self.authService = authService
    }
    
    // MARK: - ViewModels
    func makeGreetingViewModel(coordinator: AuthCoordinatorProtocol) -> GreetingViewModel {
        GreetingViewModel(coordinator: coordinator)
    }
    
    func makeSignInViewModel(coordinator: AuthCoordinatorProtocol) -> SignInViewModel {
        SignInViewModel(coordinator: coordinator, authService: authService)
    }
    
    func makeSignUpViewModel(coordinator: AuthCoordinatorProtocol) -> SignUpViewModel {
        SignUpViewModel(coordinator: coordinator, authService: authService)
    }
    
    #warning("Create Repositories Here!!")
}
