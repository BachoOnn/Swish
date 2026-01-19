//
//  PlayerViewModel.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import Combine
import PlayerDomain

public final class PlayerViewModel: ObservableObject {
    
    @Published var isFavorite: Bool = false
    @Published var selectedSide: PlayerPickerSide = .Profile
    @Published var player: Player
    
    public init(player: Player) {
        self.player = player
    }
    
    func toggleFavorite() {
        // TODO: add userdefaults service here than and check like this :
        // isFavorite = favoritesService.isFavorite(player: Player)
        
        isFavorite.toggle()
    }
    
    var playerName: String {
        "\(player.firstName) \(player.lastName)"
    }
    
    var number: String {
        "№ \(player.jerseyNumber ?? "N")"
    }
    
    var position: String {
        "Position: \(player.position)"
    }
    
    var team: String {
        player.team.name
    }

}
