//
//  GoogleSignInUseCase.swift
//  Swish
//
//  Created by Bacho on 10.01.26.
//

protocol GoogleSignInUseCase {
    func execute() async throws -> User
}

public struct DefaultGoogleSignInUseCase: GoogleSignInUseCase {
    
    private let authRepository: AuthRepositoryProtocol
    
    public init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }
    
    public func execute() async throws -> User {
        try await authRepository.signInWithGoogle()
    }
}
