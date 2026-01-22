//
//  NewsRepository.swift
//  APIService
//
//  Created by Bacho on 18.01.26.
//

import NewsDomain
import MyNetworkManager
import Foundation

public final class NewsRepository: NewsRepositoryProtocol {
    
    private let networkManager: NetworkManager
    private let url: String
    
    public init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
        self.url = Bundle.main.ESPN_NEWS_URL
    }
        
    public func getNews() async throws -> [News] {
        let url = url
        let response: NewsResponseDTO = try await networkManager.get(urlString: url)
        return response.articles.map { $0.toDomain() }
    }
}
