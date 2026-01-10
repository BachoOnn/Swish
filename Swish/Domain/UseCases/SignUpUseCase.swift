//
//  SignUpUseCase.swift
//  Swish
//
//  Created by Bacho on 10.01.26.
//

protocol SignUpUseCase {
    func execute(email: String, password: String, confirmPassword: String, firstName: String, lastName: String) async throws -> User
}

struct DefaultSignUpUseCase: SignUpUseCase {
    
    private let authRepository: AuthRepositoryProtocol
    
    init(authRepository: AuthRepositoryProtocol) {
        self.authRepository = authRepository
    }
    
    func execute(email: String, password: String, confirmPassword: String, firstName: String, lastName: String) async throws -> User {
        
        guard !email.isEmpty, !password.isEmpty, !firstName.isEmpty, !lastName.isEmpty else {
            throw AuthError.emptyFields
        }
        
        guard password == confirmPassword else {
            throw AuthError.passwordMismatch
        }
        
        guard password.count >= 6 else {
            throw AuthError.passwordTooShort
        }
        
        guard password.first?.isUppercase == true else {
            throw AuthError.weakPassword
        }
        
        guard isValidEmail(email) else {
            throw AuthError.invalidEmail
        }
        
        return try await authRepository.signUp(email: email, password: password)
        
    }
    private func isValidEmail(_ mail: String) -> Bool {
        mail.contains("@") && mail.contains(".com")
    }
    
}
