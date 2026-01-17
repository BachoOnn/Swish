//
//  GamesResponseDTO.swift
//  APIService
//
//  Created by Bacho on 17.01.26.
//

import Foundation
import GameDomain

struct GamesResponseDTO: Codable {
    let data: [GameDTO]
    let meta: MetaDTO
}

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

struct MetaDTO: Codable {
    let perPage: Int
    
    enum CodingKeys: String, CodingKey {
        case perPage = "per_page"
    }
}

extension GameDTO {
    func toDomain() -> Game {
        Game(
            id: id,
            date: date,
            season: season,
            status: status,
            homeTeam: homeTeam.toDomain(),
            visitorTeam: visitorTeam.toDomain(),
            homeTeamScore: homeTeamScore,
            visitorTeamScore: visitorTeamScore
        )
    }
}

extension TeamDTO {
    func toDomain() -> Team {
        Team(
            id: id,
            conference: conference,
            division: division,
            city: city,
            name: name,
            fullName: fullName,
            abbreviation: abbreviation
        )
    }
}
