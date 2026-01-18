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
    
    func execute(gameId: Int) async throws -> [Lineup] {
        let result = try await gameRepository.fetchLineups(gameId: gameId)
        return result
    }
}
