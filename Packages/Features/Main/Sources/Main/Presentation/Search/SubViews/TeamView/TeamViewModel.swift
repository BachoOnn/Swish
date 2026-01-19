//
//  TeamViewModel.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import Combine
import TeamDomain

public final class TeamViewModel: ObservableObject {
    
    @Published var team: Team
    @Published var isFavorite: Bool = false
    
    public init(team: Team) {
        self.team = team
    }
    
    
    func toggleFavorite() {
        // TODO: add userdefaults service here than and check like this :
        // isFavorite = favoritesService.isFavorite(team: Team)
        
        isFavorite.toggle()
    }
}
