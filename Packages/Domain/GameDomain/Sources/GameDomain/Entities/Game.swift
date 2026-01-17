//
//  Game.swift
//  GameDomain
//
//  Created by Bacho on 17.01.26.
//

import Foundation

public struct Game: Identifiable, Hashable {
    public let id: Int
    public let date: String
    public let season: Int
    public let status: String
    public let homeTeam: Team
    public let visitorTeam: Team
    public let homeTeamScore: Int
    public let visitorTeamScore: Int
    
    // Quarter scores
    public let homeQ1: Int?
    public let homeQ2: Int?
    public let homeQ3: Int?
    public let homeQ4: Int?
    
    public let visitorQ1: Int?
    public let visitorQ2: Int?
    public let visitorQ3: Int?
    public let visitorQ4: Int?
    
    public init(
        id: Int,
        date: String,
        season: Int,
        status: String,
        homeTeam: Team,
        visitorTeam: Team,
        homeTeamScore: Int,
        visitorTeamScore: Int,
        homeQ1: Int? = nil,
        homeQ2: Int? = nil,
        homeQ3: Int? = nil,
        homeQ4: Int? = nil,
        visitorQ1: Int? = nil,
        visitorQ2: Int? = nil,
        visitorQ3: Int? = nil,
        visitorQ4: Int? = nil
    ) {
        self.id = id
        self.date = date
        self.season = season
        self.status = status
        self.homeTeam = homeTeam
        self.visitorTeam = visitorTeam
        self.homeTeamScore = homeTeamScore
        self.visitorTeamScore = visitorTeamScore
        self.homeQ1 = homeQ1
        self.homeQ2 = homeQ2
        self.homeQ3 = homeQ3
        self.homeQ4 = homeQ4
        self.visitorQ1 = visitorQ1
        self.visitorQ2 = visitorQ2
        self.visitorQ3 = visitorQ3
        self.visitorQ4 = visitorQ4
    }
}

// MARK: - Computed Properties
public extension Game {
    /// Formatted date (e.g., "Fri, 17 January")
    var formattedDate: String {
        let isoFormatter = ISO8601DateFormatter()
        guard let parsedDate = isoFormatter.date(from: date) else {
            return date
        }
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "EEE, d MMMM"
        return displayFormatter.string(from: parsedDate)
    }
    
    /// Formatted time (e.g., "5:00 PM")
    var formattedTime: String {
        let isoFormatter = ISO8601DateFormatter()
        guard let parsedDate = isoFormatter.date(from: status) else {
            return ""
        }
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "h:mm a"
        displayFormatter.timeZone = .current
        return displayFormatter.string(from: parsedDate)
    }
    
    /// Check if game is upcoming
    var isUpcoming: Bool {
        return status.contains("T") && status.contains("Z")
    }
    
    /// Check if game is finished
    var isFinished: Bool {
        return status == "Final"
    }
    
    /// Get home team quarter scores as array
    var homeQuarterScores: [Int] {
        return [
            homeQ1 ?? 0,
            homeQ2 ?? 0,
            homeQ3 ?? 0,
            homeQ4 ?? 0
        ]
    }
    
    /// Get visitor team quarter scores as array
    var visitorQuarterScores: [Int] {
        return [
            visitorQ1 ?? 0,
            visitorQ2 ?? 0,
            visitorQ3 ?? 0,
            visitorQ4 ?? 0
        ]
    }
}
