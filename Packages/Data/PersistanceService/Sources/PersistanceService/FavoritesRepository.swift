//
//  FavoritesRepository.swift
//  PersistanceService
//
//  Created by Bacho on 20.01.26.
//

import FavoritesDomain
import TeamDomain
import PlayerDomain
import Foundation
import SwiftUI

enum DefaultsKeys: String {
    case team = "Team"
    case player = "Player"
}

public final class FavoritesRepository: FavoritesRepositoryProtocol {
    
    public init() {}
 
    @AppStorage(DefaultsKeys.team.rawValue) private var favoriteTeamData: Data = Data()
    @AppStorage(DefaultsKeys.player.rawValue) private var favoritePlayerData: Data = Data()
    
    // Teams:
    public func toggleTeamFavorite(team: TeamDomain.Team) {
        var favorites = loadFavoriteTeams()
        
        if favorites.contains(where: { $0.id == team.id }) {
            favorites.removeAll { $0.id == team.id }
        } else {
            favorites.append(team)
        }
        
        saveFavoriteTeams(favorites)
    }
    
    public func isFavoriteTeam(team: TeamDomain.Team) -> Bool {
        loadFavoriteTeams().contains(where: { $0.id == team.id })
    }
    
    public func getAllFavoritesTeam() -> [TeamDomain.Team] {
        loadFavoriteTeams()
    }
    
    // Players:
    public func togglePlayerFavorite(player: PlayerDomain.Player) {
        var favorites = loadFavoritePlayers()
        
        if favorites.contains(where: { $0.id == player.id }) {
            favorites.removeAll { $0.id == player.id }
        } else {
            favorites.append(player)
        }
        
        saveFavoritePlayers(favorites)
    }
    
    public func isFavoritePlayer(player: PlayerDomain.Player) -> Bool {
        loadFavoritePlayers().contains(where: { $0.id == player.id })
    }
    
    public func getAllFavoritesPlayer() -> [PlayerDomain.Player] {
        loadFavoritePlayers()
    }
    
    private func loadFavoriteTeams() -> [TeamDomain.Team] {
        guard let decoded = try? JSONDecoder().decode([TeamDomain.Team].self, from: favoriteTeamData) else {
            return []
        }
        return decoded
    }
    
    private func loadFavoritePlayers() -> [PlayerDomain.Player] {
        guard let decoded = try? JSONDecoder().decode([PlayerDomain.Player].self, from: favoritePlayerData) else {
            return []
        }
        return decoded
    }
    
    private func saveFavoriteTeams(_ favorites: [TeamDomain.Team]) {
        if let encoded = try? JSONEncoder().encode(favorites) {
            favoriteTeamData = encoded
        }
    }
    
    private func saveFavoritePlayers(_ favorites: [PlayerDomain.Player]) {
        if let encoded = try? JSONEncoder().encode(favorites) {
            favoritePlayerData = encoded
        }
    }
}
