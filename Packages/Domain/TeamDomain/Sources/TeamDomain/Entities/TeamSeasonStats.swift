//
//  TeamSeasonStats.swift
//  TeamDomain
//
//  Created by Bacho on 19.01.26.
//

public struct TeamSeasonStats: Codable {
    public let w: Int
    public let l: Int
    public let gp: Int
    public let wPct: Double
    public let pts: Double
    public let fgm: Double
    public let fga: Double
    public let fgPct: Double
    public let fg3m: Double
    public let fg3a: Double
    public let fg3Pct: Double
    public let ftm: Double
    public let fta: Double
    public let ftPct: Double
    public let reb: Double
    public let oreb: Double
    public let dreb: Double
    public let ast: Double
    public let stl: Double
    public let blk: Double
    public let tov: Double
    public let pf: Double
    public let pfd: Double
    public let blka: Double
    public let min: Double
    public let plusMinus: Double
    public let wRank: Int
    public let lRank: Int
    public let gpRank: Int
    public let wPctRank: Int
    public let ptsRank: Int
    public let fgmRank: Int
    public let fgaRank: Int
    public let fgPctRank: Int
    public let fg3mRank: Int
    public let fg3aRank: Int
    public let fg3PctRank: Int
    public let ftmRank: Int
    public let ftaRank: Int
    public let ftPctRank: Int
    public let rebRank: Int
    public let orebRank: Int
    public let drebRank: Int
    public let astRank: Int
    public let stlRank: Int
    public let blkRank: Int
    public let tovRank: Int
    public let pfRank: Int
    public let pfdRank: Int
    public let blkaRank: Int
    public let minRank: Int
    public let plusMinusRank: Int
    
    public init(w: Int, l: Int, gp: Int, wPct: Double, pts: Double, fgm: Double, fga: Double, fgPct: Double, fg3m: Double, fg3a: Double, fg3Pct: Double, ftm: Double, fta: Double, ftPct: Double, reb: Double, oreb: Double, dreb: Double, ast: Double, stl: Double, blk: Double, tov: Double, pf: Double, pfd: Double, blka: Double, min: Double, plusMinus: Double, wRank: Int, lRank: Int, gpRank: Int, wPctRank: Int, ptsRank: Int, fgmRank: Int, fgaRank: Int, fgPctRank: Int, fg3mRank: Int, fg3aRank: Int, fg3PctRank: Int, ftmRank: Int, ftaRank: Int, ftPctRank: Int, rebRank: Int, orebRank: Int, drebRank: Int, astRank: Int, stlRank: Int, blkRank: Int, tovRank: Int, pfRank: Int, pfdRank: Int, blkaRank: Int, minRank: Int, plusMinusRank: Int) {
        self.w = w
        self.l = l
        self.gp = gp
        self.wPct = wPct
        self.pts = pts
        self.fgm = fgm
        self.fga = fga
        self.fgPct = fgPct
        self.fg3m = fg3m
        self.fg3a = fg3a
        self.fg3Pct = fg3Pct
        self.ftm = ftm
        self.fta = fta
        self.ftPct = ftPct
        self.reb = reb
        self.oreb = oreb
        self.dreb = dreb
        self.ast = ast
        self.stl = stl
        self.blk = blk
        self.tov = tov
        self.pf = pf
        self.pfd = pfd
        self.blka = blka
        self.min = min
        self.plusMinus = plusMinus
        self.wRank = wRank
        self.lRank = lRank
        self.gpRank = gpRank
        self.wPctRank = wPctRank
        self.ptsRank = ptsRank
        self.fgmRank = fgmRank
        self.fgaRank = fgaRank
        self.fgPctRank = fgPctRank
        self.fg3mRank = fg3mRank
        self.fg3aRank = fg3aRank
        self.fg3PctRank = fg3PctRank
        self.ftmRank = ftmRank
        self.ftaRank = ftaRank
        self.ftPctRank = ftPctRank
        self.rebRank = rebRank
        self.orebRank = orebRank
        self.drebRank = drebRank
        self.astRank = astRank
        self.stlRank = stlRank
        self.blkRank = blkRank
        self.tovRank = tovRank
        self.pfRank = pfRank
        self.pfdRank = pfdRank
        self.blkaRank = blkaRank
        self.minRank = minRank
        self.plusMinusRank = plusMinusRank
    }
    
    public var ppg: String { String(format: "%.1f", pts) }
    public var rpg: String { String(format: "%.1f", reb) }
    public var apg: String { String(format: "%.1f", ast) }
    public var fgPercentage: String { String(format: "%.1f%%", fgPct * 100) }
    public var fg3Percentage: String { String(format: "%.1f%%", fg3Pct * 100) }
    public var ftPercentage: String { String(format: "%.1f%%", ftPct * 100) }
    public var winPercentage: String { String(format: "%.1f%%", wPct * 100) }
}

