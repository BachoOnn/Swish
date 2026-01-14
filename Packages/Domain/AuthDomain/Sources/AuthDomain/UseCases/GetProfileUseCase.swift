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
    private let authRepo: AuthRepositoryProtocol
    private let persistenceRepo: UserPersistenceRepositoryProtocol
    
    public init(authRepo: AuthRepositoryProtocol, persistenceRepo: UserPersistenceRepositoryProtocol) {
        self.authRepo = authRepo
        self.persistenceRepo = persistenceRepo
    }
    
    public func execute() -> (email: String, name: String) {
        if let savedUser = persistenceRepo.fetchUser() {
            return savedUser
        }
        
        let email = authRepo.currentUser?.email ?? "Guest"
        let name = authRepo.currentUser?.name ?? "Anonymous"
        return (email: email, name: name)
    }
}
