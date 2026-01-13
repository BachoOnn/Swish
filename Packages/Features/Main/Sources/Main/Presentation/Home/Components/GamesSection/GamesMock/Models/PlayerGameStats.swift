//
//  PlayerGameStats.swift
//  Swish
//
//  Created by Bacho on 11.01.26.
//


import Foundation

// MARK: - Stats Response
public struct StatsResponse: Codable {
    let data: [PlayerGameStats]
}

// MARK: - Player Game Stats
public struct PlayerGameStats: Codable {
    let id: Int
    let player: PlayerInfo
    let team: Team
    let game: GameInfo
    let min: String?
    let pts: Int
    let reb: Int
    let ast: Int
    let stl: Int?
    let blk: Int?
    let turnover: Int?
    let fgm: Int?
    let fga: Int?
    let fg3m: Int?
    let fg3a: Int?
    let ftm: Int?
    let fta: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, player, team, game, min, pts, reb, ast, stl, blk, turnover
        case fgm, fga
        case fg3m = "fg3_m"
        case fg3a = "fg3_a"
        case ftm, fta
    }
}

// MARK: - Player Info
public struct PlayerInfo: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let position: String
    let jerseyNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case position
        case jerseyNumber = "jersey_number"
    }
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

// MARK: - Game Info
public struct GameInfo: Codable {
    let id: Int
    let date: String
    let homeTeamId: Int
    let visitorTeamId: Int
    let season: Int
    
    enum CodingKeys: String, CodingKey {
        case id, date, season
        case homeTeamId = "home_team_id"
        case visitorTeamId = "visitor_team_id"
    }
}


public extension PlayerGameStats {
    var displayNumber: String {
        player.jerseyNumber ?? "0"
    }
    
    var photoName: String {
        // TODO: Change later with real espn photos
        team.abbreviation
    }
}
