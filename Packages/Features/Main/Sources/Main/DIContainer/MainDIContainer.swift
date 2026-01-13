//
//  MainDIContainer.swift
//  Swish
//
//  Created by Bacho on 04.01.26.
//

import Foundation

@MainActor
public final class MainDIContainer {
    
    // MARK: - Coordinator
    public let coordinator: MainCoordinator
    
    public init() {
        self.coordinator = MainCoordinator()
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
        ProfileViewModel(coordinator: coordinator)
    }
    
    public func makeDiscoverViewModel() -> DiscoverViewModel {
        DiscoverViewModel()
    }
}
