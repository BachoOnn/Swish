//
//  GamesRepositoryImpl.swift
//  APIService
//
//  Created by Bacho on 17.01.26.
//

import Foundation
import GameDomain

public final class GamesRepository: GamesRepository {
    
    private let networkManager: NetworkManager
    private let baseURL: String
    private let apiKey: String
    
    // MARK: - Initialization
    
    /// Default initializer - reads from Bundle.main Config
    public init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
        self.baseURL = Bundle.main.BALLDONTLIE_BASE_URL
        self.apiKey = Bundle.main.BALLDONTLIE_API_KEY
    }
    
    /// Custom initializer for testing or different configs
    init(
        networkManager: NetworkManager,
        baseURL: String,
        apiKey: String
    ) {
        self.networkManager = networkManager
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    
    private var headers: [String: String] {
        ["Authorization": apiKey]
    }
    
    // MARK: - GamesRepository
    
    public func fetchGames(date: String) async throws -> [Game] {
        let url = "\(baseURL)/games?dates[]=\(date)"
        let response: GamesResponseDTO = try await networkManager.fetch(
            urlString: url,
            headers: headers
        )
        return response.data.map { $0.toDomain() }
    }
    
    public func fetchGames(startDate: String, endDate: String) async throws -> [Game] {
        let url = "\(baseURL)/games?start_date=\(startDate)&end_date=\(endDate)"
        let response: GamesResponseDTO = try await networkManager.fetch(
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
