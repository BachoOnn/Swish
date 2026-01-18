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
    
    public func execute(gameId: Int) async throws -> [PlayerStats] {
        let result = try await gameRepository.fetchBoxScore(gameId: gameId)
        
        return result
    }
}
