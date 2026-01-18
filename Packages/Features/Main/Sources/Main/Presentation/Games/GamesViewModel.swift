//
//  GamesViewModel.swift
//  Swish
//
//  Created by Bacho on 12.01.26.
//

import Foundation
import Combine
import GameDomain
import Helpers

@MainActor
public final class GamesViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var games: [Game] = []
    @Published var selectedDate: Date? = .now
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // MARK: - Dependencies
    private weak var coordinator: MainCoordinator?
    private let getTodayGamesUseCase: DefaultGetTodayGamesUseCase
    private let getGamesUseCase: DefaultGetGamesUseCase
    
    // MARK: - Init
    public init(
        coordinator: MainCoordinator,
        getTodayGamesUseCase: DefaultGetTodayGamesUseCase,
        getGamesUseCase: DefaultGetGamesUseCase
    ) {
        self.coordinator = coordinator
        self.getTodayGamesUseCase = getTodayGamesUseCase
        self.getGamesUseCase = getGamesUseCase
    }
    
    // MARK: - Public Methods
    func loadGames(for date: Date?) {
        Task {
            await loadGamesAsync(for: date)
        }
    }
    
    private func loadGamesAsync(for date: Date?) async {
        guard let date = date else {
            await loadTodaysGames()
            return
        }
        
        if Calendar.current.isDateInToday(date) {
            await loadTodaysGames()
        } else {
            await loadGamesForDate(date)
        }
    }
    
    private func loadTodaysGames() async {
        isLoading = true
        errorMessage = nil
        
        do {
            games = try await getTodayGamesUseCase.execute()
        } catch {
            errorMessage = error.localizedDescription
            games = []
        }
        
        isLoading = false
    }
    
    private func loadGamesForDate(_ date: Date) async {
        isLoading = true
        errorMessage = nil
        
        let dateString = DateFormatter.calendarDateString(from: date)
        
        do {
            games = try await getGamesUseCase.execute(date: dateString)
        } catch {
            errorMessage = "Failed to load games: \(error.localizedDescription)"
            games = []
        }
        
        isLoading = false
    }
    
    func navigateToGameDetails(game: Game) {
        coordinator?.navigateToGameDetails(game: game)
    }
}
