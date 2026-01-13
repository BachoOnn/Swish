//
//  AuthDIContainer.swift
//  Swish
//
//  Created by Bacho on 04.01.26.
//

import Foundation
import AuthDomain
import FirebaseService

@MainActor
public final class AuthDIContainer {
    
    // MARK: - Dependencies
    private let authRepository: AuthRepositoryProtocol
    
    public init(authService: AuthRepositoryProtocol) {
        self.authRepository = authService
    }
    
    // MARK: - Usecases
    
    private func makeSignInUseCase() -> DefaultSignInUseCase {
        DefaultSignInUseCase(authRepository: authRepository)
    }
    
    private func makeSignUpUseCase() -> DefaultSignUpUseCase {
        DefaultSignUpUseCase(authRepository: authRepository)
    }
    
    private func makeGoogleSignInUseCase() -> DefaultGoogleSignInUseCase {
        DefaultGoogleSignInUseCase(authRepository: authRepository)
    }
    // MARK: - ViewModels
    public func makeGreetingViewModel(coordinator: AuthCoordinatorProtocol) -> GreetingViewModel {
        GreetingViewModel(coordinator: coordinator)
    }
    
    public func makeSignInViewModel(coordinator: AuthCoordinatorProtocol) -> SignInViewModel {
        SignInViewModel(
            coordinator: coordinator,
            signInUseCase: makeSignInUseCase(),
            googleSignInUseCase: makeGoogleSignInUseCase()
        )
    }
    
    public func makeSignUpViewModel(coordinator: AuthCoordinatorProtocol) -> SignUpViewModel {
        SignUpViewModel(
            coordinator: coordinator,
            signUpUseCase: makeSignUpUseCase()
        )
    }
}
