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
        let homeViewModel = makeHomeViewModel()
        return RootViewModel(
            homeViewModel: homeViewModel,
            coordinator: coordinator
        )
    }
    
    func makeHomeViewModel() -> HomeViewModel {
        HomeViewModel(coordinator: coordinator)
    }
    
//    func makeProfileViewModel() -> ProfileViewModel {
//        ProfileViewModel(coordinator: coordinator)
//    }
    
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
}
