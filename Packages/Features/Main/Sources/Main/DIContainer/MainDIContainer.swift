//
//  MainDIContainer.swift
//  Swish
//
//  Created by Bacho on 04.01.26.
//

import Foundation
import AuthDomain

@MainActor
public final class MainDIContainer {
    
    // MARK: - Coordinator
    public let coordinator: MainCoordinator
    private let persistenceRepository: UserPersistenceRepositoryProtocol
    private let authRepository: AuthRepositoryProtocol
    
    public init(authRepository: AuthRepositoryProtocol,
                persistenceRepository: UserPersistenceRepositoryProtocol) {
        self.authRepository = authRepository
        self.persistenceRepository = persistenceRepository
        self.coordinator = MainCoordinator()
    }
    
    public func handleSignOut() {
        try? authRepository.signOut()
        persistenceRepository.clear()
    }
    
    // MARK: - ViewModels
    
    public func makeRootViewModel() -> RootViewModel {
        RootViewModel()
    }
    
    public func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(coordinator: coordinator)
    }
    
    public func makeGamesViewModel() -> GamesViewModel {
        GamesViewModel(coordinator: coordinator)
    }
    
    public func makeProfileViewModel() -> ProfileViewModel {
        let useCase = DefaultGetProfileUseCase(
            authRepo: authRepository,
            persistenceRepo: persistenceRepository
        )
        return ProfileViewModel(coordinator: coordinator, getProfileUseCase: useCase)
    }
    
    public func makeDiscoverViewModel() -> DiscoverViewModel {
        DiscoverViewModel()
    }
}
