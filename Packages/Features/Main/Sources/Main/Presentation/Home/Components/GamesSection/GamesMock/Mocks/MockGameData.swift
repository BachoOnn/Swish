//
//  MockGameData.swift
//  Swish
//
//  Created by Bacho on 09.01.26.
//

import Foundation

struct MockGameData {
    
    // MARK: - Upcoming Games
    static let upcomingGames: [Game] = [
        // Sunday, 12 January 2026
        Game(
            id: 1001,
            date: "2026-01-12T19:30:00.000Z",
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
            visitorTeamScore: 0,
            homeTeamQ1Score: nil,
            homeTeamQ2Score: nil,
            homeTeamQ3Score: nil,
            homeTeamQ4Score: nil,
            visitorTeamQ1Score: nil,
            visitorTeamQ2Score: nil,
            visitorTeamQ3Score: nil,
            visitorTeamQ4Score: nil
        ),
        
        // Monday, 13 January 2026
        Game(
            id: 1002,
            date: "2026-01-13T20:00:00.000Z",
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
            visitorTeamScore: 0,
            homeTeamQ1Score: nil,
            homeTeamQ2Score: nil,
            homeTeamQ3Score: nil,
            homeTeamQ4Score: nil,
            visitorTeamQ1Score: nil,
            visitorTeamQ2Score: nil,
            visitorTeamQ3Score: nil,
            visitorTeamQ4Score: nil
        ),
        
        // Tuesday, 14 January 2026
        Game(
            id: 1003,
            date: "2026-01-14T18:30:00.000Z",
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
            visitorTeamScore: 0,
            homeTeamQ1Score: nil,
            homeTeamQ2Score: nil,
            homeTeamQ3Score: nil,
            homeTeamQ4Score: nil,
            visitorTeamQ1Score: nil,
            visitorTeamQ2Score: nil,
            visitorTeamQ3Score: nil,
            visitorTeamQ4Score: nil
        ),
        
        // Wednesday, 15 January 2026
        Game(
            id: 1004,
            date: "2026-01-15T19:00:00.000Z",
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
            visitorTeamScore: 0,
            homeTeamQ1Score: nil,
            homeTeamQ2Score: nil,
            homeTeamQ3Score: nil,
            homeTeamQ4Score: nil,
            visitorTeamQ1Score: nil,
            visitorTeamQ2Score: nil,
            visitorTeamQ3Score: nil,
            visitorTeamQ4Score: nil
        ),
        
        // Thursday, 16 January 2026
        Game(
            id: 1005,
            date: "2026-01-16T21:00:00.000Z",
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
            visitorTeamScore: 0,
            homeTeamQ1Score: nil,
            homeTeamQ2Score: nil,
            homeTeamQ3Score: nil,
            homeTeamQ4Score: nil,
            visitorTeamQ1Score: nil,
            visitorTeamQ2Score: nil,
            visitorTeamQ3Score: nil,
            visitorTeamQ4Score: nil
        )
    ]
    
