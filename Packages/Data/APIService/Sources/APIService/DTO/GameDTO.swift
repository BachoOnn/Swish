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
    let dateTime: String
    let season: Int
    let status: String
    let homeTeamScore: Int
    let visitorTeamScore: Int
    let homeTeam: TeamDTO
    let visitorTeam: TeamDTO
    
    // Quarter scores
    let homeQ1: Int?
    let homeQ2: Int?
    let homeQ3: Int?
    let homeQ4: Int?
    
    let visitorQ1: Int?
    let visitorQ2: Int?
    let visitorQ3: Int?
    let visitorQ4: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, date, season, status
        case homeTeamScore = "home_team_score"
        case visitorTeamScore = "visitor_team_score"
        case homeTeam = "home_team"
        case visitorTeam = "visitor_team"
        case dateTime = "datetime"
        
        case homeQ1 = "home_q1"
        case homeQ2 = "home_q2"
        case homeQ3 = "home_q3"
        case homeQ4 = "home_q4"
        
        case visitorQ1 = "visitor_q1"
        case visitorQ2 = "visitor_q2"
        case visitorQ3 = "visitor_q3"
        case visitorQ4 = "visitor_q4"
    }
}


extension GameDTO {
    func toDomain() -> Game {
        Game(
            id: id,
            date: date,
            dateTime: dateTime,
            season: season,
            status: status,
            homeTeam: homeTeam.toGameDomain(),
            visitorTeam: visitorTeam.toGameDomain(),
            homeTeamScore: homeTeamScore,
            visitorTeamScore: visitorTeamScore,
            homeQ1: homeQ1,
            homeQ2: homeQ2,
            homeQ3: homeQ3,
            homeQ4: homeQ4,
            visitorQ1: visitorQ1,
            visitorQ2: visitorQ2,
            visitorQ3: visitorQ3,
            visitorQ4: visitorQ4
        )
    }
}
