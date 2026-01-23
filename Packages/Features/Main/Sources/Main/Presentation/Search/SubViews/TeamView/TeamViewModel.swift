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
    
    // MARK: - Team properties
    @Published var team: Team
    @Published var isFavorite: Bool = false
    @Published var selectedSide: TeamPickerSide = .Stats
    
    // MARK: - Stats properties
    @Published var stats: TeamSeasonStats?
    @Published var isLoadingStats: Bool = false
    @Published var errorMessage: String?
    
    // MARK: - Rosters properties
    @Published var roster: [Roster] = []
    @Published var isLoadingRoster: Bool = false
    @Published var rosterErrorMessage: String?
    
    private weak var coordinator: MainCoordinator?
    private let getTeamStatsUseCase: DefaultGetTeamStatsUseCase
    private let getTeamFavoritesUseCase: DefaultGetTeamFavoritesUseCase
    private let getRostersUseCase: DefaultGetRostersUseCase
    
    public init(
        team: Team,
        coordinator: MainCoordinator,
        getTeamStatsUseCase: DefaultGetTeamStatsUseCase,
        getTeamFavoritesUseCase: DefaultGetTeamFavoritesUseCase,
        getRostersUseCase: DefaultGetRostersUseCase
    ) {
        self.team = team
        self.coordinator = coordinator
        self.getTeamStatsUseCase = getTeamStatsUseCase
        self.getTeamFavoritesUseCase = getTeamFavoritesUseCase
        self.getRostersUseCase = getRostersUseCase
        self.isFavorite = getTeamFavoritesUseCase.executeCheck(team: team)
    }
    
    func toggleFavorite() {
        getTeamFavoritesUseCase.executeSave(team: team)
        isFavorite = getTeamFavoritesUseCase.executeCheck(team: team)
    }
    
    func onStatsLoad() {
        Task {
            await self.fetchTeamStats()
        }
    }
    
    func onRostersLoad() {
        Task {
            await self.fetchTeamRoster()
        }
    }
    
    func navigateToPlayer(_ roster: Roster) {
        let player = roster.toPlayer()
        coordinator?.navigateToPlayer(player)
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
    
    func fetchTeamRoster() async {
        isLoadingRoster = true
        rosterErrorMessage = nil
        
        do {
            roster = try await getRostersUseCase.execute(teamId: team.id)
        } catch {
            rosterErrorMessage = error.localizedDescription
        }
        
        isLoadingRoster = false
    }
}
