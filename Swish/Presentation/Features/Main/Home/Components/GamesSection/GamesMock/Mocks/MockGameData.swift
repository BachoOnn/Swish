//
//  MockGameData.swift
//  Auth
//
//  Created by Bacho on 08.01.26.
//


import Foundation

struct MockGameData {
    static let upcomingGames: [Game] = [
        Game(
            id: 1001,
            date: "2026-01-07T00:00:00.000Z",
            season: 2025,
            status: "Not Started",
            period: 0,
            time: "",
            postseason: false,
            homeTeam: Team(
                id: 1,
                conference: "East",
                division: "Atlantic",
                city: "Boston",
                name: "Celtics",
                fullName: "Boston Celtics",
                abbreviation: "BOS"
            ),
            homeTeamScore: 0,
            visitorTeam: Team(
                id: 13,
                conference: "West",
                division: "Pacific",
                city: "Los Angeles",
                name: "Lakers",
                fullName: "Los Angeles Lakers",
                abbreviation: "LAL"
            ),
            visitorTeamScore: 0
        ),
        Game(
            id: 1002,
            date: "2026-01-07T23:30:00.000Z",
            season: 2025,
            status: "Not Started",
            period: 0,
            time: "",
            postseason: false,
            homeTeam: Team(
                id: 9,
                conference: "West",
                division: "Pacific",
                city: "Golden State",
                name: "Warriors",
                fullName: "Golden State Warriors",
                abbreviation: "GSW"
            ),
            homeTeamScore: 0,
            visitorTeam: Team(
                id: 20,
                conference: "East",
                division: "Atlantic",
                city: "New York",
                name: "Knicks",
                fullName: "New York Knicks",
                abbreviation: "NYK"
            ),
            visitorTeamScore: 0
        ),
        Game(
            id: 1003,
            date: "2026-01-08T00:00:00.000Z",
            season: 2025,
            status: "Not Started",
            period: 0,
            time: "",
            postseason: false,
            homeTeam: Team(
                id: 16,
                conference: "East",
                division: "Southeast",
                city: "Miami",
                name: "Heat",
                fullName: "Miami Heat",
                abbreviation: "MIA"
            ),
            homeTeamScore: 0,
            visitorTeam: Team(
                id: 6,
                conference: "West",
                division: "Southwest",
                city: "Dallas",
                name: "Mavericks",
                fullName: "Dallas Mavericks",
                abbreviation: "DAL"
            ),
            visitorTeamScore: 0
        ),
        Game(
            id: 1004,
            date: "2026-01-08T23:00:00.000Z",
            season: 2025,
            status: "Not Started",
            period: 0,
            time: "",
            postseason: false,
            homeTeam: Team(
                id: 21,
                conference: "East",
                division: "Atlantic",
                city: "Philadelphia",
                name: "76ers",
                fullName: "Philadelphia 76ers",
                abbreviation: "PHI"
            ),
            homeTeamScore: 0,
            visitorTeam: Team(
                id: 4,
                conference: "East",
                division: "Central",
                city: "Chicago",
                name: "Bulls",
                fullName: "Chicago Bulls",
                abbreviation: "CHI"
            ),
            visitorTeamScore: 0
        ),
        Game(
            id: 1005,
            date: "2026-01-09T01:30:00.000Z",
            season: 2025,
            status: "Not Started",
            period: 0,
            time: "",
            postseason: false,
            homeTeam: Team(
                id: 14,
                conference: "West",
                division: "Pacific",
                city: "Los Angeles",
                name: "Clippers",
                fullName: "Los Angeles Clippers",
                abbreviation: "LAC"
            ),
            homeTeamScore: 0,
            visitorTeam: Team(
                id: 2,
                conference: "East",
                division: "Atlantic",
                city: "Brooklyn",
                name: "Nets",
                fullName: "Brooklyn Nets",
                abbreviation: "BKN"
            ),
            visitorTeamScore: 0
        )
    ]
}