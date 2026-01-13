//
//  GamesViewModel.swift
//  Swish
//
//  Created by Bacho on 12.01.26.
//

import Foundation
import Combine

public final class GamesViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var games: [Game] = []
    @Published var selectedDate: Date? = .now
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // MARK: - Dependencies
    private weak var coordinator: MainCoordinator?
    
    // MARK: - Init
    public init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Public Methods
    func loadGames(for date: Date?) {
        selectedDate = date
        
        // TODO: Replace with real API call in the future
        guard let date = date else {
            games = MockGameData.allGames
            return
        }
        
        let calendar = Calendar.current
        let selectedComponents = calendar.dateComponents([.year, .month, .day], from: date)
        
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [
            .withInternetDateTime,
            .withFractionalSeconds
        ]
        
        games = MockGameData.allGames.filter { game in
            guard let gameDate = isoFormatter.date(from: game.date) else {
                return false
            }
            
            let gameComponents = calendar.dateComponents([.year, .month, .day], from: gameDate)
            
            return selectedComponents.year == gameComponents.year &&
            selectedComponents.month == gameComponents.month &&
            selectedComponents.day == gameComponents.day
        }
    }
    
    func navigateToGameDetails(game: Game) {
        coordinator?.navigateToGameDetails(game: game)
    }
}
