//
//  TeamsRepository.swift
//  APIService
//
//  Created by Bacho on 19.01.26.
//

import Foundation
import MyNetworkManager
import TeamDomain
import Config

public final class TeamsRepository: TeamsRepositoryProtocol {
    
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
    
    public func fetchAllTeams() async throws -> [Team] {
        let url = "\(baseURL)/teams"
        let response: TeamResponseDTO = try await networkManager.get(urlString: url, headers: headers)
        return response.data.map { $0.toDomain() }
    }
    
    public func fetchTeamStats(teamId: Int) async throws -> TeamSeasonStats {
        let url = "\(baseURL)/team_season_averages/general?season=2025&season_type=regular&type=base&team_ids[]=\(teamId)"
        let response: TeamSeasonAveragesResponseDTO = try await networkManager.get(urlString: url, headers: headers)
        guard let firstTeamData = response.data.first else {
            throw NSError(domain: "PlayersRepository", code: 404, userInfo: [NSLocalizedDescriptionKey: "No stats found in response for team ID: \(teamId)"])
        }
        return firstTeamData.stats.toDomain()
    }
}
