//
//  GoogleSignInUseCase.swift
//  Swish
//
//  Created by Bacho on 10.01.26.
//

protocol GoogleSignInUseCase {
    func execute() async throws -> User
}

struct DefaultGoogleSignInUseCase: GoogleSignInUseCase {
    
    private let authRepository: AuthRepositoryProtocol
    
    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }
    
    func execute() async throws -> User {
        try await authRepository.signInWithGoogle()
    }
}
