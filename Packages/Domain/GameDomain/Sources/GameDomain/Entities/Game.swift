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
    
    public init(
        id: Int,
        date: String,
        season: Int,
        status: String,
        homeTeam: Team,
        visitorTeam: Team,
        homeTeamScore: Int,
        visitorTeamScore: Int
    ) {
        self.id = id
        self.date = date
        self.season = season
        self.status = status
        self.homeTeam = homeTeam
        self.visitorTeam = visitorTeam
        self.homeTeamScore = homeTeamScore
        self.visitorTeamScore = visitorTeamScore
    }
}

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
}
