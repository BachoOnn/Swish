//
//  GetGameLineupUseCase.swift
//  GameDomain
//
//  Created by Bacho on 18.01.26.
//

protocol GetGameLineupUseCase {
    func execute(gameId: Int) async throws -> [Lineup]
}

public struct DefaultGetGameLineupUseCase: GetGameLineupUseCase {
    
    private let gameRepository: GamesRepositoryProtocol
    
    public init(gameRepository: GamesRepositoryProtocol) {
        self.gameRepository = gameRepository
    }
    
    public func execute(gameId: Int) async throws -> [Lineup] {
        let stats = try await gameRepository.fetchBoxScore(gameId: gameId)
        let grouped = Dictionary(grouping: stats) { $0.team.id }
        
        var lineups: [Lineup] = []
        
        for (_, teamStats) in grouped {
            guard let firstStat = teamStats.first else { continue }
            
            let starters = teamStats
                .filter { $0.didPlay }
                .sorted { player1, player2 in
                    player1.minFormatted > player2.minFormatted
                }
                .prefix(5)
                .map { $0.player }
            
            let lineup = Lineup(
                id: firstStat.team.id,
                game: firstStat.game,
                team: firstStat.team,
                starters: Array(starters)
            )
            lineups.append(lineup)
        }
        
        return lineups
    }
}
