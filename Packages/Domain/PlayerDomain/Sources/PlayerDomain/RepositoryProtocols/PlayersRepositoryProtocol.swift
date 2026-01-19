//
//  PlayersRepositoryProtocol.swift
//  PlayerDomain
//
//  Created by Bacho on 19.01.26.
//

public protocol PlayersRepositoryProtocol {
    func fetchPlayers(name: String) async throws -> [Player]
    func fetchPlayersStats(id: Int) async throws -> [PlayerSeasonStats]
}
