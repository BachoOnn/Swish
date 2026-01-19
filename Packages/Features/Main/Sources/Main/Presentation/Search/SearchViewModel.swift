//
//  SearchViewModel.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import Combine
import TeamDomain
import Foundation

@MainActor
public final class SearchViewModel: ObservableObject {
    
    @Published var selectedSide: SearchPickerSide = .Teams
    @Published var searchText: String = ""
    @Published private(set) var players: [PlayerSeasonAverages] = [.lebronMock, .lukaMock, .curryMock, .embiidMock, .tatumMock]
    @Published private(set) var teams: [Team] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private var allTeams: [Team] = []
    private weak var coordinator: MainCoordinator?
    private let getTeamsUseCase: DefaultGetTeamsUseCase
    private var cancellables = Set<AnyCancellable>()
    
    public init(coordinator: MainCoordinator, getTeamsUseCase: DefaultGetTeamsUseCase) {
        self.coordinator = coordinator
        self.getTeamsUseCase = getTeamsUseCase
        setupSearchDebounce()
    }
    
    private func setupSearchDebounce() {
        $searchText
            .debounce(for: .milliseconds(200), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] searchQuery in
                self?.filterTeams(by: searchQuery)
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
    
    func navigateToPlayer(_ player: PlayerSeasonAverages) {
        coordinator?.navigateToPlayer(player)
    }
    
    func navigateToTeam(_ team: Team) {
        coordinator?.navigateToTeam(team)
    }
    
    func loadTeams() async {
        isLoading = true
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
        isLoading = false
    }
}
