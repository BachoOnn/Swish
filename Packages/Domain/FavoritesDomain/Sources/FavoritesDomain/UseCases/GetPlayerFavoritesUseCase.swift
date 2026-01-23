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
    func executeClear()
}

public struct DefaultGetPlayerFavoritesUseCase: GetPlayerFavoritesUseCase {
    
    private let favoritesRepository: FavoritesRepositoryProtocol
    
    public init(favoritesRepository: FavoritesRepositoryProtocol) {
        self.favoritesRepository = favoritesRepository
    }
    
    public func executeSave(player: PlayerDomain.Player) {
        favoritesRepository.togglePlayerFavorite(player: player)
    }
    
    public func executeCheck(player: PlayerDomain.Player) -> Bool {
        favoritesRepository.isFavoritePlayer(player: player)
    }
    
    public func executeGet() -> [PlayerDomain.Player] {
        favoritesRepository.getAllFavoritesPlayer()
    }
    
    public func executeClear() {
        favoritesRepository.clearAllPlayers()
    }
}
