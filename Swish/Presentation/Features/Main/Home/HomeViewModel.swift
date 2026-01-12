//  HomeViewModel.swift
//  Auth
//
//  Created by Bacho on 01.01.26.
//

import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    
    private weak var coordinator: MainCoordinator?
    
    private(set) var games = MockGameData.allGames
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    deinit {
        print("HomeViewModel destroyed")
    }
    
    func navigateToProfile() {
        coordinator?.navigateToProfile()
    }
    
    func navigateToGameDetails(game: Game) {
        coordinator?.navigateToGameDetails(game: game)
    }
    
    func signOut() {
        coordinator?.signOut()
    }
}
