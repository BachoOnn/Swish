//
//  Roster.swift
//  TeamDomain
//
//  Created by Bacho on 23.01.26.
//

public struct Roster: Identifiable, Codable, Hashable {
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let position: String
    public let height: String?
    public let weight: String?
    public let jerseyNumber: String?
    public let college: String?
    public let country: String?
    public let draftYear: Int?
    public let draftRound: Int?
    public let draftNumber: Int?
    public let team: Team
    
    public init(
        id: Int,
        firstName: String,
        lastName: String,
        position: String,
        height: String? = nil,
        weight: String? = nil,
        jerseyNumber: String? = nil,
        college: String? = nil,
        country: String? = nil,
        draftYear: Int? = nil,
        draftRound: Int? = nil,
        draftNumber: Int? = nil,
        team: Team
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.position = position
        self.height = height
        self.weight = weight
        self.jerseyNumber = jerseyNumber
        self.college = college
        self.country = country
        self.draftYear = draftYear
        self.draftRound = draftRound
        self.draftNumber = draftNumber
        self.team = team
    }
}
