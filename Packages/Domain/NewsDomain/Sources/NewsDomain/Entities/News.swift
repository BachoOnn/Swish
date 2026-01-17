//
//  News.swift
//  NewsDomain
//
//  Created by Bacho on 18.01.26.
//

public struct News: Identifiable, Hashable {
    public let id: Int
    public let type: String
    public let headline: String
    public let description: String
    public let published: String
    public let images: [Image]
    
    public init(id: Int, type: String, headline: String, description: String, published: String, images: [Image]) {
        self.id = id
        self.type = type
        self.headline = headline
        self.description = description
        self.published = published
        self.images = images
    }
}

public struct Image: Identifiable, Hashable {
    public let id: Int
    public let url: String
    
    public init(id: Int, url: String) {
        self.id = id
        self.url = url
    }
}
