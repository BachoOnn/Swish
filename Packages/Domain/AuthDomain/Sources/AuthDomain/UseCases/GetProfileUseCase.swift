//
//  GetProfileUseCase.swift
//  AuthDomain
//
//  Created by Bacho on 14.01.26.
//

protocol GetProfileUseCase {
    func execute() -> (email: String, name: String)
}

public struct DefaultGetProfileUseCase: GetProfileUseCase {
    private let authRepository: AuthRepositoryProtocol
    private let persistenceRepository: UserPersistenceRepositoryProtocol
    
    public init(authRepository: AuthRepositoryProtocol, persistenceRepository: UserPersistenceRepositoryProtocol) {
        self.authRepository = authRepository
        self.persistenceRepository = persistenceRepository
    }
    
    public func execute() -> (email: String, name: String) {
        if let savedUser = persistenceRepository.fetchUser() {
            return savedUser
        }
        
        let email = authRepository.currentUser?.email ?? "Guest"
        let name = authRepository.currentUser?.name ?? "Anonymous"
        return (email: email, name: name)
    }
}
