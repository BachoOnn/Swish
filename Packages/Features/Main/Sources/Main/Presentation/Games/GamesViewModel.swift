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
    
    @Published var selection: Date? = .now
    @Published var title: String = Calendar.monthAndYear(from: .now)
    @Published var focusedWeek: Week = .current
    @Published var calendarType: CalendarType = .week
    @Published var isDragging: Bool = false
    @Published var dragProgress: CGFloat = .zero
    @Published var initialDragOffset: CGFloat? = nil
    @Published var verticalDragOffset: CGFloat = .zero
    
    // MARK: - Properties
    private(set) var symbols = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

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
    func onLoad() {
        Task {
            await self.loadGamesAsync(for: selection)
        }
    }
    
    func navigateToGameDetails(game: Game) {
        coordinator?.navigateToGameDetails(game: game)
    }
}

fileprivate extension GamesViewModel {
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
}
