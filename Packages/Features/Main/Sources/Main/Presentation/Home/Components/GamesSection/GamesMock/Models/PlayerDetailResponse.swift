//
//  PlayerDetailResponse.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import Foundation

// MARK: - Player Detail Response (matches API)

public struct PlayerDetailResponse: Codable {
    let data: [PlayerDetail]
    let meta: Meta
}

public struct PlayerDetail: Codable, Identifiable {
    public let id: Int
    let firstName: String
    let lastName: String
    let position: String
    let height: String?
    let weight: String?
    let jerseyNumber: String?
    let college: String?
    let country: String?
    let draftYear: Int?
    let draftRound: Int?
    let draftNumber: Int?
    let teamId: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case position, height, weight
        case jerseyNumber = "jersey_number"
        case college, country
        case draftYear = "draft_year"
        case draftRound = "draft_round"
        case draftNumber = "draft_number"
        case teamId = "team_id"
    }
    
    public var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    public var draftInfo: String {
        guard let year = draftYear, let round = draftRound, let number = draftNumber else {
            return "Undrafted"
        }
        return "Round \(round), Pick \(number) (\(year))"
    }
}

// MARK: - Season Averages Response (matches API)

public struct PlayerSeasonAveragesResponse: Codable {
    let data: [PlayerSeasonAverages]
    let meta: Meta
}

public struct PlayerSeasonAverages: Codable {
    let player: PlayerInSeasonStats
    let season: Int
    let seasonType: String
    let stats: SeasonStats
    
    enum CodingKeys: String, CodingKey {
        case player, season
        case seasonType = "season_type"
        case stats
    }
}

public struct PlayerInSeasonStats: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let position: String
    let height: String?
    let weight: String?
    let jerseyNumber: String?
    let college: String?
    let country: String?
    let draftYear: Int?
    let draftRound: Int?
    let draftNumber: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case position, height, weight
        case jerseyNumber = "jersey_number"
        case college, country
        case draftYear = "draft_year"
        case draftRound = "draft_round"
        case draftNumber = "draft_number"
    }
}

public struct SeasonStats: Codable {
    let gamesPlayed: Int
    let min: Double
    let fgm: Double
    let fga: Double
    let fg3m: Double
    let fg3a: Double
    let ftm: Double
    let fta: Double
    let oreb: Double
    let dreb: Double
    let reb: Double
    let ast: Double
    let stl: Double
    let blk: Double
    let turnover: Double
    let pf: Double
    let pts: Double
    let fgPct: Double
    let fg3Pct: Double
    let ftPct: Double
    
    enum CodingKeys: String, CodingKey {
        case gamesPlayed = "games_played"
        case min, fgm, fga
        case fg3m = "fg3_m"
        case fg3a = "fg3_a"
        case ftm, fta, oreb, dreb, reb, ast, stl, blk, turnover, pf, pts
        case fgPct = "fg_pct"
        case fg3Pct = "fg3_pct"
        case ftPct = "ft_pct"
    }
}

// MARK: - Shooting Stats Response (matches API exactly)

public struct PlayerShootingStatsResponse: Codable {
    let data: [PlayerShootingStats]
    let meta: Meta
}

public struct PlayerShootingStats: Codable {
    let player: PlayerInSeasonStats
    let season: Int
    let seasonType: String
    let stats: ShootingRangeStats
    
    enum CodingKeys: String, CodingKey {
        case player, season
        case seasonType = "season_type"
        case stats
    }
}

public struct ShootingRangeStats: Codable {
    // Less than 5 ft
    let lessThan5FtFga: Double
    let lessThan5FtFgm: Double
    let lessThan5FtFgPct: Double
    
    // 5-9 ft
    let ft5to9Fga: Double
    let ft5to9Fgm: Double
    let ft5to9FgPct: Double
    
    // 10-14 ft
    let ft10to14Fga: Double
    let ft10to14Fgm: Double
    let ft10to14FgPct: Double
    
    // 15-19 ft
    let ft15to19Fga: Double
    let ft15to19Fgm: Double
    let ft15to19FgPct: Double
    
    // 20-24 ft
    let ft20to24Fga: Double
    let ft20to24Fgm: Double
    let ft20to24FgPct: Double
    
    // 25-29 ft (3PT range)
    let ft25to29Fga: Double
    let ft25to29Fgm: Double
    let ft25to29FgPct: Double
    
    // 30-34 ft
    let ft30to34Fga: Double
    let ft30to34Fgm: Double
    let ft30to34FgPct: Double
    
    // 35-39 ft
    let ft35to39Fga: Double
    let ft35to39Fgm: Double
    let ft35to39FgPct: Double
    
    // 40+ ft
    let ft40PlusFga: Double
    let ft40PlusFgm: Double
    let ft40PlusFgPct: Double
    
    enum CodingKeys: String, CodingKey {
        case lessThan5FtFga = "less_than_5_ft._fga"
        case lessThan5FtFgm = "less_than_5_ft._fgm"
        case lessThan5FtFgPct = "less_than_5_ft._fg_pct"
        
        case ft5to9Fga = "5-9_ft._fga"
        case ft5to9Fgm = "5-9_ft._fgm"
        case ft5to9FgPct = "5-9_ft._fg_pct"
        
        case ft10to14Fga = "10-14_ft._fga"
        case ft10to14Fgm = "10-14_ft._fgm"
        case ft10to14FgPct = "10-14_ft._fg_pct"
        
        case ft15to19Fga = "15-19_ft._fga"
        case ft15to19Fgm = "15-19_ft._fgm"
        case ft15to19FgPct = "15-19_ft._fg_pct"
        
        case ft20to24Fga = "20-24_ft._fga"
        case ft20to24Fgm = "20-24_ft._fgm"
        case ft20to24FgPct = "20-24_ft._fg_pct"
        
        case ft25to29Fga = "25-29_ft._fga"
        case ft25to29Fgm = "25-29_ft._fgm"
        case ft25to29FgPct = "25-29_ft._fg_pct"
        
        case ft30to34Fga = "30-34_ft._fga"
        case ft30to34Fgm = "30-34_ft._fgm"
        case ft30to34FgPct = "30-34_ft._fg_pct"
        
        case ft35to39Fga = "35-39_ft._fga"
        case ft35to39Fgm = "35-39_ft._fgm"
        case ft35to39FgPct = "35-39_ft._fg_pct"
        
        case ft40PlusFga = "40+_ft._fga"
        case ft40PlusFgm = "40+_ft._fgm"
        case ft40PlusFgPct = "40+_ft._fg_pct"
    }
}
