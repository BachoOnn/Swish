//
//  GetGamesUseCase.swift
//  GameDomain
//
//  Created by Bacho on 17.01.26.
//

protocol GetGamesUseCase {
    func execute(date: String) async throws -> [Game]
}

public struct DefaultGetGamesUseCase: GetGamesUseCase {
    
    private let gamesRepository: GamesRepositoryProtocol
    
    public init(gamesRepository: GamesRepositoryProtocol) {
        self.gamesRepository = gamesRepository
    }
    
    public func execute(date: String) async throws -> [Game] {
        let games = try await gamesRepository.fetchGames(date: date)
        
        return games.sorted { game1, game2 in
            game1.status < game2.status
        }
    }
}
