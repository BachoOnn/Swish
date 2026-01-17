//
//  GetTodayGamesUseCase.swift
//  GameDomain
//
//  Created by Bacho on 17.01.26.
//

protocol GetTodayGamesUseCase {
    func execute() async throws -> [Game]
}

public struct DefaultGetTodayGamesUseCase: GetTodayGamesUseCase {
    
    private let gamesRepository: GamesRepositoryProtocol
    
    public init(gamesRepository: GamesRepositoryProtocol) {
        self.gamesRepository = gamesRepository
    }
    
    func execute() async throws -> [Game] {
        let games = try await gamesRepository.fetchTodaysGames()
        
        return games.sorted { game1, game2 in
            game1.status < game2.status
        }
    }
}
