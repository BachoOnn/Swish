//
//  MockTeamData.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import Foundation

struct MockTeamData {
    
    // MARK: - Team Season Averages Mock Data
    static let teamSeasonAveragesResponse = TeamSeasonAveragesResponse(
        data: [
            // Los Angeles Lakers (Real API data)
            TeamSeasonAverages(
                team: TeamInfo(
                    id: 14,
                    conference: "West",
                    division: "Pacific",
                    city: "Los Angeles",
                    name: "Lakers",
                    fullName: "Los Angeles Lakers",
                    abbreviation: "LAL"
                ),
                season: 2024,
                seasonType: "regular",
                stats: TeamSeasonStats(
                    w: 50,
                    l: 32,
                    gp: 82,
                    wPct: 0.61,
                    pts: 113.4,
                    fgm: 40.9,
                    fga: 85.5,
                    fgPct: 0.479,
                    fg3m: 13.3,
                    fg3a: 36.4,
                    fg3Pct: 0.366,
                    ftm: 18.2,
                    fta: 23.2,
                    ftPct: 0.785,
                    reb: 42.4,
                    oreb: 9.7,
                    dreb: 32.8,
                    ast: 26.0,
                    stl: 7.7,
                    blk: 4.5,
                    tov: 14.0,
                    pf: 17.3,
                    pfd: 19.2,
                    blka: 4.2,
                    min: 48.1,
                    plusMinus: 1.2,
                    wRank: 6,
                    lRank: 6,
                    gpRank: 1,
                    wPctRank: 6,
                    ptsRank: 19,
                    fgmRank: 20,
                    fgaRank: 30,
                    fgPctRank: 9,
                    fg3mRank: 15,
                    fg3aRank: 19,
                    fg3PctRank: 14,
                    ftmRank: 2,
                    ftaRank: 3,
                    ftPctRank: 13,
                    rebRank: 26,
                    orebRank: 27,
                    drebRank: 20,
                    astRank: 18,
                    stlRank: 22,
                    blkRank: 22,
                    tovRank: 12,
                    pfRank: 5,
                    pfdRank: 6,
                    blkaRank: 4,
                    minRank: 23,
                    plusMinusRank: 14
                )
            ),
            
            // Boston Celtics
            TeamSeasonAverages(
                team: TeamInfo(
                    id: 2,
                    conference: "East",
                    division: "Atlantic",
                    city: "Boston",
                    name: "Celtics",
                    fullName: "Boston Celtics",
                    abbreviation: "BOS"
                ),
                season: 2024,
                seasonType: "regular",
                stats: TeamSeasonStats(
                    w: 64,
                    l: 18,
                    gp: 82,
                    wPct: 0.78,
                    pts: 120.6,
                    fgm: 43.9,
                    fga: 90.2,
                    fgPct: 0.487,
                    fg3m: 16.5,
                    fg3a: 42.5,
                    fg3Pct: 0.388,
                    ftm: 16.3,
                    fta: 20.2,
                    ftPct: 0.807,
                    reb: 46.3,
                    oreb: 11.8,
                    dreb: 34.5,
                    ast: 26.9,
                    stl: 6.8,
                    blk: 6.6,
                    tov: 11.9,
                    pf: 16.2,
                    pfd: 17.3,
                    blka: 3.7,
                    min: 48.4,
                    plusMinus: 11.3,
                    wRank: 1,
                    lRank: 30,
                    gpRank: 1,
                    wPctRank: 1,
                    ptsRank: 1,
                    fgmRank: 6,
                    fgaRank: 6,
                    fgPctRank: 5,
                    fg3mRank: 1,
                    fg3aRank: 1,
                    fg3PctRank: 3,
                    ftmRank: 20,
                    ftaRank: 27,
                    ftPctRank: 5,
                    rebRank: 5,
                    orebRank: 5,
                    drebRank: 5,
                    astRank: 8,
                    stlRank: 29,
                    blkRank: 5,
                    tovRank: 30,
                    pfRank: 28,
                    pfdRank: 28,
                    blkaRank: 28,
                    minRank: 10,
                    plusMinusRank: 1
                )
            ),
            
            // Golden State Warriors
            TeamSeasonAverages(
                team: TeamInfo(
                    id: 10,
                    conference: "West",
                    division: "Pacific",
                    city: "Golden State",
                    name: "Warriors",
                    fullName: "Golden State Warriors",
                    abbreviation: "GSW"
                ),
                season: 2024,
                seasonType: "regular",
                stats: TeamSeasonStats(
                    w: 46,
                    l: 36,
                    gp: 82,
                    wPct: 0.561,
                    pts: 118.0,
                    fgm: 42.5,
                    fga: 89.8,
                    fgPct: 0.473,
                    fg3m: 14.8,
                    fg3a: 41.2,
                    fg3Pct: 0.359,
                    ftm: 18.2,
                    fta: 22.5,
                    ftPct: 0.809,
                    reb: 44.5,
                    oreb: 10.2,
                    dreb: 34.3,
                    ast: 29.2,
                    stl: 8.5,
                    blk: 4.8,
                    tov: 14.5,
                    pf: 19.8,
                    pfd: 20.1,
                    blka: 4.5,
                    min: 48.2,
                    plusMinus: 3.2,
                    wRank: 10,
                    lRank: 10,
                    gpRank: 1,
                    wPctRank: 10,
                    ptsRank: 4,
                    fgmRank: 12,
                    fgaRank: 8,
                    fgPctRank: 12,
                    fg3mRank: 7,
                    fg3aRank: 2,
                    fg3PctRank: 22,
                    ftmRank: 6,
                    ftaRank: 12,
                    ftPctRank: 4,
                    rebRank: 12,
                    orebRank: 15,
                    drebRank: 8,
                    astRank: 2,
                    stlRank: 5,
                    blkRank: 18,
                    tovRank: 8,
                    pfRank: 2,
                    pfdRank: 3,
                    blkaRank: 8,
                    minRank: 18,
                    plusMinusRank: 8
                )
            ),
            
            // Milwaukee Bucks
            TeamSeasonAverages(
                team: TeamInfo(
                    id: 17,
                    conference: "East",
                    division: "Central",
                    city: "Milwaukee",
                    name: "Bucks",
                    fullName: "Milwaukee Bucks",
                    abbreviation: "MIL"
                ),
                season: 2024,
                seasonType: "regular",
                stats: TeamSeasonStats(
                    w: 49,
                    l: 33,
                    gp: 82,
                    wPct: 0.598,
                    pts: 119.2,
                    fgm: 43.8,
                    fga: 89.5,
                    fgPct: 0.489,
                    fg3m: 13.8,
                    fg3a: 38.2,
                    fg3Pct: 0.361,
                    ftm: 17.8,
                    fta: 23.5,
                    ftPct: 0.757,
                    reb: 45.8,
                    oreb: 10.5,
                    dreb: 35.3,
                    ast: 25.2,
                    stl: 7.2,
                    blk: 5.8,
                    tov: 13.8,
                    pf: 18.5,
                    pfd: 20.5,
                    blka: 4.8,
                    min: 48.3,
                    plusMinus: 4.5,
                    wRank: 7,
                    lRank: 7,
                    gpRank: 1,
                    wPctRank: 7,
                    ptsRank: 3,
                    fgmRank: 7,
                    fgaRank: 9,
                    fgPctRank: 4,
                    fg3mRank: 12,
                    fg3aRank: 12,
                    fg3PctRank: 20,
                    ftmRank: 10,
                    ftaRank: 5,
                    ftPctRank: 28,
                    rebRank: 7,
                    orebRank: 12,
                    drebRank: 4,
                    astRank: 20,
                    stlRank: 25,
                    blkRank: 8,
                    tovRank: 14,
                    pfRank: 12,
                    pfdRank: 2,
                    blkaRank: 12,
                    minRank: 15,
                    plusMinusRank: 6
                )
            )
        ],
        meta: TeamMeta(perPage: 25)
    )
    
    // MARK: - Helper Methods
    
    static func getTeamSeasonAverages(for teamId: Int) -> TeamSeasonAverages? {
        return teamSeasonAveragesResponse.data.first { $0.team.id == teamId }
    }
}

// MARK: - Individual Mock Extensions
extension TeamSeasonAverages {
    static let lakersMock = MockTeamData.teamSeasonAveragesResponse.data[0]
    static let celticsMock = MockTeamData.teamSeasonAveragesResponse.data[1]
    static let warriorsMock = MockTeamData.teamSeasonAveragesResponse.data[2]
    static let bucksMock = MockTeamData.teamSeasonAveragesResponse.data[3]
}
