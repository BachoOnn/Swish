//
//  NewsDTO.swift
//  NewsData
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
    public let description: String?
    public let published: String
    public let images: [ImageDTO]?
    public let links: LinksDTO
}

public struct ImageDTO: Codable {
    public let id: Int?
    public let url: String
    public let width: Int?
    public let height: Int?
    public let alt: String?
    public let caption: String?
}

public struct LinksDTO: Codable {
    public let web: WebLinkDTO
    public let mobile: MobileLinkDTO?
}

public struct WebLinkDTO: Codable {
    public let href: String
}

public struct MobileLinkDTO: Codable {
    public let href: String
}

extension NewsDTO {
    public func toDomain() -> News {
        News(
            id: id,
            type: type,
            headline: headline,
            description: description ?? headline,
            published: published,
            images: images?.map { $0.toDomain() } ?? [],
            links: links.toDomain()
        )
    }
}

extension ImageDTO {
    public func toDomain() -> NewsImage {
        NewsImage(
            id: id ?? abs(url.hashValue), 
            url: url
        )
    }
}

extension LinksDTO {
    public func toDomain() -> NewsLinks {
        NewsLinks(
            web: web.toDomain(),
            mobile: mobile?.toDomain() ?? MobileLink(href: web.href)
        )
    }
}

extension WebLinkDTO {
    public func toDomain() -> WebLink {
        WebLink(href: href)
    }
}

extension MobileLinkDTO {
    public func toDomain() -> MobileLink {
        MobileLink(href: href)
    }
}
