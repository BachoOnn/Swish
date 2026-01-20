//
//  GetPlayerFavoritesUseCase.swift
//  FavoritesDomain
//
//  Created by Bacho on 20.01.26.
//

import PlayerDomain

protocol GetPlayerFavoritesUseCase {
    func executeSave(player: PlayerDomain.Player)
    func executeCheck(player: PlayerDomain.Player) -> Bool
    func executeGet() -> [PlayerDomain.Player]
}

public struct DefaultGetPlayerFavoritesUseCase: GetPlayerFavoritesUseCase {
    
    private let favoritesRepository: FavoritesRepositoryProtocol
    
    public init(favoritesRepository: FavoritesRepositoryProtocol) {
        self.favoritesRepository = favoritesRepository
    }
    
    func executeSave(player: PlayerDomain.Player) {
        _ = favoritesRepository.togglePlayerFavorite(player: player)
    }
    
    func executeCheck(player: PlayerDomain.Player) -> Bool {
        favoritesRepository.isFavoritePlayer(player: player)
    }
    
    func executeGet() -> [PlayerDomain.Player] {
        favoritesRepository.getAllFavoritesPlayer()
    }
}
