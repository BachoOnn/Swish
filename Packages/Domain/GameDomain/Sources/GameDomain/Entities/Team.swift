//
//  Team.swift
//  GameDomain
//
//  Created by Bacho on 17.01.26.
//

import Foundation

public struct Team: Identifiable, Hashable {
    public let id: Int
    public let conference: String
    public let division: String
    public let city: String
    public let name: String
    public let fullName: String
    public let abbreviation: String
    
    public init(
        id: Int,
        conference: String,
        division: String,
        city: String,
        name: String,
        fullName: String,
        abbreviation: String
    ) {
        self.id = id
        self.conference = conference
        self.division = division
        self.city = city
        self.name = name
        self.fullName = fullName
        self.abbreviation = abbreviation
    }
}
