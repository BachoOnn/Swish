//
//  PlayerStats.swift
//  GameDomain
//
//  Created by Bacho on 18.01.26.
//

import Foundation

public struct PlayerStats: Identifiable, Hashable {
    public let id: Int
    public let player: Player
    public let team: Team
    public let game: GameReference
    public let min: String?
    public let pts: Int
    public let fgm: Int
    public let fga: Int
    public let fgPct: Double?
    public let fg3m: Int
    public let fg3a: Int
    public let fg3Pct: Double?
    public let ftm: Int
    public let fta: Int
    public let ftPct: Double?
    public let oreb: Int
    public let dreb: Int
    public let reb: Int
    public let ast: Int
    public let stl: Int
    public let blk: Int
    public let turnover: Int
    public let pf: Int
    
    public init(
        id: Int,
        player: Player,
        team: Team,
        game: GameReference,
        min: String?,
        pts: Int,
        fgm: Int,
        fga: Int,
        fgPct: Double?,
        fg3m: Int,
        fg3a: Int,
        fg3Pct: Double?,
        ftm: Int,
        fta: Int,
        ftPct: Double?,
        oreb: Int,
        dreb: Int,
        reb: Int,
        ast: Int,
        stl: Int,
        blk: Int,
        turnover: Int,
        pf: Int
    ) {
        self.id = id
        self.player = player
        self.team = team
        self.game = game
        self.min = min
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
        self.oreb = oreb
        self.dreb = dreb
        self.reb = reb
        self.ast = ast
        self.stl = stl
        self.blk = blk
        self.turnover = turnover
        self.pf = pf
    }
}

// MARK: - Nested Types

public struct Player: Identifiable, Hashable, Codable {
    public let id: Int
    public let firstName: String
    public let lastName: String
    public let position: String
    public let jerseyNumber: String?
    
    public init(
        id: Int,
        firstName: String,
        lastName: String,
        position: String,
        jerseyNumber: String?
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.position = position
        self.jerseyNumber = jerseyNumber
    }
    
    public var fullName: String {
        "\(firstName) \(lastName)"
    }
}

public struct GameReference: Hashable, Codable {
    public let id: Int
    public let date: String
    public let season: Int
    public let homeTeamId: Int
    public let visitorTeamId: Int
    
    public init(
        id: Int,
        date: String,
        season: Int,
        homeTeamId: Int,
        visitorTeamId: Int
    ) {
        self.id = id
        self.date = date
        self.season = season
        self.homeTeamId = homeTeamId
        self.visitorTeamId = visitorTeamId
    }
}

// MARK: - Computed Properties

public extension PlayerStats {
    /// Field Goal Percentage formatted as string
    var fgPctFormatted: String {
        guard let pct = fgPct else { return "-" }
        return String(format: "%.1f%%", pct * 100)
    }
    
    /// 3-Point Percentage formatted as string
    var fg3PctFormatted: String {
        guard let pct = fg3Pct else { return "-" }
        return String(format: "%.1f%%", pct * 100)
    }
    
    /// Free Throw Percentage formatted as string
    var ftPctFormatted: String {
        guard let pct = ftPct else { return "-" }
        return String(format: "%.1f%%", pct * 100)
    }
    
    /// Minutes played formatted
    var minFormatted: String {
        min ?? "0:00"
    }
    
    /// Check if player actually played
    var didPlay: Bool {
        return pts > 0 || reb > 0 || ast > 0 || (min != nil && min != "0" && min != "0:00")
    }
}
