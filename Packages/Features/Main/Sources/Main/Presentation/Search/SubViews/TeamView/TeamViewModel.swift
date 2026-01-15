//
//  TeamViewModel.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import Combine

final class TeamViewModel: ObservableObject {
    
    @Published var team: TeamSeasonAverages
    @Published var isFavorite: Bool = false
    
    init(team: TeamSeasonAverages) {
        self.team = team
    }
    
    
    func toggleFavorite() {
        // TODO: add userdefaults service here than and check like this :
        // isFavorite = favoritesService.isFavorite(team: Team)
        
        isFavorite.toggle()
    }
}
