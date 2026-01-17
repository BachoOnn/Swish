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
    private let getTodayGamesUseCase: DefaultGetTodayGamesUseCase
    
    @Published private(set) var games: [Game] = []
    @Published var isLoading: Bool = false 
    
    public init(
        coordinator: MainCoordinator,
        getTodayGamesUseCase: DefaultGetTodayGamesUseCase
    ) {
        self.coordinator = coordinator
        self.getTodayGamesUseCase = getTodayGamesUseCase
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
    
    func loadTodaysGames() async {
        isLoading = true
        
        do {
            games = try await getTodayGamesUseCase.execute()
        } catch {
            print(error.localizedDescription)
        }
        
        isLoading = false
    }
    
    func refreshGames() async {
        await loadTodaysGames()
    }
    
    var featuredGames: [Game] {
        Array(games.prefix(5))
    }
}
