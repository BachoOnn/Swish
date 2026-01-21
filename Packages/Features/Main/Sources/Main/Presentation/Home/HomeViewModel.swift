//  HomeViewModel.swift
//  Auth
//
//  Created by Bacho on 01.01.26.
//

import Combine
import GameDomain
import NewsDomain

@MainActor
public final class HomeViewModel: ObservableObject {
    
    private weak var coordinator: MainCoordinator?
    private let getTodayGamesUseCase: DefaultGetTodayGamesUseCase
    private let getNewsUseCase: DefaultGetNewsUseCase
    
    @Published private(set) var games: [Game] = []
    @Published private(set) var news: [News] = []
    @Published var isGamesLoading: Bool = false
    @Published var isNewsLoading: Bool = false
    
    public init(
        coordinator: MainCoordinator,
        getTodayGamesUseCase: DefaultGetTodayGamesUseCase,
        getNewsUseCase: DefaultGetNewsUseCase
    ) {
        self.coordinator = coordinator
        self.getTodayGamesUseCase = getTodayGamesUseCase
        self.getNewsUseCase = getNewsUseCase
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
    
    func onLoad() {
        refresh()
    }

    func refresh() {
        Task {
            async let loadGames:() = self.loadTodaysGames()
            async let loadNews:() = self.loadNews()
            
            _ = await (loadGames, loadNews)
        }
    }
    
    var featuredGames: [Game] {
        Array(games.prefix(5))
    }
}

fileprivate extension HomeViewModel {
    func loadTodaysGames() async {
        isGamesLoading = true
        
        do {
            games = try await getTodayGamesUseCase.execute()
        } catch {
            print(error.localizedDescription)
        }
        
        isGamesLoading = false
    }
    
    func loadNews() async {
        isNewsLoading = true
        
        do {
            news = try await getNewsUseCase.execute()
        } catch {
            print(error.localizedDescription)
        }
        
        isNewsLoading = false
    }
}
