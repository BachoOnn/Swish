//
//  SearchViewModel.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import Combine

public final class SearchViewModel: ObservableObject {
    
    public init() {}
    
    @Published var selectedSide: SearchPickerSide = .Players
    @Published var selectedPlayer: PlayerSeasonAverages?
    @Published var selectedTeam: TeamSeasonAverages?
    
    func navigateToPlayer(_ player: PlayerSeasonAverages) {
        selectedPlayer = player
    }
    
    func navigateToTeam(_ team: TeamSeasonAverages) {
        selectedTeam = team
    }
    
    // TODO: when user taps team or player to send its id and fetch data with it
}
