//
//  FavoritesRepositoryProtocol.swift
//  FavoritesDomain
//
//  Created by Bacho on 20.01.26.
//

import TeamDomain
import PlayerDomain

public protocol FavoritesRepositoryProtocol {
    func toggleTeamFavorite(team: TeamDomain.Team)
    func isFavoriteTeam(team: TeamDomain.Team) -> Bool
    func getAllFavoritesTeam() -> [TeamDomain.Team]
    func clearAllTeams()
    
    func togglePlayerFavorite(player: PlayerDomain.Player)
    func isFavoritePlayer(player: PlayerDomain.Player) -> Bool
    func getAllFavoritesPlayer() -> [PlayerDomain.Player]
    func clearAllPlayers()
}
