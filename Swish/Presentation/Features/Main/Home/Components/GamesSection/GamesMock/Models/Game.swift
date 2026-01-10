//
//  Game.swift
//  Auth
//
//  Created by Bacho on 09.01.26.
//


import Foundation

// MARK: - Game Model
struct Game: Codable, Identifiable {
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
    
    enum CodingKeys: String, CodingKey {
        case id, date, season, status, period, time, postseason
        case homeTeam = "home_team"
        case homeTeamScore = "home_team_score"
        case visitorTeam = "visitor_team"
        case visitorTeamScore = "visitor_team_score"
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
    /// Formatted date string (e.g., "Jan 7, 2026")
    var formattedDate: String {
        let formatter = ISO8601DateFormatter()
        guard let date = formatter.date(from: date) else { return "" }
        
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "MMM d, yyyy"
        return displayFormatter.string(from: date)
    }
    
    /// Formatted time string (e.g., "7:30 PM")
    var formattedTime: String {
        let formatter = ISO8601DateFormatter()
        guard let date = formatter.date(from: date) else { return "" }
        
        let displayFormatter = DateFormatter()
        displayFormatter.dateFormat = "h:mm a"
        return displayFormatter.string(from: date)
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
}

// MARK: - Team Extensions
extension Team {
    /// Team logo URL (you'll need to implement or use a third-party source)
    var logoURL: String {
        return "https://cdn.nba.com/logos/nba/\(id)/global/L/logo.svg"
    }
}
