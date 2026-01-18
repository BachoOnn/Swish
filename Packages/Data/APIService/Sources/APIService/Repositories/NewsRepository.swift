//
//  NewsRepository.swift
//  APIService
//
//  Created by Bacho on 18.01.26.
//

import NewsDomain
import MyNetworkManager

public final class NewsRepository: NewsRepositoryProtocol {
    
    private let networkManager: NetworkManager
    
    public init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    public func getNews() async throws -> [News] {
        let url = "https://site.api.espn.com/apis/site/v2/sports/basketball/nba/news"
        let response: NewsResponseDTO = try await networkManager.get(urlString: url)
        return response.articles.map { $0.toDomain() }
    }
}
