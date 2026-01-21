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
    
    private let authRepository: AuthRepositoryProtocol
    
    public init() {
        let googleService = GoogleSignInService()
        self.authRepository = FirebaseAuthRepository(googleSignInService: googleService)
    }
    
    // MARK: - ViewModels
    public func makeGreetingViewModel(coordinator: AuthCoordinatorProtocol) -> GreetingViewModel {
        GreetingViewModel(coordinator: coordinator)
    }
    
    public func makeSignInViewModel(coordinator: AuthCoordinatorProtocol) -> SignInViewModel {
        SignInViewModel(
            coordinator: coordinator,
            signInUseCase: DefaultSignInUseCase(authRepository: authRepository),
            googleSignInUseCase: DefaultGoogleSignInUseCase(authRepository: authRepository)
        )
    }
    
    public func makeSignUpViewModel(coordinator: AuthCoordinatorProtocol) -> SignUpViewModel {
        SignUpViewModel(
            coordinator: coordinator,
            signUpUseCase: DefaultSignUpUseCase(authRepository: authRepository)
        )
    }
}
