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
    public let images: [NewsImage]
    public let links: NewsLinks
    
    public init(
        id: Int,
        type: String,
        headline: String,
        description: String,
        published: String,
        images: [NewsImage],
        links: NewsLinks
    ) {
        self.id = id
        self.type = type
        self.headline = headline
        self.description = description
        self.published = published
        self.images = images
        self.links = links
    }
}

public struct NewsImage: Identifiable, Hashable {
    public let id: Int
    public let url: String
    
    public init(id: Int, url: String) {
        self.id = id
        self.url = url
    }
}

public struct NewsLinks: Hashable {
    public let web: WebLink
    public let mobile: MobileLink
    
    public init(web: WebLink, mobile: MobileLink) {
        self.web = web
        self.mobile = mobile
    }
}

public struct WebLink: Hashable {
    public let href: String
    
    public init(href: String) {
        self.href = href
    }
}

public struct MobileLink: Hashable {
    public let href: String
    
    public init(href: String) {
        self.href = href
    }
}
