//
//  User.swift
//  Swish
//
//  Created by Bacho on 04.01.26.
//

import Foundation

struct User: Identifiable, Equatable {
    let id: String
    let email: String
    let createdAt: Date
    
    init(id: String, email: String, createdAt: Date = Date()) {
        self.id = id
        self.email = email
        self.createdAt = createdAt
    }
}
