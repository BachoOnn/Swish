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
import FavoritesDomain

@MainActor
public final class MainDIContainer {
    
    public let coordinator: MainCoordinator
    private let persistenceRepository: UserPersistenceRepositoryProtocol
    private let authRepository: AuthRepositoryProtocol
    private let gameRepository: GamesRepositoryProtocol
    private let newsRepository: NewsRepositoryProtocol
    private let teamsRepository: TeamsRepositoryProtocol
    private let playersRepository: PlayersRepositoryProtocol
    private let favoritesRepository: FavoritesRepositoryProtocol
    
    public init(
        authRepository: AuthRepositoryProtocol,
        persistenceRepository: UserPersistenceRepositoryProtocol,
        gameRepository: GamesRepositoryProtocol,
        newsRepository: NewsRepositoryProtocol,
        teamsRepository: TeamsRepositoryProtocol,
        playersRepository: PlayersRepositoryProtocol,
        favoritesRepository: FavoritesRepositoryProtocol
    ) {
        self.authRepository = authRepository
        self.persistenceRepository = persistenceRepository
        self.gameRepository = gameRepository
        self.newsRepository = newsRepository
        self.teamsRepository = teamsRepository
        self.playersRepository = playersRepository
        self.favoritesRepository = favoritesRepository
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
        HomeViewModel(
            coordinator: coordinator,
            getTodayGamesUseCase: DefaultGetTodayGamesUseCase(gamesRepository: gameRepository),
            getNewsUseCase: DefaultGetNewsUseCase(newsRepository: newsRepository)
        )
    }
    
    public func makeGamesViewModel() -> GamesViewModel {
        GamesViewModel(
            coordinator: coordinator,
            getTodayGamesUseCase: DefaultGetTodayGamesUseCase(gamesRepository: gameRepository),
            getGamesUseCase: DefaultGetGamesUseCase(gamesRepository: gameRepository)
        )
    }
    
    public func makeProfileViewModel() -> ProfileViewModel {
        ProfileViewModel(
            coordinator: coordinator,
            getProfileUseCase: DefaultGetProfileUseCase(
                authRepository: authRepository,
                persistenceRepository: persistenceRepository
            ),
            getTeamFavoritesUseCase: DefaultGetTeamFavoritesUseCase(favoritesRepository: favoritesRepository),
            getPlayerFavoritesUseCase: DefaultGetPlayerFavoritesUseCase(favoritesRepository: favoritesRepository)
        )
    }
    
    public func makeDiscoverViewModel() -> DiscoverViewModel {
        DiscoverViewModel()
    }
    
    public func makeSearchViewModel() -> SearchViewModel {
        SearchViewModel(
            coordinator: coordinator,
            getTeamsUseCase: DefaultGetTeamsUseCase(teamsRepository: teamsRepository),
            getPlayersUseCase: DefaultGetPlayerUseCase(playersRepository: playersRepository)
        )
    }
    
    public func makePlayerViewModel(player: PlayerDomain.Player) -> PlayerViewModel {
        PlayerViewModel(
            player: player,
            getPlayerStatsUseCase: DefaultGetPlayerStatsUseCase(playersRepository: playersRepository),
            getPlayerFavoritesUseCase: DefaultGetPlayerFavoritesUseCase(favoritesRepository: favoritesRepository)
        )
    }
    
    public func makeTeamViewModel(team: TeamDomain.Team) -> TeamViewModel {
        TeamViewModel(
            team: team,
            coordinator: coordinator,
            getTeamStatsUseCase: DefaultGetTeamStatsUseCase(teamRepository: teamsRepository),
            getTeamFavoritesUseCase: DefaultGetTeamFavoritesUseCase(favoritesRepository: favoritesRepository),
            getRostersUseCase: DefaultGetRostersUseCase(teamRepository: teamsRepository)
        )
    }
    
    public func makeGameDetailsViewModel(game: Game) -> GameDetailsViewModel {
        GameDetailsViewModel(
            game: game,
            getLineupUseCase: DefaultGetGameLineupUseCase(gameRepository: gameRepository),
            getBoxScoreUseCase: DefaultGetBoxScoreUseCase(gameRepository: gameRepository),
            coordinator: coordinator
        )
    }
}
