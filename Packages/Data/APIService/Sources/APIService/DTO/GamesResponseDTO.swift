//
//  GameDTO.swift
//  APIService
//
//  Created by Bacho on 17.01.26.
//

import Foundation

// MARK: - API Response
struct GamesResponseDTO: Codable {
    let data: [GameDTO]
    let meta: MetaDTO
}

// MARK: - Game DTO (matches API exactly)
struct GameDTO: Codable {
    let id: Int
    let date: String
    let season: Int
    let status: String
    let homeTeamScore: Int
    let visitorTeamScore: Int
    let homeTeam: TeamDTO
    let visitorTeam: TeamDTO
    
    enum CodingKeys: String, CodingKey {
        case id, date, season, status
        case homeTeamScore = "home_team_score"
        case visitorTeamScore = "visitor_team_score"
        case homeTeam = "home_team"
        case visitorTeam = "visitor_team"
    }
}

// MARK: - Team DTO
struct TeamDTO: Codable {
    let id: Int
    let conference: String
    let division: String
    let city: String
    let name: String
    let fullName: String
    let abbreviation: String
    
    enum CodingKeys: String, CodingKey {
        case id, conference, division, city, name, abbreviation
        case fullName = "full_name"
    }
}

// MARK: - Meta DTO
struct MetaDTO: Codable {
    let perPage: Int
    
    enum CodingKeys: String, CodingKey {
        case perPage = "per_page"
    }
}