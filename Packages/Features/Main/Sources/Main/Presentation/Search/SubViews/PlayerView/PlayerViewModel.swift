//
//  PlayerViewModel.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import Combine

final class PlayerViewModel: ObservableObject {
    
    @Published var isFavorite: Bool = false
    @Published var selectedSide: PlayerPickerSide = .Profile
    @Published var player: PlayerSeasonAverages
    
    init(player: PlayerSeasonAverages) {
        self.player = player
    }
    
    func toggleFavorite() {
        // TODO: add userdefaults service here than and check like this :
        // isFavorite = favoritesService.isFavorite(player: Player)
        
        isFavorite.toggle()
    }
    
    var playerName: String {
        "\(player.player.firstName) \(player.player.lastName)"
    }
    
    var number: String {
        "№ \(player.player.jerseyNumber ?? "N")"
    }
    
    var position: String {
        "Position: \(player.player.position)"
    }
    
    var team: String {
        // TODO: find a way to bring team name
        ""
    }

}