    // MARK: - Recent/Finished Games
    static let recentGames: [Game] = [
        // Saturday, 11 January 2026
        Game(
            id: 2001,
            date: "2026-01-11T19:30:00.000Z",
            season: 2025,
            status: "Final",
            period: 4,
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
            homeTeamScore: 118,
            visitorTeam: Team(
                id: 9,
                conference: "West",
                division: "Pacific",
                city: "Golden State",
                name: "Warriors",
                fullName: "Golden State Warriors",
                abbreviation: "GSW"
            ),
            visitorTeamScore: 112,
            homeTeamQ1Score: 28,
            homeTeamQ2Score: 31,
            homeTeamQ3Score: 30,
            homeTeamQ4Score: 29,
            visitorTeamQ1Score: 26,
            visitorTeamQ2Score: 28,
            visitorTeamQ3Score: 32,
            visitorTeamQ4Score: 26
        ),
        
        // Friday, 10 January 2026
        Game(
            id: 2002,
            date: "2026-01-10T22:00:00.000Z",
            season: 2025,
            status: "Final",
            period: 4,
            time: "",
            postseason: false,
            homeTeam: Team(
                id: 13,
                conference: "West",
                division: "Pacific",
                city: "Los Angeles",
                name: "Lakers",
                fullName: "Los Angeles Lakers",
                abbreviation: "LAL"
            ),
            homeTeamScore: 105,
            visitorTeam: Team(
                id: 16,
                conference: "East",
                division: "Southeast",
                city: "Miami",
                name: "Heat",
                fullName: "Miami Heat",
                abbreviation: "MIA"
            ),
            visitorTeamScore: 108,
            homeTeamQ1Score: 25,
            homeTeamQ2Score: 27,
            homeTeamQ3Score: 28,
            homeTeamQ4Score: 25,
            visitorTeamQ1Score: 30,
            visitorTeamQ2Score: 25,
            visitorTeamQ3Score: 26,
            visitorTeamQ4Score: 27
        ),
        
        // Thursday, 9 January 2026
        Game(
            id: 2003,
            date: "2026-01-09T20:00:00.000Z",
            season: 2025,
            status: "Final",
            period: 4,
            time: "",
            postseason: false,
            homeTeam: Team(
                id: 6,
                conference: "West",
                division: "Southwest",
                city: "Dallas",
                name: "Mavericks",
                fullName: "Dallas Mavericks",
                abbreviation: "DAL"
            ),
            homeTeamScore: 122,
            visitorTeam: Team(
                id: 21,
                conference: "East",
                division: "Atlantic",
                city: "Philadelphia",
                name: "76ers",
                fullName: "Philadelphia 76ers",
                abbreviation: "PHI"
            ),
            visitorTeamScore: 115,
            homeTeamQ1Score: 32,
            homeTeamQ2Score: 29,
            homeTeamQ3Score: 31,
            homeTeamQ4Score: 30,
            visitorTeamQ1Score: 28,
            visitorTeamQ2Score: 30,
            visitorTeamQ3Score: 29,
            visitorTeamQ4Score: 28
        )
    ]
    
    // MARK: - All Games Combined
    static var allGames: [Game] {
        return recentGames + upcomingGames
    }
    
