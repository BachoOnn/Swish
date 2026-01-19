//
//  TeamSeasonAveragesResponseDTO.swift
//  APIService
//
//  Created by Bacho on 19.01.26.
//

import Foundation
import TeamDomain

public struct TeamSeasonAveragesResponseDTO: Codable {
    let data: [TeamSeasonAveragesDTO]
    let meta: TeamMetaDTO
}

public struct TeamSeasonAveragesDTO: Codable {
    let team: TeamInfoDTO
    let season: Int
    let seasonType: String
    let stats: TeamSeasonStatsDTO
    
    enum CodingKeys: String, CodingKey {
        case team, season
        case seasonType = "season_type"
        case stats
    }
}

public struct TeamInfoDTO: Codable {
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

public struct TeamSeasonStatsDTO: Codable {
    let w: Int
    let l: Int
    let gp: Int
    let wPct: Double
    let pts: Double
    let fgm: Double
    let fga: Double
    let fgPct: Double
    let fg3m: Double
    let fg3a: Double
    let fg3Pct: Double
    let ftm: Double
    let fta: Double
    let ftPct: Double
    let reb: Double
    let oreb: Double
    let dreb: Double
    let ast: Double
    let stl: Double
    let blk: Double
    let tov: Double
    let pf: Double
    let pfd: Double
    let blka: Double
    let min: Double
    let plusMinus: Double
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
}

public struct TeamMetaDTO: Codable {
    let perPage: Int
    
    enum CodingKeys: String, CodingKey {
        case perPage = "per_page"
    }
}

extension TeamSeasonStatsDTO {
    public func toDomain() -> TeamSeasonStats  {
        TeamSeasonStats(
            w: w,
            l: l,
            gp: gp,
            wPct: wPct,
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
            reb: reb,
            oreb: oreb,
            dreb: dreb,
            ast: ast,
            stl: stl,
            blk: blk,
            tov: tov,
            pf: pf,
            pfd: pfd,
            blka: blka,
            min: min,
            plusMinus: plusMinus,
            wRank: wRank,
            lRank: lRank,
            gpRank: gpRank,
            wPctRank: wPctRank,
            ptsRank: ptsRank,
            fgmRank: fgmRank,
            fgaRank: fgaRank,
            fgPctRank: fgPctRank,
            fg3mRank: fg3mRank,
            fg3aRank: fg3aRank,
            fg3PctRank: fg3PctRank,
            ftmRank: ftmRank,
            ftaRank: ftaRank,
            ftPctRank: ftPctRank,
            rebRank: rebRank,
            orebRank: orebRank,
            drebRank: drebRank,
            astRank: astRank,
            stlRank: stlRank,
            blkRank: blkRank,
            tovRank: tovRank,
            pfRank: pfRank,
            pfdRank: pfdRank,
            blkaRank: blkaRank,
            minRank: minRank,
            plusMinusRank: plusMinusRank
        )
    }
}
