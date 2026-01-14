//
//  User.swift
//  Swish
//
//  Created by Bacho on 04.01.26.
//

import Foundation

public struct User: Identifiable, Equatable {
    public let id: String
    public let email: String
    public let createdAt: Date
    public let name: String
    
    public init(id: String, email: String, createdAt: Date = Date(), name: String) {
        self.id = id
        self.email = email
        self.createdAt = createdAt
        self.name = name
    }
}
