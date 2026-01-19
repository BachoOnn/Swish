//
//  GetPlayerUseCase.swift
//  PlayerDomain
//
//  Created by Bacho on 19.01.26.
//

protocol GetPlayerUseCase {
    func execute(name: String) async throws -> [Player]
}

public struct DefaultGetPlayerUseCase: GetPlayerUseCase {
    
    private let playersRepository: PlayersRepositoryProtocol
    
    public init(playersRepository: PlayersRepositoryProtocol) {
        self.playersRepository = playersRepository
    }
    
    public func execute(name: String) async throws -> [Player] {
        let result = try await playersRepository.fetchPlayers(name: name)
        return result
    }
}
