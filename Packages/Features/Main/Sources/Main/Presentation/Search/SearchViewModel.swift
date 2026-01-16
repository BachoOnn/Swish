//
//  SearchViewModel.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import Combine

public final class SearchViewModel: ObservableObject {
    
    private weak var coordinator: MainCoordinator?
    
    public init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    @Published var selectedSide: SearchPickerSide = .Players
    
    func navigateToPlayer(_ player: PlayerSeasonAverages) {
        coordinator?.navigateToPlayer(player)
    }
    
    func navigateToTeam(_ team: TeamSeasonAverages) {
        coordinator?.navigateToTeam(team)
    }
    
    // TODO: when user taps team or player to send its id and fetch data with it
}
