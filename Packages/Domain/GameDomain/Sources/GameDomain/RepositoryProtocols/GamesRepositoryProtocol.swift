//
//  GamesRepository.swift
//  GameDomain
//
//  Created by Bacho on 17.01.26.
//

public protocol GamesRepositoryProtocol {
    func fetchGames(date: String) async throws -> [Game]
    func fetchTodaysGames() async throws -> [Game]
    func fetchBoxScore(gameId: Int) async throws -> [PlayerStats]
    func fetchLineups(gameId: Int) async throws -> [Lineup]
}
