//  MockGameData.swift
//  Auth
//
//  Created by Bacho on 08.01.26.
//

import Foundation

struct MockGameData {
    static let upcomingGames: [Game] = [
        // ... your existing upcoming games stay the same
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
    
    // Finished games with quarter scores
    static let finishedGames: [Game] = [
        // Celtics vs Lakers - Finished
        Game(
            id: 2001,
            date: "2026-01-05T00:00:00.000Z",
            season: 2025,
            status: "Final",
            period: 4,
            time: "Final",
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
            homeTeamScore: 125,
            visitorTeam: Team(
                id: 13,
                conference: "West",
                division: "Pacific",
                city: "Los Angeles",
                name: "Lakers",
                fullName: "Los Angeles Lakers",
                abbreviation: "LAL"
            ),
            visitorTeamScore: 117,
            homeTeamQ1Score: 37,
            homeTeamQ2Score: 31,
            homeTeamQ3Score: 29,
            homeTeamQ4Score: 28,
            visitorTeamQ1Score: 30,
            visitorTeamQ2Score: 30,
            visitorTeamQ3Score: 26,
            visitorTeamQ4Score: 31
        ),
        // Warriors vs Knicks - Finished
        Game(
            id: 2002,
            date: "2026-01-04T23:30:00.000Z",
            season: 2025,
            status: "Final",
            period: 4,
            time: "Final",
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
            homeTeamScore: 118,
            visitorTeam: Team(
                id: 20,
                conference: "East",
                division: "Atlantic",
                city: "New York",
                name: "Knicks",
                fullName: "New York Knicks",
                abbreviation: "NYK"
            ),
            visitorTeamScore: 112,
            homeTeamQ1Score: 32,
            homeTeamQ2Score: 28,
            homeTeamQ3Score: 30,
            homeTeamQ4Score: 28,
            visitorTeamQ1Score: 27,
            visitorTeamQ2Score: 29,
            visitorTeamQ3Score: 28,
            visitorTeamQ4Score: 28
        ),
        // Heat vs Mavericks - Finished
        Game(
            id: 2003,
            date: "2026-01-04T00:00:00.000Z",
            season: 2025,
            status: "Final",
            period: 4,
            time: "Final",
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
            homeTeamScore: 108,
            visitorTeam: Team(
                id: 6,
                conference: "West",
                division: "Southwest",
                city: "Dallas",
                name: "Mavericks",
                fullName: "Dallas Mavericks",
                abbreviation: "DAL"
            ),
            visitorTeamScore: 115,
            homeTeamQ1Score: 25,
            homeTeamQ2Score: 27,
            homeTeamQ3Score: 30,
            homeTeamQ4Score: 26,
            visitorTeamQ1Score: 29,
            visitorTeamQ2Score: 31,
            visitorTeamQ3Score: 28,
            visitorTeamQ4Score: 27
        ),
        // 76ers vs Bulls - Finished
        Game(
            id: 2004,
            date: "2026-01-03T23:00:00.000Z",
            season: 2025,
            status: "Final",
            period: 4,
            time: "Final",
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
            homeTeamScore: 121,
            visitorTeam: Team(
                id: 4,
                conference: "East",
                division: "Central",
                city: "Chicago",
                name: "Bulls",
                fullName: "Chicago Bulls",
                abbreviation: "CHI"
            ),
            visitorTeamScore: 103,
            homeTeamQ1Score: 33,
            homeTeamQ2Score: 30,
            homeTeamQ3Score: 31,
            homeTeamQ4Score: 27,
            visitorTeamQ1Score: 24,
            visitorTeamQ2Score: 26,
            visitorTeamQ3Score: 27,
            visitorTeamQ4Score: 26
        ),
        // Clippers vs Nets - Finished
        Game(
            id: 2005,
            date: "2026-01-03T01:30:00.000Z",
            season: 2025,
            status: "Final",
            period: 4,
            time: "Final",
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
            homeTeamScore: 110,
            visitorTeam: Team(
                id: 2,
                conference: "East",
                division: "Atlantic",
                city: "Brooklyn",
                name: "Nets",
                fullName: "Brooklyn Nets",
                abbreviation: "BKN"
            ),
            visitorTeamScore: 105,
            homeTeamQ1Score: 28,
            homeTeamQ2Score: 27,
            homeTeamQ3Score: 26,
            homeTeamQ4Score: 29,
            visitorTeamQ1Score: 26,
            visitorTeamQ2Score: 28,
            visitorTeamQ3Score: 24,
            visitorTeamQ4Score: 27
        )
    ]
    
    // MARK: - Top Performers Data
    static func getTopPerformers(for game: Game) -> [PlayerGameStats] {
        switch game.id {
        case 2001: // Celtics vs Lakers
            return [
                PlayerGameStats(
                    id: 1,
                    player: PlayerInfo(
                        id: 145,
                        firstName: "Jayson",
                        lastName: "Tatum",
                        position: "SF",
                        jerseyNumber: "0"
                    ),
                    team: game.homeTeam,
                    game: GameInfo(
                        id: game.id,
                        date: game.date,
                        homeTeamId: game.homeTeam.id,
                        visitorTeamId: game.visitorTeam.id,
                        season: game.season
                    ),
                    min: "38:24",
                    pts: 32,
                    reb: 8,
                    ast: 6,
                    stl: 2,
                    blk: 1,
                    turnover: 3,
                    fgm: 11,
                    fga: 22,
                    fg3m: 4,
                    fg3a: 9,
                    ftm: 6,
                    fta: 7
                ),
                PlayerGameStats(
                    id: 2,
                    player: PlayerInfo(
                        id: 237,
                        firstName: "LeBron",
                        lastName: "James",
                        position: "PF",
                        jerseyNumber: "23"
                    ),
                    team: game.visitorTeam,
                    game: GameInfo(
                        id: game.id,
                        date: game.date,
                        homeTeamId: game.homeTeam.id,
                        visitorTeamId: game.visitorTeam.id,
                        season: game.season
                    ),
                    min: "36:12",
                    pts: 28,
                    reb: 9,
                    ast: 11,
                    stl: 1,
                    blk: 2,
                    turnover: 4,
                    fgm: 10,
                    fga: 19,
                    fg3m: 2,
                    fg3a: 6,
                    ftm: 6,
                    fta: 8
                )
            ]
            
        case 2002: // Warriors vs Knicks
            return [
                PlayerGameStats(
                    id: 3,
                    player: PlayerInfo(
                        id: 115,
                        firstName: "Stephen",
                        lastName: "Curry",
                        position: "PG",
                        jerseyNumber: "30"
                    ),
                    team: game.homeTeam,
                    game: GameInfo(
                        id: game.id,
                        date: game.date,
                        homeTeamId: game.homeTeam.id,
                        visitorTeamId: game.visitorTeam.id,
                        season: game.season
                    ),
                    min: "35:18",
                    pts: 34,
                    reb: 4,
                    ast: 8,
                    stl: 3,
                    blk: 0,
                    turnover: 2,
                    fgm: 12,
                    fga: 23,
                    fg3m: 7,
                    fg3a: 14,
                    ftm: 3,
                    fta: 3
                ),
                PlayerGameStats(
                    id: 4,
                    player: PlayerInfo(
                        id: 456,
                        firstName: "Jalen",
                        lastName: "Brunson",
                        position: "PG",
                        jerseyNumber: "11"
                    ),
                    team: game.visitorTeam,
                    game: GameInfo(
                        id: game.id,
                        date: game.date,
                        homeTeamId: game.homeTeam.id,
                        visitorTeamId: game.visitorTeam.id,
                        season: game.season
                    ),
                    min: "37:42",
                    pts: 29,
                    reb: 3,
                    ast: 9,
                    stl: 1,
                    blk: 0,
                    turnover: 3,
                    fgm: 11,
                    fga: 20,
                    fg3m: 3,
                    fg3a: 7,
                    ftm: 4,
                    fta: 5
                )
            ]
            
        case 2003: // Heat vs Mavericks
            return [
                PlayerGameStats(
                    id: 5,
                    player: PlayerInfo(
                        id: 13,
                        firstName: "Bam",
                        lastName: "Adebayo",
                        position: "C",
                        jerseyNumber: "13"
                    ),
                    team: game.homeTeam,
                    game: GameInfo(
                        id: game.id,
                        date: game.date,
                        homeTeamId: game.homeTeam.id,
                        visitorTeamId: game.visitorTeam.id,
                        season: game.season
                    ),
                    min: "34:26",
                    pts: 22,
                    reb: 12,
                    ast: 5,
                    stl: 2,
                    blk: 3,
                    turnover: 2,
                    fgm: 9,
                    fga: 15,
                    fg3m: 0,
                    fg3a: 1,
                    ftm: 4,
                    fta: 6
                ),
                PlayerGameStats(
                    id: 6,
                    player: PlayerInfo(
                        id: 132,
                        firstName: "Luka",
                        lastName: "Doncic",
                        position: "PG",
                        jerseyNumber: "77"
                    ),
                    team: game.visitorTeam,
                    game: GameInfo(
                        id: game.id,
                        date: game.date,
                        homeTeamId: game.homeTeam.id,
                        visitorTeamId: game.visitorTeam.id,
                        season: game.season
                    ),
                    min: "39:15",
                    pts: 35,
                    reb: 10,
                    ast: 12,
                    stl: 2,
                    blk: 0,
                    turnover: 5,
                    fgm: 13,
                    fga: 26,
                    fg3m: 4,
                    fg3a: 11,
                    ftm: 5,
                    fta: 7
                )
            ]
            
        case 2004: // 76ers vs Bulls
            return [
                PlayerGameStats(
                    id: 7,
                    player: PlayerInfo(
                        id: 203,
                        firstName: "Joel",
                        lastName: "Embiid",
                        position: "C",
                        jerseyNumber: "21"
                    ),
                    team: game.homeTeam,
                    game: GameInfo(
                        id: game.id,
                        date: game.date,
                        homeTeamId: game.homeTeam.id,
                        visitorTeamId: game.visitorTeam.id,
                        season: game.season
                    ),
                    min: "33:48",
                    pts: 38,
                    reb: 11,
                    ast: 4,
                    stl: 1,
                    blk: 3,
                    turnover: 2,
                    fgm: 14,
                    fga: 24,
                    fg3m: 2,
                    fg3a: 5,
                    ftm: 8,
                    fta: 10
                ),
                PlayerGameStats(
                    id: 8,
                    player: PlayerInfo(
                        id: 201,
                        firstName: "DeMar",
                        lastName: "DeRozan",
                        position: "SF",
                        jerseyNumber: "11"
                    ),
                    team: game.visitorTeam,
                    game: GameInfo(
                        id: game.id,
                        date: game.date,
                        homeTeamId: game.homeTeam.id,
                        visitorTeamId: game.visitorTeam.id,
                        season: game.season
                    ),
                    min: "36:22",
                    pts: 24,
                    reb: 5,
                    ast: 6,
                    stl: 2,
                    blk: 0,
                    turnover: 3,
                    fgm: 9,
                    fga: 19,
                    fg3m: 1,
                    fg3a: 3,
                    ftm: 5,
                    fta: 6
                )
            ]
            
        case 2005: // Clippers vs Nets
            return [
                PlayerGameStats(
                    id: 9,
                    player: PlayerInfo(
                        id: 202,
                        firstName: "Kawhi",
                        lastName: "Leonard",
                        position: "SF",
                        jerseyNumber: "2"
                    ),
                    team: game.homeTeam,
                    game: GameInfo(
                        id: game.id,
                        date: game.date,
                        homeTeamId: game.homeTeam.id,
                        visitorTeamId: game.visitorTeam.id,
                        season: game.season
                    ),
                    min: "35:12",
                    pts: 27,
                    reb: 7,
                    ast: 5,
                    stl: 3,
                    blk: 1,
                    turnover: 2,
                    fgm: 10,
                    fga: 18,
                    fg3m: 3,
                    fg3a: 6,
                    ftm: 4,
                    fta: 4
                ),
                PlayerGameStats(
                    id: 10,
                    player: PlayerInfo(
                        id: 1627759,
                        firstName: "Mikal",
                        lastName: "Bridges",
                        position: "SF",
                        jerseyNumber: "1"
                    ),
                    team: game.visitorTeam,
                    game: GameInfo(
                        id: game.id,
                        date: game.date,
                        homeTeamId: game.homeTeam.id,
                        visitorTeamId: game.visitorTeam.id,
                        season: game.season
                    ),
                    min: "37:54",
                    pts: 25,
                    reb: 6,
                    ast: 4,
                    stl: 2,
                    blk: 2,
                    turnover: 1,
                    fgm: 9,
                    fga: 16,
                    fg3m: 4,
                    fg3a: 8,
                    ftm: 3,
                    fta: 3
                )
            ]
            
        default:
            // Return empty array for games without top performers data
            return []
        }
    }
}
