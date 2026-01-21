//
//  SearchViewModel.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import Combine
import TeamDomain
import PlayerDomain
import Foundation

@MainActor
public final class SearchViewModel: ObservableObject {
    
    @Published var selectedSide: SearchPickerSide = .Teams
    @Published var searchText: String = ""
    @Published private(set) var players: [Player] = []
    @Published private(set) var teams: [Team] = []
    @Published var isLoadingTeams: Bool = false
    @Published var isLoadingPlayers: Bool = false
    @Published var errorMessage: String?
    
    private var allTeams: [Team] = []
    private weak var coordinator: MainCoordinator?
    private let getTeamsUseCase: DefaultGetTeamsUseCase
    private let getPlayersUseCase: DefaultGetPlayerUseCase
    private var cancellables = Set<AnyCancellable>()
    private var searchTask: Task<Void, Never>?
    
    public init(
        coordinator: MainCoordinator,
        getTeamsUseCase: DefaultGetTeamsUseCase,
        getPlayersUseCase: DefaultGetPlayerUseCase
    ) {
        self.coordinator = coordinator
        self.getTeamsUseCase = getTeamsUseCase
        self.getPlayersUseCase = getPlayersUseCase
        self.setupSearchDebounce()
    }
    
    func navigateToPlayer(_ player: Player) {
         coordinator?.navigateToPlayer(player)
    }
    
    func navigateToTeam(_ team: Team) {
        coordinator?.navigateToTeam(team)
    }
    
    func onLoad() {
        Task {
            await self.loadTeams()
        }
    }
    
    func onRefresh() {
        onLoad()
    }
    
    deinit {
        searchTask?.cancel()
    }
}

fileprivate extension SearchViewModel {
    func loadTeams() async {
        isLoadingTeams = true
        errorMessage = nil
        
        do {
            let fetchedTeams = try await getTeamsUseCase.execute()
            allTeams = fetchedTeams
            teams = fetchedTeams
        } catch {
            errorMessage = error.localizedDescription
            teams = []
            allTeams = []
        }
        isLoadingTeams = false
    }
    
    private func setupSearchDebounce() {
        $searchText
            .debounce(for: .milliseconds(200), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] searchQuery in
                guard let self = self else { return }
                
                switch self.selectedSide {
                case .Teams:
                    self.filterTeams(by: searchQuery)
                case .Players:
                    self.performPlayerSearch(query: searchQuery)
                }
            }
            .store(in: &cancellables)
    }
    
    private func filterTeams(by query: String) {
        guard !query.isEmpty else {
            teams = allTeams
            return
        }
        
        let lowercasedQuery = query.lowercased()
        
        teams = allTeams.filter { team in
            team.fullName.lowercased().contains(lowercasedQuery) ||
            team.name.lowercased().contains(lowercasedQuery) ||
            team.city.lowercased().contains(lowercasedQuery) ||
            team.abbreviation.lowercased().contains(lowercasedQuery)
        }
    }
    
    private func performPlayerSearch(query: String) {
        searchTask?.cancel()
        
        guard query.count >= 3 else {
            players = []
            isLoadingPlayers = false
            return
        }
        
        searchTask = Task { @MainActor in
            await searchPlayers(query: query)
        }
    }
    
    private func searchPlayers(query: String) async {
        isLoadingPlayers = true
        errorMessage = nil
        
        do {
            try Task.checkCancellation()
            
            let result = try await getPlayersUseCase.execute(name: query)
            
            try Task.checkCancellation()
            
            players = result
            
        } catch {
            errorMessage = "Failed to search players: \(error.localizedDescription)"
            players = []
        }
        
        isLoadingPlayers = false
    }
    
}
