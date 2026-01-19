//
//  SearchViewModel.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import Combine
import TeamDomain

@MainActor
public final class SearchViewModel: ObservableObject {
    
    @Published var selectedSide: SearchPickerSide = .Teams
    @Published private(set) var players: [PlayerSeasonAverages] = [.lebronMock, .lukaMock, .curryMock, .embiidMock, .tatumMock]
    @Published private(set) var teams: [Team] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private weak var coordinator: MainCoordinator?
    private let getTeamsUseCase: DefaultGetTeamsUseCase
    
    public init(coordinator: MainCoordinator, getTeamsUseCase: DefaultGetTeamsUseCase) {
        self.coordinator = coordinator
        self.getTeamsUseCase = getTeamsUseCase
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
            teams = try await getTeamsUseCase.execute()
            print(teams.count)
        } catch {
            errorMessage = error.localizedDescription
            teams = []
        }
        
        isLoading = false
    }
    
    
    // TODO: when user taps team or player to send its id and fetch data with it
}
