//
//  GetNewsUseCase.swift
//  NewsDomain
//
//  Created by Bacho on 18.01.26.
//

protocol GetNewsUseCase {
    func execute() async throws -> [News]
}

public struct DefaultGetNewsUseCase: GetNewsUseCase {
    
    private let newsRepository: NewsRepositoryProtocol
    
    public init(newsRepository: NewsRepositoryProtocol) {
        self.newsRepository = newsRepository
    }
    
    func execute() async throws -> [News] {
        let news = try await newsRepository.getNews()
        
        return news.sorted { news1, news2 in
            news1.id < news2.id
        }
    }
}
