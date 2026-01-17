//
//  GamesRepository.swift
//  APIService
//
//  Created by Bacho on 17.01.26.
//

import Foundation
import MyNetworkManager
import GameDomain
import Config
import Helpers

public final class GamesRepository: GamesRepositoryProtocol {
    
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
        
    public func fetchGames(date: String) async throws -> [Game] {
        let url = "\(baseURL)/games?dates[]=\(date)"
        let response: GamesResponseDTO = try await networkManager.get(
            urlString: url,
            headers: headers
        )
        return response.data.map { $0.toDomain() }
    }
    
    public func fetchTodaysGames() async throws -> [Game] {
        let today = DateFormatter.apiDateFormatter.string(from: Date())
        return try await fetchGames(date: today)
    }
}
