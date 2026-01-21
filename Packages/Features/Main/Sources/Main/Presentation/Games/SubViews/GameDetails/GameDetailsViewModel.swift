//
//  GameDetailsViewModel.swift
//  Main
//
//  Created by Bacho on 18.01.26.
//

import GameDomain
import PlayerDomain
import Combine

@MainActor
public final class GameDetailsViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var homeLineup: Lineup?
    @Published var awayLineup: Lineup?
    @Published var isLoadingLineups = false
    
    @Published var homeTeamStats: [PlayerStats] = []
    @Published var awayTeamStats: [PlayerStats] = []
    @Published var isLoadingBoxScore = false
    
    @Published var errorMessage: String?
    
    // MARK: - Properties
    private let game: Game
    private let getLineupUseCase: DefaultGetGameLineupUseCase
    private let getBoxScoreUseCase: DefaultGetBoxScoreUseCase
    private weak var coordinator: MainCoordinator?
    
    
    // MARK: - Init
    public init(
        game: Game,
        getLineupUseCase: DefaultGetGameLineupUseCase,
        getBoxScoreUseCase: DefaultGetBoxScoreUseCase,
        coordinator: MainCoordinator
    ) {
        self.game = game
        self.getLineupUseCase = getLineupUseCase
        self.getBoxScoreUseCase = getBoxScoreUseCase
        self.coordinator = coordinator
    }
    
    // MARK: - Navigation
    
    func goPlayersDetails(from stats: PlayerStats) {
        let playerDomainPlayer = PlayerDomain.Player(
            id: stats.player.id,
            firstName: stats.player.firstName,
            lastName: stats.player.lastName,
            position: stats.player.position,
            height: nil,
            weight: nil,
            jerseyNumber: stats.player.jerseyNumber,
            college: nil,
            country: nil,
            draftYear: nil,
            draftRound: nil,
            draftNumber: nil,
            team: PlayerDomain.PlayerTeamInfo(
                id: stats.team.id,
                conference: stats.team.conference,
                division: stats.team.division,
                city: stats.team.city,
                name: stats.team.name,
                fullName: stats.team.fullName,
                abbreviation: stats.team.abbreviation
            )
        )
        
        coordinator?.navigateToPlayer(playerDomainPlayer)
    }
    
    // MARK: - Computed Properties
    var currentGame: Game { game }
    
    var homeTeam: String {
        game.homeTeam.abbreviation
    }
    
    var visitorTeam: String {
        game.visitorTeam.abbreviation
    }
    
    var homeTeamScore: Int {
        game.homeTeamScore
    }
    
    var visitorTeamScore: Int {
        game.visitorTeamScore
    }
    
    var status: String {
        game.status
    }
    
    // MARK: - Methods
    
    func loadLineups() async {
        guard !isLoadingLineups else { return }
        
        isLoadingLineups = true
        errorMessage = nil
        
        do {
            let lineups = try await getLineupUseCase.execute(gameId: game.id)
            homeLineup = lineups.first { $0.team.id == game.homeTeam.id }
            awayLineup = lineups.first { $0.team.id == game.visitorTeam.id }
        } catch {
            errorMessage = "Failed to load lineups: \(error.localizedDescription)"
        }
        
        isLoadingLineups = false
    }
    
    func loadBoxScore() async {
        guard !isLoadingBoxScore else { return }
        
        isLoadingBoxScore = true
        errorMessage = nil
        
        do {
            let allStats = try await getBoxScoreUseCase.execute(gameId: game.id)
            
            homeTeamStats = allStats.filter { $0.team.id == game.homeTeam.id }
                .sorted { $0.pts > $1.pts }
            
            awayTeamStats = allStats.filter { $0.team.id == game.visitorTeam.id }
                .sorted { $0.pts > $1.pts }  
            
        } catch {
            errorMessage = "Failed to load box score: \(error.localizedDescription)"
        }
        
        isLoadingBoxScore = false
    }
}
