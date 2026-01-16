//
//  PlayerDetailResponse.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import Foundation


public struct PlayerDetailResponse: Codable {
    let data: [PlayerDetail]
    let meta: PlayerMeta
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
}

public struct PlayerSeasonAveragesResponse: Codable {
    let data: [PlayerSeasonAverages]
    let meta: PlayerMeta
}

public struct PlayerSeasonAverages: Codable, Hashable {
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

public struct PlayerInSeasonStats: Codable, Hashable {
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

public struct SeasonStats: Codable, Hashable {
    // Basic Stats
    let gp: Int           // Games Played
    let min: Double       // Minutes Per Game
    let pts: Double       // Points Per Game
    let reb: Double       // Rebounds Per Game
    let ast: Double       // Assists Per Game
    let stl: Double       // Steals Per Game
    let blk: Double       // Blocks Per Game
    let tov: Double       // Turnovers Per Game
    let pf: Double        // Personal Fouls Per Game
    let fgm: Double       // Field Goals Made
    let fga: Double       // Field Goals Attempted
    let fgPct: Double     // Field Goal Percentage
    let fg3m: Double      // 3-Point Field Goals Made
    let fg3a: Double      // 3-Point Field Goals Attempted
    let fg3Pct: Double    // 3-Point Percentage
    let ftm: Double       // Free Throws Made
    let fta: Double       // Free Throws Attempted
    let ftPct: Double     // Free Throw Percentage
    let oreb: Double      // Offensive Rebounds
    let dreb: Double      // Defensive Rebounds
    let w: Int?           // Wins
    let l: Int?           // Losses
    let age: Int?         // Player age
    let dd2: Int?         // Double-doubles
    let td3: Int?         // Triple-doubles
    let plusMinus: Double // Plus/Minus
    let pfd: Double?      // Personal Fouls Drawn
    let blka: Double?     // Blocks Against
    let wPct: Double?     // Win Percentage
    let teamCount: Int?   // Number of teams played for
    let nbaFantasyPts: Double? // NBA Fantasy Points
    
    // Rankings
    let gpRank: Int?
    let ptsRank: Int?
    let rebRank: Int?
    let astRank: Int?
    let stlRank: Int?
    let blkRank: Int?
    let tovRank: Int?
    let pfRank: Int?
    let fgmRank: Int?
    let fgaRank: Int?
    let fgPctRank: Int?
    let fg3mRank: Int?
    let fg3aRank: Int?
    let fg3PctRank: Int?
    let ftmRank: Int?
    let ftaRank: Int?
    let ftPctRank: Int?
    let orebRank: Int?
    let drebRank: Int?
    let minRank: Int?
    let wRank: Int?
    let lRank: Int?
    let dd2Rank: Int?
    let td3Rank: Int?
    let plusMinusRank: Int?
    let pfdRank: Int?
    let blkaRank: Int?
    let wPctRank: Int?
    let nbaFantasyPtsRank: Int?
    
    enum CodingKeys: String, CodingKey {
        case gp, min, pts, reb, ast, stl, blk, tov, pf, fgm, fga
        case fgPct = "fg_pct"
        case fg3m, fg3a
        case fg3Pct = "fg3_pct"
        case ftm, fta
        case ftPct = "ft_pct"
        case oreb, dreb
        case w, l, age, dd2, td3
        case plusMinus = "plus_minus"
        case pfd, blka
        case wPct = "w_pct"
        case teamCount = "team_count"
        case nbaFantasyPts = "nba_fantasy_pts"
        
        // Rankings
        case gpRank = "gp_rank"
        case ptsRank = "pts_rank"
        case rebRank = "reb_rank"
        case astRank = "ast_rank"
        case stlRank = "stl_rank"
        case blkRank = "blk_rank"
        case tovRank = "tov_rank"
        case pfRank = "pf_rank"
        case fgmRank = "fgm_rank"
        case fgaRank = "fga_rank"
        case fgPctRank = "fg_pct_rank"
        case fg3mRank = "fg3m_rank"
        case fg3aRank = "fg3a_rank"
        case fg3PctRank = "fg3_pct_rank"
        case ftmRank = "ftm_rank"
        case ftaRank = "fta_rank"
        case ftPctRank = "ft_pct_rank"
        case orebRank = "oreb_rank"
        case drebRank = "dreb_rank"
        case minRank = "min_rank"
        case wRank = "w_rank"
        case lRank = "l_rank"
        case dd2Rank = "dd2_rank"
        case td3Rank = "td3_rank"
        case plusMinusRank = "plus_minus_rank"
        case pfdRank = "pfd_rank"
        case blkaRank = "blka_rank"
        case wPctRank = "w_pct_rank"
        case nbaFantasyPtsRank = "nba_fantasy_pts_rank"
    }
    
    public var ppg: String { String(format: "%.1f", pts) }
    public var rpg: String { String(format: "%.1f", reb) }
    public var apg: String { String(format: "%.1f", ast) }
    public var rbpg: String { String(format: "%.1f", reb) }
    public var spg: String { String(format: "%.1f", stl) }
    public var bpg: String { String(format: "%.1f", blk) }
    public var tovpg: String { String(format: "%.1f", tov) }
    public var fgPercentage: String { String(format: "%.1f%%", fgPct * 100) }
    public var fg3Percentage: String { String(format: "%.1f%%", fg3Pct * 100) }
    public var ftPercentage: String { String(format: "%.1f%%", ftPct * 100) }
    public var mpg: String { String(format: "%.1f", min) }
}

// MARK: - Shooting Stats Response (matches API exactly)

public struct PlayerShootingStatsResponse: Codable {
    let data: [PlayerShootingStats]
    let meta: PlayerMeta
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

public struct PlayerMeta: Codable {
    let perPage: Int
    
    enum CodingKeys: String, CodingKey {
        case perPage = "per_page"
    }
}
