//  Game.swift
//  Auth
//
//  Created by Bacho on 09.01.26.
//

import Foundation

// MARK: - Game Model
struct Game: Codable, Identifiable, Hashable {
    
    let id: Int
    let date: String
    let season: Int
    let status: String
    let period: Int
    let time: String
    let postseason: Bool
    let homeTeam: Team
    let homeTeamScore: Int
    let visitorTeam: Team
    let visitorTeamScore: Int
    
    let homeTeamQ1Score: Int?
    let homeTeamQ2Score: Int?
    let homeTeamQ3Score: Int?
    let homeTeamQ4Score: Int?
    
    let visitorTeamQ1Score: Int?
    let visitorTeamQ2Score: Int?
    let visitorTeamQ3Score: Int?
    let visitorTeamQ4Score: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, date, season, status, period, time, postseason
        case homeTeam = "home_team"
        case homeTeamScore = "home_team_score"
        case visitorTeam = "visitor_team"
        case visitorTeamScore = "visitor_team_score"
        
        case homeTeamQ1Score = "home_team_score_q1"
        case homeTeamQ2Score = "home_team_score_q2"
        case homeTeamQ3Score = "home_team_score_q3"
        case homeTeamQ4Score = "home_team_score_q4"
        
        case visitorTeamQ1Score = "visitor_team_score_q1"
        case visitorTeamQ2Score = "visitor_team_score_q2"
        case visitorTeamQ3Score = "visitor_team_score_q3"
        case visitorTeamQ4Score = "visitor_team_score_q4"
    }
}

// MARK: - Team Model
struct Team: Codable, Identifiable {
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

// MARK: - API Response Models
struct GamesResponse: Codable {
    let data: [Game]
    let meta: Meta
}

struct Meta: Codable {
    let totalPages: Int?
    let currentPage: Int?
    let nextPage: Int?
    let perPage: Int?
    let totalCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case nextPage = "next_page"
        case perPage = "per_page"
        case totalCount = "total_count"
    }
}

// MARK: - Game Extensions
extension Game {
    /// Formatted date string (e.g., "Sun, 12 January")
    var formattedDate: String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [
            .withInternetDateTime,
            .withFractionalSeconds
        ]
        guard let parsedDate = isoFormatter.date(from: date) else {
            return ""
        }
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "EEE, d MMMM"
        displayFormatter.locale = Locale(identifier: "en_US_POSIX")
        displayFormatter.timeZone = .current   // convert from UTC (Z)
        
        return displayFormatter.string(from: parsedDate)
    }

    
    /// Formatted time string (e.g., "7:30 PM")
    var formattedTime: String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [
            .withInternetDateTime,
            .withFractionalSeconds
        ]
        
        guard let parsedDate = isoFormatter.date(from: date) else {
            return ""
        }
        
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "h:mm a"
        displayFormatter.locale = Locale(identifier: "en_US_POSIX")
        displayFormatter.timeZone = .current   // convert from UTC (Z) to local time
        
        return displayFormatter.string(from: parsedDate)
    }
    /// Check if game is upcoming (not started)
    var isUpcoming: Bool {
        return status == "Not Started" || status == "Scheduled"
    }
    
    /// Check if game is live
    var isLive: Bool {
        return status == "In Progress" || status == "Live"
    }
    
    /// Check if game is finished
    var isFinished: Bool {
        return status == "Final" || status == "Finished"
    }
    
    /// Get home team quarter scores as array
    var homeTeamQuarterScores: [Int] {
        return [
            homeTeamQ1Score ?? 0,
            homeTeamQ2Score ?? 0,
            homeTeamQ3Score ?? 0,
            homeTeamQ4Score ?? 0
        ]
    }
    
    /// Get visitor team quarter scores as array
    var visitorTeamQuarterScores: [Int] {
        return [
            visitorTeamQ1Score ?? 0,
            visitorTeamQ2Score ?? 0,
            visitorTeamQ3Score ?? 0,
            visitorTeamQ4Score ?? 0
        ]
    }
    
    /// Get top 1 performer from player stats (highest points scorer)
    func getTopPerformers(from stats: [PlayerGameStats]) -> [PlayerGameStats] {
        let gameStats = stats.filter { $0.game.id == self.id }
        return gameStats.sorted { $0.pts > $1.pts }.prefix(1).map { $0 }
    }
    
    /// Get top 1 home team performer
    func getTopHomePerformers(from stats: [PlayerGameStats]) -> [PlayerGameStats] {
        let gameStats = stats.filter { $0.game.id == self.id && $0.team.id == self.homeTeam.id }
        return gameStats.sorted { $0.pts > $1.pts }.prefix(1).map { $0 }
    }
    
    /// Get top 1 visitor team performer
    func getTopVisitorPerformers(from stats: [PlayerGameStats]) -> [PlayerGameStats] {
        let gameStats = stats.filter { $0.game.id == self.id && $0.team.id == self.visitorTeam.id }
        return gameStats.sorted { $0.pts > $1.pts }.prefix(1).map { $0 }
    }
    
    static func == (lhs: Game, rhs: Game) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
