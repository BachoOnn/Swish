//
//  TeamViewModel.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import Combine
import TeamDomain
import FavoritesDomain

@MainActor
public final class TeamViewModel: ObservableObject {
    
    @Published var team: Team
    @Published var isFavorite: Bool = false
    @Published var stats: TeamSeasonStats?
    @Published var isLoadingStats: Bool = false
    @Published var errorMessage: String?
    
    private let getTeamStatsUseCase: DefaultGetTeamStatsUseCase
    private let getTeamFavoritesUseCase: DefaultGetTeamFavoritesUseCase
    
    public init(team: Team, getTeamStatsUseCase: DefaultGetTeamStatsUseCase, getTeamFavoritesUseCase: DefaultGetTeamFavoritesUseCase) {
        self.team = team
        self.getTeamStatsUseCase = getTeamStatsUseCase
        self.getTeamFavoritesUseCase = getTeamFavoritesUseCase
        self.isFavorite = getTeamFavoritesUseCase.executeCheck(team: team)
    }
    
    func toggleFavorite() {
        getTeamFavoritesUseCase.executeSave(team: team)
        isFavorite = getTeamFavoritesUseCase.executeCheck(team: team)
    }
    
    func onLoad() {
        Task {
            await self.fetchTeamStats()
        }
    }
}

fileprivate extension TeamViewModel {
    func fetchTeamStats() async {
        isLoadingStats = true
        errorMessage = nil
        
        do {
            stats = try await getTeamStatsUseCase.execute(teamsID: team.id)
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoadingStats = false
    }
}
