//
//  GetPlayerStatsUseCase.swift
//  PlayerDomain
//
//  Created by Bacho on 20.01.26.
//

protocol GetPlayerStatsUseCase {
    func execute(id: Int) async throws -> PlayerSeasonStats
}

public struct DefaultGetPlayerStatsUseCase: GetPlayerStatsUseCase {
    
    private let playersRepository: PlayersRepositoryProtocol
    
    public init(playersRepository: PlayersRepositoryProtocol) {
        self.playersRepository = playersRepository
    }
    
    public func execute(id: Int) async throws -> PlayerSeasonStats {
        let result = try await playersRepository.fetchPlayersStats(id: id)
        
        return result
    }
}
