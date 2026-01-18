//
//  MainDIContainer.swift
//  Swish
//
//  Created by Bacho on 04.01.26.
//

import Foundation
import AuthDomain
import GameDomain
import NewsDomain

@MainActor
public final class MainDIContainer {
    
    public let coordinator: MainCoordinator
    private let persistenceRepository: UserPersistenceRepositoryProtocol
    private let authRepository: AuthRepositoryProtocol
    private let gameRepository: GamesRepositoryProtocol
    private let newsRepository: NewsRepositoryProtocol
    
    public init(
        authRepository: AuthRepositoryProtocol,
        persistenceRepository: UserPersistenceRepositoryProtocol,
        gameRepository: GamesRepositoryProtocol,
        newsRepository: NewsRepositoryProtocol
    ) {
        self.authRepository = authRepository
        self.persistenceRepository = persistenceRepository
        self.gameRepository = gameRepository
        self.newsRepository = newsRepository
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
    
    private func makeGetNewsUseCase() -> DefaultGetNewsUseCase {
        DefaultGetNewsUseCase(newsRepository: newsRepository)
    }
    
    private func makeGetLineupsUseCase() -> DefaultGetGameLineupUseCase {
        DefaultGetGameLineupUseCase(gameRepository: gameRepository)
    }
    
    private func makeGetBoxScoreUseCase() -> DefaultGetBoxScoreUseCase {
        DefaultGetBoxScoreUseCase(gameRepository: gameRepository)
    }
    
    // MARK: - ViewModels
    
    public func makeRootViewModel() -> RootViewModel {
        RootViewModel()
    }
    
    public func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(coordinator: coordinator, getTodayGamesUseCase: makeGetTodayGamesUseCase(), getNewsUseCase: makeGetNewsUseCase())
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
    
    public func makeGameDetailsViewModel(game: Game) -> GameDetailsViewModel {
        GameDetailsViewModel(game: game, getLineupUseCase: makeGetLineupsUseCase(), getBoxScoreUseCase: makeGetBoxScoreUseCase())
    }
}
