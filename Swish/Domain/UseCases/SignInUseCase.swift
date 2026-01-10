//
//  SignInUseCase.swift
//  Swish
//
//  Created by Bacho on 10.01.26.
//

protocol SignInUseCase {
    func execute(email: String, password: String) async throws -> User
}

struct DefaultSignInUseCase: SignInUseCase {
    
    private let authRepository: AuthRepositoryProtocol
    
    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }
    
    func execute(email: String, password: String) async throws -> User {
        
        guard !email.isEmpty else {
            throw AuthError.emptyEmail
        }
        
        guard !password.isEmpty else {
            throw AuthError.emptyPassword
        }
        
        guard isValidEmail(email) else {
            throw AuthError.invalidEmail
        }
        
        return try await authRepository.signIn(email: email, password: password)
    }
    
    private func isValidEmail(_ mail: String) -> Bool {
        mail.contains("@") && mail.contains(".com")
    }
}
