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
    
    func toggleFavorite() {
        // TODO: add userdefaults service here than and check like this :
        // isFavorite = favoritesService.isFavorite(player: Player)
        
        isFavorite.toggle()
    }

}
