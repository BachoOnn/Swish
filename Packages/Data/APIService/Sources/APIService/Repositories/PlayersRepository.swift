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
        let url = "\(baseURL)/players/active?search=\(name)"
        let response: PlayerResponseDTO = try await networkManager.get(urlString: url, headers: headers)
        
        return response.data.map { $0.toDomain() }
    }
}
