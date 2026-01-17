//
//  NewsDTO.swift
//  APIService
//
//  Created by Bacho on 18.01.26.
//

import Foundation
import NewsDomain

public struct NewsResponseDTO: Codable {
    public let articles: [NewsDTO]
}

public struct NewsDTO: Codable {
    public let id: Int
    public let type: String
    public let headline: String
    public let description: String
    public let published: String
    public let images: [ImageDTO]
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case headline
        case description
        case published
        case images
    }
}

public struct ImageDTO: Codable {
    public let id: Int
    public let url: String
}

extension NewsDTO {
    public func toDomain() -> News {
        News(
            id: id,
            type: type,
            headline: headline,
            description: description,
            published: published,
            images: images.map { $0.toDomain() }
        )
    }
}

extension ImageDTO {
    public func toDomain() -> Image {
        Image(id: id, url: url)
    }
}
