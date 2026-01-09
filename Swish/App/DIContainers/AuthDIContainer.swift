//
//  AuthDIContainer.swift
//  Auth
//
//  Created by Bacho on 04.01.26.
//

import Foundation

@MainActor
final class AuthDIContainer {
    
    // MARK: - Dependencies (Add when implementing Clean Architecture)
    // private let authService: AuthServiceProtocol
    
    // MARK: - ViewModels
    func makeGreetingViewModel(coordinator: AuthCoordinatorProtocol) -> GreetingViewModel {
        GreetingViewModel(coordinator: coordinator)
    }
    
    func makeSignInViewModel(coordinator: AuthCoordinatorProtocol) -> SignInViewModel {
        SignInViewModel(coordinator: coordinator)
    }
    
    func makeSignUpViewModel(coordinator: AuthCoordinatorProtocol) -> SignUpViewModel {
        SignUpViewModel(coordinator: coordinator)
    }
    
    // MARK: - Future Clean Architecture Dependencies
    // func makeSignInUseCase() -> SignInUseCase {
    //     SignInUseCaseImpl(authRepository: authRepository)
    // }
    //
    // func makeSignUpUseCase() -> SignUpUseCase {
    //     SignUpUseCaseImpl(authRepository: authRepository)
    // }
}
