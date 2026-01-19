//
//  TeamViewModel.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import Combine
import TeamDomain

@MainActor
public final class TeamViewModel: ObservableObject {
    
    @Published var team: Team
    @Published var isFavorite: Bool = false
    @Published var stats: TeamSeasonStats?
    @Published var isLoadingStats: Bool = false
    @Published var errorMessage: String?
    
    private let getTeamStatsUseCase: DefaultGetTeamStatsUseCase
    
    public init(team: Team, getTeamStatsUseCase: DefaultGetTeamStatsUseCase) {
        self.team = team
        self.getTeamStatsUseCase = getTeamStatsUseCase
    }
    
    func toggleFavorite() {
        // TODO: add userdefaults service here than and check like this :
        // isFavorite = favoritesService.isFavorite(team: Team)
        
        isFavorite.toggle()
    }
    
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
