//
//  PlayersRepository.swift
//  APIService
//
//  Created by Bacho on 19.01.26.
//

import PlayerDomain
import MyNetworkManager
import Foundation

public final class PlayersRepository: PlayersRepositoryProtocol {
    
    private let networkManager: NetworkManager
    private let baseURL: String
    private let apiKey: String
    
    public init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
        self.baseURL = Bundle.main.BALLDONTLIE_BASE_URL
        self.apiKey = Bundle.main.BALLDONTLIE_API_KEY
    }
    
    private var headers: [String: String] {
        ["Authorization": apiKey]
    }
    
    public func fetchPlayers(name: String) async throws -> [Player] {
        let url = "\(baseURL)/players/active?search=\(name)&per_page=25"
        let response: PlayerResponseDTO = try await networkManager.get(urlString: url, headers: headers)
        
        return response.data.map { $0.toDomain() }
    }
    public func fetchPlayersStats(id: Int) async throws -> [PlayerSeasonStats] {
        let url = "\(baseURL)/season_averages/general?season=2025&season_type=regular&type=base&player_ids[]=\(id)"
        let response: PlayerSeasonStatsResponseDTO = try await networkManager.get(urlString: url, headers: headers)
        return response.data.map { $0.stats.toDomain() }
    }
}
