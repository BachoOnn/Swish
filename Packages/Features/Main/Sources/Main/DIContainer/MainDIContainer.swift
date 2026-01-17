//
//  MainDIContainer.swift
//  Swish
//
//  Created by Bacho on 04.01.26.
//

import Foundation
import AuthDomain
import GameDomain

@MainActor
public final class MainDIContainer {
    
    // MARK: - Coordinator
    public let coordinator: MainCoordinator
    private let persistenceRepository: UserPersistenceRepositoryProtocol
    private let authRepository: AuthRepositoryProtocol
    private let gameRepository: GamesRepositoryProtocol
    
    public init(
        authRepository: AuthRepositoryProtocol,
        persistenceRepository: UserPersistenceRepositoryProtocol,
        gameRepository: GamesRepositoryProtocol
    ) {
        self.authRepository = authRepository
        self.persistenceRepository = persistenceRepository
        self.gameRepository = gameRepository
        self.coordinator = MainCoordinator()
    }
    
    public func handleSignOut() {
        try? authRepository.signOut()
        persistenceRepository.clear()
    }
    
    // MARK: - Usecases

    private func makeGetTodayGamesUseCase() -> DefaultGetTodayGamesUseCase {
        DefaultGetTodayGamesUseCase(gamesRepository: gameRepository)
    }
    
    private func makeGetGamesUseCase() -> DefaultGetGamesUseCase {
        DefaultGetGamesUseCase(gamesRepository: gameRepository)
    }
    
    // MARK: - ViewModels
    
    public func makeRootViewModel() -> RootViewModel {
        RootViewModel()
    }
    
    public func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(coordinator: coordinator)
    }
    
    public func makeGamesViewModel() -> GamesViewModel {
        GamesViewModel(coordinator: coordinator, getTodayGamesUseCase: makeGetTodayGamesUseCase(), getGamesUseCase: makeGetGamesUseCase())
    }
    
    public func makeProfileViewModel() -> ProfileViewModel {
        let useCase = DefaultGetProfileUseCase(
            authRepository: authRepository,
            persistenceRepository: persistenceRepository
        )
        return ProfileViewModel(coordinator: coordinator, getProfileUseCase: useCase)
    }
    
    public func makeDiscoverViewModel() -> DiscoverViewModel {
        DiscoverViewModel()
    }
    
    public func makeSearchViewModel() -> SearchViewModel {
        SearchViewModel(coordinator: coordinator)
    }
    
    public func makePlayerViewModel(player: PlayerSeasonAverages) -> PlayerViewModel {
        PlayerViewModel(player: player)
    }
    
    public func makeTeamViewModel(team: TeamSeasonAverages) -> TeamViewModel {
        TeamViewModel(team: team)
    }
}
