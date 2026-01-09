//
//  MainDIContainer.swift
//  Auth
//
//  Created by Bacho on 04.01.26.
//

import Foundation

@MainActor
final class MainDIContainer {
    
    // MARK: - Dependencies (Add when implementing Clean Architecture)
    // private let playerRepository: PlayerRepositoryProtocol
    // private let teamRepository: TeamRepositoryProtocol
    // private let gameRepository: GameRepositoryProtocol
    
    // MARK: - ViewModels
    func makeRootViewModel() -> RootViewModel {
        let homeViewModel = makeHomeViewModel()
        return RootViewModel(homeViewModel: homeViewModel)
    }
    
    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel()
    }
//    
//    func makeGamesViewModel() -> GamesViewModel {
//        GamesViewModel()
//    }
//    
//    func makeSearchViewModel() -> SearchViewModel {
//        SearchViewModel()
//    }
//    
//    func makeDiscoverViewModel() -> DiscoverViewModel {
//        DiscoverViewModel()
//    }
    
    // MARK: - Future Clean Architecture Dependencies
    // func makeFetchPlayersUseCase() -> FetchPlayersUseCase {
    //     FetchPlayersUseCaseImpl(repository: playerRepository)
    // }
    //
    // func makeFetchTeamsUseCase() -> FetchTeamsUseCase {
    //     FetchTeamsUseCaseImpl(repository: teamRepository)
    // }
}
