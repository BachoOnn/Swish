//
//  MainDIContainer.swift
//  Swish
//
//  Created by Bacho on 04.01.26.
//

import Foundation

@MainActor
final class MainDIContainer {
    
    // MARK: - Coordinator
    let coordinator: MainCoordinator
    
    init() {
        self.coordinator = MainCoordinator()
    }
    
    // MARK: - ViewModels
    
    func makeRootViewModel() -> RootViewModel {
        RootViewModel() 
    }
    
    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(coordinator: coordinator)
    }
    
    func makeGamesViewModel() -> GamesViewModel {
        GamesViewModel(coordinator: coordinator)
    }
    
    func makeProfileViewModel() -> ProfileViewModel {
        ProfileViewModel(coordinator: coordinator)
    }
    
    // TODO: Add these when ready
    //    func makeSearchViewModel() -> SearchViewModel {
    //        SearchViewModel(coordinator: coordinator)
    //    }
    //
    //    func makeDiscoverViewModel() -> DiscoverViewModel {
    //        DiscoverViewModel(coordinator: coordinator)
    //    }
}
