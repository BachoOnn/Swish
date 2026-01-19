//
//  StatsResponseDTO.swift
//  APIService
//
//  Created by Bacho on 18.01.26.
//

import Foundation
import GameDomain


struct StatsResponseDTO: Codable {
    let data: [PlayerStatsDTO]
    let meta: MetaDTO
}

struct PlayerStatsDTO: Codable {
    let id: Int
    let player: PlayerDTO
    let team: TeamDTO
    let game: GameReferenceDTO
    let min: String?
    let pts: Int
    let fgm: Int
    let fga: Int
    let fgPct: Double?
    let fg3m: Int
    let fg3a: Int
    let fg3Pct: Double?
    let ftm: Int
    let fta: Int
    let ftPct: Double?
    let oreb: Int
    let dreb: Int
    let reb: Int
    let ast: Int
    let stl: Int
    let blk: Int
    let turnover: Int
    let pf: Int
    
    enum CodingKeys: String, CodingKey {
        case id, player, team, game, min, pts, ast, stl, blk, pf
        case fgm, fga, oreb, dreb, reb, turnover
        case fgPct = "fg_pct"
        case fg3m = "fg3m"
        case fg3a = "fg3a"
        case fg3Pct = "fg3_pct"
        case ftm, fta
        case ftPct = "ft_pct"
    }
}


struct PlayerDTO: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let position: String
    let jerseyNumber: String?
    
    enum CodingKeys: String, CodingKey {
        case id, position
        case firstName = "first_name"
        case lastName = "last_name"
        case jerseyNumber = "jersey_number"
    }
}

struct GameReferenceDTO: Codable {
    let id: Int
    let date: String
    let season: Int
    let homeTeamId: Int
    let visitorTeamId: Int
    
    enum CodingKeys: String, CodingKey {
        case id, date, season
        case homeTeamId = "home_team_id"
        case visitorTeamId = "visitor_team_id"
    }
}

extension PlayerStatsDTO {
    func toDomain() -> PlayerStats {
        PlayerStats(
            id: id,
            player: player.toDomain(),
            team: team.toGameDomain(),
            game: game.toDomain(),
            min: min,
            pts: pts,
            fgm: fgm,
            fga: fga,
            fgPct: fgPct,
            fg3m: fg3m,
            fg3a: fg3a,
            fg3Pct: fg3Pct,
            ftm: ftm,
            fta: fta,
            ftPct: ftPct,
            oreb: oreb,
            dreb: dreb,
            reb: reb,
            ast: ast,
            stl: stl,
            blk: blk,
            turnover: turnover,
            pf: pf
        )
    }
}

extension PlayerDTO {
    func toDomain() -> Player {
        Player(
            id: id,
            firstName: firstName,
            lastName: lastName,
            position: position,
            jerseyNumber: jerseyNumber
        )
    }
}

extension GameReferenceDTO {
    func toDomain() -> GameReference {
        GameReference(
            id: id,
            date: date,
            season: season,
            homeTeamId: homeTeamId,
            visitorTeamId: visitorTeamId
        )
    }
}
