//  HomeViewModel.swift
//  Auth
//
//  Created by Bacho on 01.01.26.
//

import Combine
import GameDomain

@MainActor
public final class HomeViewModel: ObservableObject {
    
    private weak var coordinator: MainCoordinator?
    
    private(set) var games: [Game] = []
    
    public init(coordinator: MainCoordinator) {
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
