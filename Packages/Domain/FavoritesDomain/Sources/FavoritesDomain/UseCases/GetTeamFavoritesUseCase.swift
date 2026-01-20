//
//  GetTeamFavoritesUseCase.swift
//  FavoritesDomain
//
//  Created by Bacho on 20.01.26.
//

import TeamDomain

protocol GetTeamFavoritesUseCase {
    func executeSave(team: TeamDomain.Team)
    func executeCheck(team: TeamDomain.Team) -> Bool
    func executeGet() -> [TeamDomain.Team]
}

public struct DefaultGetTeamFavoritesUseCase: GetTeamFavoritesUseCase {
    
    private let favoritesRepository: FavoritesRepositoryProtocol
    
    public init(favoritesRepository: FavoritesRepositoryProtocol) {
        self.favoritesRepository = favoritesRepository
    }
    
    public func executeSave(team: TeamDomain.Team) {
        _ = favoritesRepository.toggleTeamFavorite(team: team)
    }
    public func executeCheck(team: TeamDomain.Team) -> Bool {
        favoritesRepository.isFavoriteTeam(team: team)
    }
    
    public func executeGet() -> [TeamDomain.Team] {
        favoritesRepository.getAllFavoritesTeam()
    }
}
