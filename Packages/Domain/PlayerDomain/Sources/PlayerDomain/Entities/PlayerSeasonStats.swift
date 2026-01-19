//
//  PlayerSeasonStats.swift
//  PlayerDomain
//
//  Created by Bacho on 20.01.26.
//

import Foundation

public struct PlayerSeasonStats: Codable, Hashable {
    public let gp: Int
    public let min: Double
    public let pts: Double
    public let reb: Double
    public let ast: Double
    public let stl: Double
    public let blk: Double
    public let tov: Double
    public let pf: Double
    public let fgm: Double
    public let fga: Double
    public let fgPct: Double
    public let fg3m: Double
    public let fg3a: Double
    public let fg3Pct: Double
    public let ftm: Double
    public let fta: Double
    public let ftPct: Double
    public let oreb: Double
    public let dreb: Double
    public let w: Int?
    public let l: Int?
    public let age: Int?
    public let dd2: Int?
    public let td3: Int?
    public let plusMinus: Double
    public let pfd: Double?
    public let blka: Double?
    public let wPct: Double?
    public let teamCount: Int?
    public let nbaFantasyPts: Double?
    public let gpRank: Int?
    public let ptsRank: Int?
    public let rebRank: Int?
    public let astRank: Int?
    public let stlRank: Int?
    public let blkRank: Int?
    public let tovRank: Int?
    public let pfRank: Int?
    public let fgmRank: Int?
    public let fgaRank: Int?
    public let fgPctRank: Int?
    public let fg3mRank: Int?
    public let fg3aRank: Int?
    public let fg3PctRank: Int?
    public let ftmRank: Int?
    public let ftaRank: Int?
    public let ftPctRank: Int?
    public let orebRank: Int?
    public let drebRank: Int?
    public let minRank: Int?
    public let wRank: Int?
    public let lRank: Int?
    public let dd2Rank: Int?
    public let td3Rank: Int?
    public let plusMinusRank: Int?
    public let pfdRank: Int?
    public let blkaRank: Int?
    public let wPctRank: Int?
    public let nbaFantasyPtsRank: Int?
    
    public init(
        gp: Int,
        min: Double,
        pts: Double,
        reb: Double,
        ast: Double,
        stl: Double,
        blk: Double,
        tov: Double,
        pf: Double,
        fgm: Double,
        fga: Double,
        fgPct: Double,
        fg3m: Double,
        fg3a: Double,
        fg3Pct: Double,
        ftm: Double,
        fta: Double,
        ftPct: Double,
        oreb: Double,
        dreb: Double,
        w: Int?,
        l: Int?,
        age: Int?,
        dd2: Int?,
        td3: Int?,
        plusMinus: Double,
        pfd: Double?,
        blka: Double?,
        wPct: Double?,
        teamCount: Int?,
        nbaFantasyPts: Double?,
        gpRank: Int?,
        ptsRank: Int?,
        rebRank: Int?,
        astRank: Int?,
        stlRank: Int?,
        blkRank: Int?,
        tovRank: Int?,
        pfRank: Int?,
        fgmRank: Int?,
        fgaRank: Int?,
        fgPctRank: Int?,
        fg3mRank: Int?,
        fg3aRank: Int?,
        fg3PctRank: Int?,
        ftmRank: Int?,
        ftaRank: Int?,
        ftPctRank: Int?,
        orebRank: Int?,
        drebRank: Int?,
        minRank: Int?,
        wRank: Int?,
        lRank: Int?,
        dd2Rank: Int?,
        td3Rank: Int?,
        plusMinusRank: Int?,
        pfdRank: Int?,
        blkaRank: Int?,
        wPctRank: Int?,
        nbaFantasyPtsRank: Int?
    ) {
        self.gp = gp
        self.min = min
        self.pts = pts
        self.reb = reb
        self.ast = ast
        self.stl = stl
        self.blk = blk
        self.tov = tov
        self.pf = pf
        self.fgm = fgm
        self.fga = fga
        self.fgPct = fgPct
        self.fg3m = fg3m
        self.fg3a = fg3a
        self.fg3Pct = fg3Pct
        self.ftm = ftm
        self.fta = fta
        self.ftPct = ftPct
        self.oreb = oreb
        self.dreb = dreb
        self.w = w
        self.l = l
        self.age = age
        self.dd2 = dd2
        self.td3 = td3
        self.plusMinus = plusMinus
        self.pfd = pfd
        self.blka = blka
        self.wPct = wPct
        self.teamCount = teamCount
        self.nbaFantasyPts = nbaFantasyPts
        self.gpRank = gpRank
        self.ptsRank = ptsRank
        self.rebRank = rebRank
        self.astRank = astRank
        self.stlRank = stlRank
        self.blkRank = blkRank
        self.tovRank = tovRank
        self.pfRank = pfRank
        self.fgmRank = fgmRank
        self.fgaRank = fgaRank
        self.fgPctRank = fgPctRank
        self.fg3mRank = fg3mRank
        self.fg3aRank = fg3aRank
        self.fg3PctRank = fg3PctRank
        self.ftmRank = ftmRank
        self.ftaRank = ftaRank
        self.ftPctRank = ftPctRank
        self.orebRank = orebRank
        self.drebRank = drebRank
        self.minRank = minRank
        self.wRank = wRank
        self.lRank = lRank
        self.dd2Rank = dd2Rank
        self.td3Rank = td3Rank
        self.plusMinusRank = plusMinusRank
        self.pfdRank = pfdRank
        self.blkaRank = blkaRank
        self.wPctRank = wPctRank
        self.nbaFantasyPtsRank = nbaFantasyPtsRank
    }
}

extension PlayerSeasonStats {
        
    public var ppg: String {
        String(format: "%.1f", pts)
    }
    
    public var rpg: String {
        String(format: "%.1f", reb)
    }
    
    public var apg: String {
        String(format: "%.1f", ast)
    }
    
    public var mpg: String {
        String(format: "%.1f", min)
    }
    
    public var spg: String {
        String(format: "%.1f", stl)
    }
    
    public var bpg: String {
        String(format: "%.1f", blk)
    }
    
    public var topg: String {
        String(format: "%.1f", tov)
    }
        
    public var fgPctFormatted: String {
        String(format: "%.1f%%", fgPct * 100)
    }
    
    public var fg3PctFormatted: String {
        String(format: "%.1f%%", fg3Pct * 100)
    }
    
    public var ftPctFormatted: String {
        String(format: "%.1f%%", ftPct * 100)
    }
    
    public var wPctFormatted: String {
        guard let wPct = wPct else { return "N/A" }
        return String(format: "%.1f%%", wPct * 100)
    }
    
    public var winPercentage: Double {
        wPct ?? 0
    }
}
