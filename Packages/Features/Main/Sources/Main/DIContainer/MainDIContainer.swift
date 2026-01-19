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
import TeamDomain
import PlayerDomain

@MainActor
public final class MainDIContainer {
    
    public let coordinator: MainCoordinator
    private let persistenceRepository: UserPersistenceRepositoryProtocol
    private let authRepository: AuthRepositoryProtocol
    private let gameRepository: GamesRepositoryProtocol
    private let newsRepository: NewsRepositoryProtocol
    private let teamsRepository: TeamsRepositoryProtocol
    private let playersRepository: PlayersRepositoryProtocol
    
    public init(
        authRepository: AuthRepositoryProtocol,
        persistenceRepository: UserPersistenceRepositoryProtocol,
        gameRepository: GamesRepositoryProtocol,
        newsRepository: NewsRepositoryProtocol,
        teamsRepository: TeamsRepositoryProtocol,
        playersRepository: PlayersRepositoryProtocol
    ) {
        self.authRepository = authRepository
        self.persistenceRepository = persistenceRepository
        self.gameRepository = gameRepository
        self.newsRepository = newsRepository
        self.teamsRepository = teamsRepository
        self.playersRepository = playersRepository
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
    
    private func makeGetTeamsUseCase() -> DefaultGetTeamsUseCase {
        DefaultGetTeamsUseCase(teamsRepository: teamsRepository)
    }
    
    private func makeGetTeamStatsUseCase() -> DefaultGetTeamStatsUseCase {
        DefaultGetTeamStatsUseCase(teamRepository: teamsRepository)
    }
    
    private func makeGetPlayersUseCase() -> DefaultGetPlayerUseCase {
        DefaultGetPlayerUseCase(playersRepository: playersRepository)
    }
    
    private func makeGetPlayersStatsUseCase() -> DefaultGetPlayerStatsUseCase {
        DefaultGetPlayerStatsUseCase(playersRepository: playersRepository)
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
        SearchViewModel(coordinator: coordinator, getTeamsUseCase: makeGetTeamsUseCase(), getPlayersUseCase: makeGetPlayersUseCase())
    }
    
    public func makePlayerViewModel(player: PlayerDomain.Player) -> PlayerViewModel {
        PlayerViewModel(player: player, getPlayerStatsUseCase: makeGetPlayersStatsUseCase())
    }
    
    public func makeTeamViewModel(team: TeamDomain.Team) -> TeamViewModel {
        TeamViewModel(team: team, getTeamStatsUseCase: makeGetTeamStatsUseCase())
    }
    
    public func makeGameDetailsViewModel(game: Game) -> GameDetailsViewModel {
        GameDetailsViewModel(game: game, getLineupUseCase: makeGetLineupsUseCase(), getBoxScoreUseCase: makeGetBoxScoreUseCase())
    }
}
