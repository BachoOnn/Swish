//
//  GetBoxScoreUseCase.swift
//  GameDomain
//
//  Created by Bacho on 18.01.26.
//

protocol GetBoxScoreUseCase {
    func execute(gameId: Int) async throws -> [PlayerStats]
}

public struct DefaultGetBoxScoreUseCase: GetBoxScoreUseCase {
    
    private let gameRepository: GamesRepositoryProtocol
    
    public init(gameRepository: GamesRepositoryProtocol) {
        self.gameRepository = gameRepository
    }
    
    func execute(gameId: Int) async throws -> [PlayerStats] {
        let result = try await gameRepository.fetchBoxScore(gameId: gameId)
        
        return result.sorted { player1, player2 in
            player1.minFormatted < player2.minFormatted
        }
    }
}
