//  PlayerSeasonStatsDTO.swift
//  APIService

import Foundation
import PlayerDomain

public struct PlayerSeasonStatsResponseDTO: Codable {
    let data: [PlayerSeasonStatsDataDTO]
    let meta: MetaDTO
}

public struct PlayerSeasonStatsDataDTO: Codable {
    let player: PlayerDTO 
    let season: Int
    let seasonType: String
    let stats: PlayerStatsValuesDTO
    
    enum CodingKeys: String, CodingKey {
        case player, season, stats
        case seasonType = "season_type"
    }
}

public struct PlayerStatsValuesDTO: Codable {
    let l, w, gp, age, dd2, td3: Int?
    let min, pts, reb, ast, stl, blk, tov, pf: Double?
    let fgm, fga, fgPct, fg3m, fg3a, fg3Pct: Double?
    let ftm, fta, ftPct, oreb, dreb: Double?
    let pfd, blka, wPct, plusMinus, nbaFantasyPts: Double?
    let teamCount: Int?
    let lRank, wRank, gpRank, pfRank, astRank, blkRank: Int?
    let dd2Rank, fgaRank, fgmRank, ftaRank, ftmRank: Int?
    let minRank, pfdRank, ptsRank, rebRank, stlRank: Int?
    let td3Rank, tovRank, blkaRank, drebRank, fg3aRank: Int?
    let fg3mRank, orebRank, wPctRank, fgPctRank, ftPctRank: Int?
    let fg3PctRank, plusMinusRank, nbaFantasyPtsRank: Int?
    
    enum CodingKeys: String, CodingKey {
        case l, w, gp, age, dd2, td3, min, pts, reb, ast, stl, blk, tov, pf
        case fgm, fga, fg3m, fg3a, oreb, dreb, pfd, blka, ftm, fta
        case fgPct = "fg_pct"
        case fg3Pct = "fg3_pct"
        case ftPct = "ft_pct"
        case wPct = "w_pct"
        case plusMinus = "plus_minus"
        case teamCount = "team_count"
        case nbaFantasyPts = "nba_fantasy_pts"
        case lRank = "l_rank", wRank = "w_rank", gpRank = "gp_rank", pfRank = "pf_rank", astRank = "ast_rank", blkRank = "blk_rank"
        case dd2Rank = "dd2_rank", fgaRank = "fga_rank", fgmRank = "fgm_rank", ftaRank = "fta_rank", ftmRank = "ftm_rank"
        case minRank = "min_rank", pfdRank = "pfd_rank", ptsRank = "pts_rank", rebRank = "reb_rank", stlRank = "stl_rank"
        case td3Rank = "td3_rank", tovRank = "tov_rank", blkaRank = "blka_rank", drebRank = "dreb_rank", fg3aRank = "fg3a_rank"
        case fg3mRank = "fg3m_rank", orebRank = "oreb_rank", wPctRank = "w_pct_rank", fgPctRank = "fg_pct_rank", ftPctRank = "ft_pct_rank"
        case fg3PctRank = "fg3_pct_rank", plusMinusRank = "plus_minus_rank", nbaFantasyPtsRank = "nba_fantasy_pts_rank"
    }
}

extension PlayerStatsValuesDTO {
    public func toDomain() -> PlayerSeasonStats {
        PlayerSeasonStats(
            gp: gp ?? 0,
            min: min ?? 0,
            pts: pts ?? 0,
            reb: reb ?? 0,
            ast: ast ?? 0,
            stl: stl ?? 0,
            blk: blk ?? 0,
            tov: tov ?? 0,
            pf: pf ?? 0,
            fgm: fgm ?? 0,
            fga: fga ?? 0,
            fgPct: fgPct ?? 0,
            fg3m: fg3m ?? 0,
            fg3a: fg3a ?? 0,
            fg3Pct: fg3Pct ?? 0,
            ftm: ftm ?? 0,
            fta: fta ?? 0,
            ftPct: ftPct ?? 0,
            oreb: oreb ?? 0,
            dreb: dreb ?? 0,
            w: w,
            l: l,
            age: age,
            dd2: dd2,
            td3: td3,
            plusMinus: plusMinus ?? 0,
            pfd: pfd,
            blka: blka,
            wPct: wPct,
            teamCount: teamCount,
            nbaFantasyPts: nbaFantasyPts,
            gpRank: gpRank,
            ptsRank: ptsRank,
            rebRank: rebRank,
            astRank: astRank,
            stlRank: stlRank,
            blkRank: blkRank,
            tovRank: tovRank,
            pfRank: pfRank,
            fgmRank: fgmRank,
            fgaRank: fgaRank,
            fgPctRank: fgPctRank,
            fg3mRank: fg3mRank,
            fg3aRank: fg3aRank,
            fg3PctRank: fg3PctRank,
            ftmRank: ftmRank,
            ftaRank: ftaRank,
            ftPctRank: ftPctRank,
            orebRank: orebRank,
            drebRank: drebRank,
            minRank: minRank,
            wRank: wRank,
            lRank: lRank,
            dd2Rank: dd2Rank,
            td3Rank: td3Rank,
            plusMinusRank: plusMinusRank,
            pfdRank: pfdRank,
            blkaRank: blkaRank,
            wPctRank: wPctRank,
            nbaFantasyPtsRank: nbaFantasyPtsRank
        )
    }
}
