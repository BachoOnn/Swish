//
//  SearchViewModel.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import Combine

public final class SearchViewModel: ObservableObject {
    
    @Published var selectedSide: SearchPickerSide = .Teams
    @Published private(set) var players: [PlayerSeasonAverages] = [.lebronMock, .lukaMock, .curryMock, .embiidMock, .tatumMock]
    @Published private(set) var teams: [TeamSeasonAverages] = [.lakersMock, .bucksMock, .celticsMock, .warriorsMock]
    
    private weak var coordinator: MainCoordinator?
    
    public init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
        
    func navigateToPlayer(_ player: PlayerSeasonAverages) {
        coordinator?.navigateToPlayer(player)
    }
    
    func navigateToTeam(_ team: TeamSeasonAverages) {
        coordinator?.navigateToTeam(team)
    }
    
    // TODO: when user taps team or player to send its id and fetch data with it
}
