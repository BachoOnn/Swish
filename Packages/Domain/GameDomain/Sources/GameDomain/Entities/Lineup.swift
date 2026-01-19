//
//  Lineup.swift
//  GameDomain
//
//  Created by Bacho on 18.01.26.
//

import Foundation

public struct Lineup: Identifiable, Hashable {
    public let id: Int
    public let game: GameReference? 
    public let team: Team
    public let starters: [Player]
    
    public init(
        id: Int,
        game: GameReference?,
        team: Team,
        starters: [Player]
    ) {
        self.id = id
        self.game = game
        self.team = team
        self.starters = starters
    }
}

public extension Lineup {
    /// Get starters by position
    var startersByPosition: [String: Player] {
        var positions: [String: Player] = [:]
        for player in starters {
            positions[player.position] = player
        }
        return positions
    }
    
    /// Get guards
    var guards: [Player] {
        starters.filter { $0.position.contains("G") }
    }
    
    /// Get forwards
    var forwards: [Player] {
        starters.filter { $0.position.contains("F") }
    }
    
    /// Get centers
    var centers: [Player] {
        starters.filter { $0.position == "C" }
    }
}