    // MARK: - Mock Player Stats
    // MARK: - Mock Player Stats
    static let mockPlayerStats: [PlayerGameStats] = [
        // ========================================
        // GAME 2001: Boston Celtics vs Golden State Warriors
        // ========================================
        
        // Boston Celtics players (Game 2001)
        PlayerGameStats(
            id: 1,
            player: PlayerInfo(
                id: 101,
                firstName: "Jayson",
                lastName: "Tatum",
                position: "F",
                jerseyNumber: "0"
            ),
            team: Team(
                id: 1,
                conference: "East",
                division: "Atlantic",
                city: "Boston",
                name: "Celtics",
                fullName: "Boston Celtics",
                abbreviation: "BOS"
            ),
            game: GameInfo(
                id: 2001,
                date: "2026-01-11T19:30:00.000Z",
                homeTeamId: 1,
                visitorTeamId: 9,
                season: 2025
            ),
            min: "36:24",
            pts: 32,
            reb: 8,
            ast: 6,
            stl: 2,
            blk: 1,
            turnover: 3,
            fgm: 12,
            fga: 22,
            fg3m: 4,
            fg3a: 9,
            ftm: 4,
            fta: 5
        ),
        
        PlayerGameStats(
            id: 2,
            player: PlayerInfo(
                id: 102,
                firstName: "Jaylen",
                lastName: "Brown",
                position: "G-F",
                jerseyNumber: "7"
            ),
            team: Team(
                id: 1,
                conference: "East",
                division: "Atlantic",
                city: "Boston",
                name: "Celtics",
                fullName: "Boston Celtics",
                abbreviation: "BOS"
            ),
            game: GameInfo(
                id: 2001,
                date: "2026-01-11T19:30:00.000Z",
                homeTeamId: 1,
                visitorTeamId: 9,
                season: 2025
            ),
            min: "34:12",
            pts: 28,
            reb: 5,
            ast: 4,
            stl: 1,
            blk: 0,
            turnover: 2,
            fgm: 10,
            fga: 18,
            fg3m: 3,
            fg3a: 7,
            ftm: 5,
            fta: 6
        ),
        
        PlayerGameStats(
            id: 3,
            player: PlayerInfo(
                id: 103,
                firstName: "Derrick",
                lastName: "White",
                position: "G",
                jerseyNumber: "9"
            ),
            team: Team(
                id: 1,
                conference: "East",
                division: "Atlantic",
                city: "Boston",
                name: "Celtics",
                fullName: "Boston Celtics",
                abbreviation: "BOS"
            ),
            game: GameInfo(
                id: 2001,
                date: "2026-01-11T19:30:00.000Z",
                homeTeamId: 1,
                visitorTeamId: 9,
                season: 2025
            ),
            min: "32:18",
            pts: 18,
            reb: 3,
            ast: 5,
            stl: 2,
            blk: 1,
            turnover: 1,
            fgm: 7,
            fga: 14,
            fg3m: 4,
            fg3a: 8,
            ftm: 0,
            fta: 0
        ),
        
        // Golden State Warriors players (Game 2001)
        PlayerGameStats(
            id: 4,
            player: PlayerInfo(
                id: 201,
                firstName: "Stephen",
                lastName: "Curry",
                position: "G",
                jerseyNumber: "30"
            ),
            team: Team(
                id: 9,
                conference: "West",
                division: "Pacific",
                city: "Golden State",
                name: "Warriors",
                fullName: "Golden State Warriors",
                abbreviation: "GSW"
            ),
            game: GameInfo(
                id: 2001,
                date: "2026-01-11T19:30:00.000Z",
                homeTeamId: 1,
                visitorTeamId: 9,
                season: 2025
            ),
            min: "38:45",
            pts: 35,
            reb: 4,
            ast: 7,
            stl: 2,
            blk: 0,
            turnover: 4,
            fgm: 13,
            fga: 25,
            fg3m: 7,
            fg3a: 15,
            ftm: 2,
            fta: 2
        ),
        
        PlayerGameStats(
            id: 5,
            player: PlayerInfo(
                id: 202,
                firstName: "Andrew",
                lastName: "Wiggins",
                position: "F",
                jerseyNumber: "22"
            ),
            team: Team(
                id: 9,
                conference: "West",
                division: "Pacific",
                city: "Golden State",
                name: "Warriors",
                fullName: "Golden State Warriors",
                abbreviation: "GSW"
            ),
            game: GameInfo(
                id: 2001,
                date: "2026-01-11T19:30:00.000Z",
                homeTeamId: 1,
                visitorTeamId: 9,
                season: 2025
            ),
            min: "33:20",
            pts: 24,
            reb: 6,
            ast: 3,
            stl: 1,
            blk: 1,
            turnover: 2,
            fgm: 9,
            fga: 16,
            fg3m: 3,
            fg3a: 6,
            ftm: 3,
            fta: 4
        ),
        
        PlayerGameStats(
            id: 6,
            player: PlayerInfo(
                id: 203,
                firstName: "Draymond",
                lastName: "Green",
                position: "F",
                jerseyNumber: "23"
            ),
            team: Team(
                id: 9,
                conference: "West",
                division: "Pacific",
                city: "Golden State",
                name: "Warriors",
                fullName: "Golden State Warriors",
                abbreviation: "GSW"
            ),
            game: GameInfo(
                id: 2001,
                date: "2026-01-11T19:30:00.000Z",
                homeTeamId: 1,
                visitorTeamId: 9,
                season: 2025
            ),
            min: "31:45",
            pts: 12,
            reb: 9,
            ast: 8,
            stl: 2,
            blk: 2,
            turnover: 3,
            fgm: 5,
            fga: 9,
            fg3m: 1,
            fg3a: 3,
            ftm: 1,
            fta: 2
        ),
        
        // ========================================
        // GAME 2002: Los Angeles Lakers vs Miami Heat
        // ========================================
        
        // Los Angeles Lakers players (Game 2002)
        PlayerGameStats(
            id: 7,
            player: PlayerInfo(
                id: 301,
                firstName: "Lebron",
                lastName: "James",
                position: "F",
                jerseyNumber: "23"
            ),
            team: Team(
                id: 13,
                conference: "West",
                division: "Pacific",
                city: "Los Angeles",
                name: "Lakers",
                fullName: "Los Angeles Lakers",
                abbreviation: "LAL"
            ),
            game: GameInfo(
                id: 2002,
                date: "2026-01-10T22:00:00.000Z",
                homeTeamId: 13,
                visitorTeamId: 16,
                season: 2025
            ),
            min: "37:12",
            pts: 29,
            reb: 12,
            ast: 4,
            stl: 1,
            blk: 3,
            turnover: 2,
            fgm: 11,
            fga: 20,
            fg3m: 2,
            fg3a: 5,
            ftm: 5,
            fta: 7
        ),
        
        PlayerGameStats(
            id: 8,
            player: PlayerInfo(
                id: 302,
                firstName: "LeBron",
                lastName: "James",
                position: "F",
                jerseyNumber: "23"
            ),
            team: Team(
                id: 13,
                conference: "West",
                division: "Pacific",
                city: "Los Angeles",
                name: "Lakers",
                fullName: "Los Angeles Lakers",
                abbreviation: "LAL"
            ),
            game: GameInfo(
                id: 2002,
                date: "2026-01-10T22:00:00.000Z",
                homeTeamId: 13,
                visitorTeamId: 16,
                season: 2025
            ),
            min: "35:45",
            pts: 26,
            reb: 7,
            ast: 9,
            stl: 2,
            blk: 1,
            turnover: 3,
            fgm: 10,
            fga: 19,
            fg3m: 2,
            fg3a: 6,
            ftm: 4,
            fta: 5
        ),
        
        PlayerGameStats(
            id: 9,
            player: PlayerInfo(
                id: 303,
                firstName: "Austin",
                lastName: "Reaves",
                position: "G",
                jerseyNumber: "15"
            ),
            team: Team(
                id: 13,
                conference: "West",
                division: "Pacific",
                city: "Los Angeles",
                name: "Lakers",
                fullName: "Los Angeles Lakers",
                abbreviation: "LAL"
            ),
            game: GameInfo(
                id: 2002,
                date: "2026-01-10T22:00:00.000Z",
                homeTeamId: 13,
                visitorTeamId: 16,
                season: 2025
            ),
            min: "32:20",
            pts: 18,
            reb: 4,
            ast: 6,
            stl: 1,
            blk: 0,
            turnover: 2,
            fgm: 7,
            fga: 13,
            fg3m: 3,
            fg3a: 7,
            ftm: 1,
            fta: 2
        ),
        
        // Miami Heat players (Game 2002)
        PlayerGameStats(
            id: 10,
            player: PlayerInfo(
                id: 401,
                firstName: "Bam",
                lastName: "Adebayo",
                position: "F-C",
                jerseyNumber: "13"
            ),
            team: Team(
                id: 16,
                conference: "East",
                division: "Southeast",
                city: "Miami",
                name: "Heat",
                fullName: "Miami Heat",
                abbreviation: "MIA"
            ),
            game: GameInfo(
                id: 2002,
                date: "2026-01-10T22:00:00.000Z",
                homeTeamId: 13,
                visitorTeamId: 16,
                season: 2025
            ),
            min: "39:15",
            pts: 34,
            reb: 6,
            ast: 8,
            stl: 3,
            blk: 1,
            turnover: 2,
            fgm: 13,
            fga: 23,
            fg3m: 3,
            fg3a: 7,
            ftm: 5,
            fta: 6
        ),
        
        PlayerGameStats(
            id: 11,
            player: PlayerInfo(
                id: 402,
                firstName: "Bam",
                lastName: "Adebayo",
                position: "C",
                jerseyNumber: "13"
            ),
            team: Team(
                id: 16,
                conference: "East",
                division: "Southeast",
                city: "Miami",
                name: "Heat",
                fullName: "Miami Heat",
                abbreviation: "MIA"
            ),
            game: GameInfo(
                id: 2002,
                date: "2026-01-10T22:00:00.000Z",
                homeTeamId: 13,
                visitorTeamId: 16,
                season: 2025
            ),
            min: "36:30",
            pts: 22,
            reb: 11,
            ast: 5,
            stl: 1,
            blk: 2,
            turnover: 1,
            fgm: 9,
            fga: 15,
            fg3m: 0,
            fg3a: 1,
            ftm: 4,
            fta: 5
        ),
        
        PlayerGameStats(
            id: 12,
            player: PlayerInfo(
                id: 403,
                firstName: "Tyler",
                lastName: "Herro",
                position: "G",
                jerseyNumber: "14"
            ),
            team: Team(
                id: 16,
                conference: "East",
                division: "Southeast",
                city: "Miami",
                name: "Heat",
                fullName: "Miami Heat",
                abbreviation: "MIA"
            ),
            game: GameInfo(
                id: 2002,
                date: "2026-01-10T22:00:00.000Z",
                homeTeamId: 13,
                visitorTeamId: 16,
                season: 2025
            ),
            min: "33:45",
            pts: 20,
            reb: 3,
            ast: 4,
            stl: 1,
            blk: 0,
            turnover: 2,
            fgm: 8,
            fga: 16,
            fg3m: 4,
            fg3a: 9,
            ftm: 0,
            fta: 0
        ),
        
        // ========================================
        // GAME 2003: Dallas Mavericks vs Philadelphia 76ers
        // ========================================
        
        // Dallas Mavericks players (Game 2003)
        PlayerGameStats(
            id: 13,
            player: PlayerInfo(
                id: 501,
                firstName: "Kyrie",
                lastName: "Irving",
                position: "G",
                jerseyNumber: "11"
            ),
            team: Team(
                id: 6,
                conference: "West",
                division: "Southwest",
                city: "Dallas",
                name: "Mavericks",
                fullName: "Dallas Mavericks",
                abbreviation: "DAL"
            ),
            game: GameInfo(
                id: 2003,
                date: "2026-01-09T20:00:00.000Z",
                homeTeamId: 6,
                visitorTeamId: 21,
                season: 2025
            ),
            min: "38:50",
            pts: 42,
            reb: 9,
            ast: 12,
            stl: 2,
            blk: 0,
            turnover: 4,
            fgm: 15,
            fga: 28,
            fg3m: 6,
            fg3a: 13,
            ftm: 6,
            fta: 7
        ),
        
        PlayerGameStats(
            id: 14,
            player: PlayerInfo(
                id: 502,
                firstName: "Kyrie",
                lastName: "Irving",
                position: "G",
                jerseyNumber: "11"
            ),
            team: Team(
                id: 6,
                conference: "West",
                division: "Southwest",
                city: "Dallas",
                name: "Mavericks",
                fullName: "Dallas Mavericks",
                abbreviation: "DAL"
            ),
            game: GameInfo(
                id: 2003,
                date: "2026-01-09T20:00:00.000Z",
                homeTeamId: 6,
                visitorTeamId: 21,
                season: 2025
            ),
            min: "36:15",
            pts: 28,
            reb: 4,
            ast: 7,
            stl: 1,
            blk: 1,
            turnover: 2,
            fgm: 11,
            fga: 21,
            fg3m: 4,
            fg3a: 9,
            ftm: 2,
            fta: 3
        ),
        
        PlayerGameStats(
            id: 15,
            player: PlayerInfo(
                id: 503,
                firstName: "Daniel",
                lastName: "Gafford",
                position: "C",
                jerseyNumber: "21"
            ),
            team: Team(
                id: 6,
                conference: "West",
                division: "Southwest",
                city: "Dallas",
                name: "Mavericks",
                fullName: "Dallas Mavericks",
                abbreviation: "DAL"
            ),
            game: GameInfo(
                id: 2003,
                date: "2026-01-09T20:00:00.000Z",
                homeTeamId: 6,
                visitorTeamId: 21,
                season: 2025
            ),
            min: "28:30",
            pts: 16,
            reb: 10,
            ast: 2,
            stl: 0,
            blk: 3,
            turnover: 1,
            fgm: 7,
            fga: 10,
            fg3m: 0,
            fg3a: 0,
            ftm: 2,
            fta: 4
        ),
        
        // Philadelphia 76ers players (Game 2003)
        PlayerGameStats(
            id: 16,
            player: PlayerInfo(
                id: 601,
                firstName: "Joel",
                lastName: "Embiid",
                position: "C",
                jerseyNumber: "21"
            ),
            team: Team(
                id: 21,
                conference: "East",
                division: "Atlantic",
                city: "Philadelphia",
                name: "76ers",
                fullName: "Philadelphia 76ers",
                abbreviation: "PHI"
            ),
            game: GameInfo(
                id: 2003,
                date: "2026-01-09T20:00:00.000Z",
                homeTeamId: 6,
                visitorTeamId: 21,
                season: 2025
            ),
            min: "37:40",
            pts: 38,
            reb: 13,
            ast: 4,
            stl: 1,
            blk: 2,
            turnover: 3,
            fgm: 14,
            fga: 26,
            fg3m: 2,
            fg3a: 5,
            ftm: 8,
            fta: 10
        ),
        
        PlayerGameStats(
            id: 17,
            player: PlayerInfo(
                id: 602,
                firstName: "Tyrese",
                lastName: "Maxey",
                position: "G",
                jerseyNumber: "0"
            ),
            team: Team(
                id: 21,
                conference: "East",
                division: "Atlantic",
                city: "Philadelphia",
                name: "76ers",
                fullName: "Philadelphia 76ers",
                abbreviation: "PHI"
            ),
            game: GameInfo(
                id: 2003,
                date: "2026-01-09T20:00:00.000Z",
                homeTeamId: 6,
                visitorTeamId: 21,
                season: 2025
            ),
            min: "35:20",
            pts: 27,
            reb: 5,
            ast: 6,
            stl: 2,
            blk: 0,
            turnover: 2,
            fgm: 10,
            fga: 20,
            fg3m: 5,
            fg3a: 11,
            ftm: 2,
            fta: 2
        ),
        
        PlayerGameStats(
            id: 18,
            player: PlayerInfo(
                id: 603,
                firstName: "Tobias",
                lastName: "Harris",
                position: "F",
                jerseyNumber: "12"
            ),
            team: Team(
                id: 21,
                conference: "East",
                division: "Atlantic",
                city: "Philadelphia",
                name: "76ers",
                fullName: "Philadelphia 76ers",
                abbreviation: "PHI"
            ),
            game: GameInfo(
                id: 2003,
                date: "2026-01-09T20:00:00.000Z",
                homeTeamId: 6,
                visitorTeamId: 21,
                season: 2025
            ),
            min: "32:15",
            pts: 19,
            reb: 7,
            ast: 3,
            stl: 1,
            blk: 1,
            turnover: 1,
            fgm: 8,
            fga: 15,
            fg3m: 2,
            fg3a: 5,
            ftm: 1,
            fta: 2
        )
    ]
}
