//
//  TeamSeasonAveragesResponse.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import Foundation

// MARK: - Team Season Averages Response

public struct TeamSeasonAveragesResponse: Codable {
    let data: [TeamSeasonAverages]
    let meta: TeamMeta
}

public struct TeamSeasonAverages: Codable {
    let team: TeamInfo
    let season: Int
    let seasonType: String
    let stats: TeamSeasonStats
    
    enum CodingKeys: String, CodingKey {
        case team, season
        case seasonType = "season_type"
        case stats
    }
}

public struct TeamInfo: Codable {
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

// MARK: - Team Season Stats

public struct TeamSeasonStats: Codable {
    let w: Int           // Wins
    let l: Int           // Losses
    let gp: Int          // Games Played
    let wPct: Double     // Win Percentage
    
    // Scoring
    let pts: Double      // Points Per Game
    let fgm: Double      // Field Goals Made
    let fga: Double      // Field Goals Attempted
    let fgPct: Double    // Field Goal Percentage
    let fg3m: Double     // 3-Point Field Goals Made
    let fg3a: Double     // 3-Point Field Goals Attempted
    let fg3Pct: Double   // 3-Point Percentage
    let ftm: Double      // Free Throws Made
    let fta: Double      // Free Throws Attempted
    let ftPct: Double    // Free Throw Percentage
    
    // Rebounds
    let reb: Double      // Total Rebounds
    let oreb: Double     // Offensive Rebounds
    let dreb: Double     // Defensive Rebounds
    
    // Other Stats
    let ast: Double      // Assists
    let stl: Double      // Steals
    let blk: Double      // Blocks
    let tov: Double      // Turnovers
    let pf: Double       // Personal Fouls
    let pfd: Double      // Personal Fouls Drawn
    let blka: Double     // Blocks Against
    let min: Double      // Minutes
    let plusMinus: Double // Plus/Minus
    
    // Rankings
    let wRank: Int
    let lRank: Int
    let gpRank: Int
    let wPctRank: Int
    let ptsRank: Int
    let fgmRank: Int
    let fgaRank: Int
    let fgPctRank: Int
    let fg3mRank: Int
    let fg3aRank: Int
    let fg3PctRank: Int
    let ftmRank: Int
    let ftaRank: Int
    let ftPctRank: Int
    let rebRank: Int
    let orebRank: Int
    let drebRank: Int
    let astRank: Int
    let stlRank: Int
    let blkRank: Int
    let tovRank: Int
    let pfRank: Int
    let pfdRank: Int
    let blkaRank: Int
    let minRank: Int
    let plusMinusRank: Int
    
    enum CodingKeys: String, CodingKey {
        case w, l, gp
        case wPct = "w_pct"
        case pts, fgm, fga
        case fgPct = "fg_pct"
        case fg3m, fg3a
        case fg3Pct = "fg3_pct"
        case ftm, fta
        case ftPct = "ft_pct"
        case reb, oreb, dreb, ast, stl, blk, tov, pf, pfd, blka, min
        case plusMinus = "plus_minus"
        
        // Rankings
        case wRank = "w_rank"
        case lRank = "l_rank"
        case gpRank = "gp_rank"
        case wPctRank = "w_pct_rank"
        case ptsRank = "pts_rank"
        case fgmRank = "fgm_rank"
        case fgaRank = "fga_rank"
        case fgPctRank = "fg_pct_rank"
        case fg3mRank = "fg3m_rank"
        case fg3aRank = "fg3a_rank"
        case fg3PctRank = "fg3_pct_rank"
        case ftmRank = "ftm_rank"
        case ftaRank = "fta_rank"
        case ftPctRank = "ft_pct_rank"
        case rebRank = "reb_rank"
        case orebRank = "oreb_rank"
        case drebRank = "dreb_rank"
        case astRank = "ast_rank"
        case stlRank = "stl_rank"
        case blkRank = "blk_rank"
        case tovRank = "tov_rank"
        case pfRank = "pf_rank"
        case pfdRank = "pfd_rank"
        case blkaRank = "blka_rank"
        case minRank = "min_rank"
        case plusMinusRank = "plus_minus_rank"
    }
    
    // Computed properties for display
    public var ppg: String { String(format: "%.1f", pts) }
    public var rpg: String { String(format: "%.1f", reb) }
    public var apg: String { String(format: "%.1f", ast) }
    public var fgPercentage: String { String(format: "%.1f%%", fgPct * 100) }
    public var fg3Percentage: String { String(format: "%.1f%%", fg3Pct * 100) }
    public var ftPercentage: String { String(format: "%.1f%%", ftPct * 100) }
    public var winPercentage: String { String(format: "%.1f%%", wPct * 100) }
}

public struct TeamMeta: Codable {
    let perPage: Int
    
    enum CodingKeys: String, CodingKey {
        case perPage = "per_page"
    }
}
