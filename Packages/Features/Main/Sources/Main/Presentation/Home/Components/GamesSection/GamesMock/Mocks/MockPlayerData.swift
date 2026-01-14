//
//  MockPlayerData.swift
//  Swish
//
//  Created by Bacho on 14.01.26.
//

struct MockPlayerData {
    
    // MARK: - Season Averages Mock Data
    static let seasonAveragesResponse = PlayerSeasonAveragesResponse(
        data: [
            // Jayson Tatum
            PlayerSeasonAverages(
                player: PlayerInSeasonStats(
                    id: 101,
                    firstName: "Jayson",
                    lastName: "Tatum",
                    position: "F",
                    height: "6-8",
                    weight: "210",
                    jerseyNumber: "0",
                    college: "Duke",
                    country: "USA",
                    draftYear: 2017,
                    draftRound: 1,
                    draftNumber: 3
                ),
                season: 2024,
                seasonType: "regular",
                stats: SeasonStats(
                    gamesPlayed: 45,
                    min: 36.2,
                    fgm: 9.8,
                    fga: 20.5,
                    fg3m: 3.2,
                    fg3a: 8.6,
                    ftm: 5.0,
                    fta: 6.2,
                    oreb: 1.2,
                    dreb: 7.2,
                    reb: 8.4,
                    ast: 5.2,
                    stl: 1.2,
                    blk: 0.8,
                    turnover: 2.4,
                    pf: 2.1,
                    pts: 27.8,
                    fgPct: 0.478,
                    fg3Pct: 0.372,
                    ftPct: 0.806
                )
            ),
            
            // Stephen Curry
            PlayerSeasonAverages(
                player: PlayerInSeasonStats(
                    id: 201,
                    firstName: "Stephen",
                    lastName: "Curry",
                    position: "G",
                    height: "6-2",
                    weight: "185",
                    jerseyNumber: "30",
                    college: "Davidson",
                    country: "USA",
                    draftYear: 2009,
                    draftRound: 1,
                    draftNumber: 7
                ),
                season: 2024,
                seasonType: "regular",
                stats: SeasonStats(
                    gamesPlayed: 42,
                    min: 34.5,
                    fgm: 8.9,
                    fga: 19.2,
                    fg3m: 5.2,
                    fg3a: 12.4,
                    ftm: 3.4,
                    fta: 3.8,
                    oreb: 0.6,
                    dreb: 4.2,
                    reb: 4.8,
                    ast: 6.2,
                    stl: 1.5,
                    blk: 0.4,
                    turnover: 2.8,
                    pf: 1.8,
                    pts: 26.4,
                    fgPct: 0.464,
                    fg3Pct: 0.419,
                    ftPct: 0.895
                )
            ),
            
            // LeBron James
            PlayerSeasonAverages(
                player: PlayerInSeasonStats(
                    id: 302,
                    firstName: "LeBron",
                    lastName: "James",
                    position: "F",
                    height: "6-9",
                    weight: "250",
                    jerseyNumber: "23",
                    college: nil,
                    country: "USA",
                    draftYear: 2003,
                    draftRound: 1,
                    draftNumber: 1
                ),
                season: 2024,
                seasonType: "regular",
                stats: SeasonStats(
                    gamesPlayed: 40,
                    min: 35.8,
                    fgm: 9.2,
                    fga: 18.6,
                    fg3m: 2.4,
                    fg3a: 6.8,
                    ftm: 4.4,
                    fta: 6.0,
                    oreb: 1.2,
                    dreb: 6.6,
                    reb: 7.8,
                    ast: 8.4,
                    stl: 1.3,
                    blk: 0.7,
                    turnover: 3.2,
                    pf: 1.9,
                    pts: 25.2,
                    fgPct: 0.495,
                    fg3Pct: 0.353,
                    ftPct: 0.733
                )
            ),
            
            // Luka Doncic
            PlayerSeasonAverages(
                player: PlayerInSeasonStats(
                    id: 501,
                    firstName: "Luka",
                    lastName: "Doncic",
                    position: "G",
                    height: "6-7",
                    weight: "230",
                    jerseyNumber: "77",
                    college: nil,
                    country: "Slovenia",
                    draftYear: 2018,
                    draftRound: 1,
                    draftNumber: 3
                ),
                season: 2024,
                seasonType: "regular",
                stats: SeasonStats(
                    gamesPlayed: 44,
                    min: 37.4,
                    fgm: 11.4,
                    fga: 23.2,
                    fg3m: 4.2,
                    fg3a: 10.8,
                    ftm: 6.8,
                    fta: 8.4,
                    oreb: 1.4,
                    dreb: 7.5,
                    reb: 8.9,
                    ast: 9.6,
                    stl: 1.4,
                    blk: 0.5,
                    turnover: 3.8,
                    pf: 2.3,
                    pts: 33.8,
                    fgPct: 0.491,
                    fg3Pct: 0.389,
                    ftPct: 0.810
                )
            ),
            
            // Joel Embiid
            PlayerSeasonAverages(
                player: PlayerInSeasonStats(
                    id: 601,
                    firstName: "Joel",
                    lastName: "Embiid",
                    position: "C",
                    height: "7-0",
                    weight: "280",
                    jerseyNumber: "21",
                    college: "Kansas",
                    country: "Cameroon",
                    draftYear: 2014,
                    draftRound: 1,
                    draftNumber: 3
                ),
                season: 2024,
                seasonType: "regular",
                stats: SeasonStats(
                    gamesPlayed: 38,
                    min: 34.6,
                    fgm: 10.8,
                    fga: 21.4,
                    fg3m: 1.8,
                    fg3a: 5.2,
                    ftm: 7.0,
                    fta: 8.6,
                    oreb: 2.4,
                    dreb: 8.8,
                    reb: 11.2,
                    ast: 4.6,
                    stl: 1.0,
                    blk: 1.8,
                    turnover: 3.4,
                    pf: 2.8,
                    pts: 30.4,
                    fgPct: 0.504,
                    fg3Pct: 0.346,
                    ftPct: 0.814
                )
            )
        ],
        meta: Meta(
            totalPages: nil,
            currentPage: nil,
            nextPage: nil,
            perPage: 25,
            totalCount: nil
        )
    )
    
    // MARK: - Shooting Stats Mock Data
    static let shootingStatsResponse = PlayerShootingStatsResponse(
        data: [
            // Jayson Tatum
            PlayerShootingStats(
                player: PlayerInSeasonStats(
                    id: 101,
                    firstName: "Jayson",
                    lastName: "Tatum",
                    position: "F",
                    height: "6-8",
                    weight: "210",
                    jerseyNumber: "0",
                    college: "Duke",
                    country: "USA",
                    draftYear: 2017,
                    draftRound: 1,
                    draftNumber: 3
                ),
                season: 2024,
                seasonType: "regular",
                stats: ShootingRangeStats(
                    lessThan5FtFga: 4.2,
                    lessThan5FtFgm: 2.8,
                    lessThan5FtFgPct: 0.667,
                    ft5to9Fga: 2.4,
                    ft5to9Fgm: 1.2,
                    ft5to9FgPct: 0.500,
                    ft10to14Fga: 1.8,
                    ft10to14Fgm: 0.9,
                    ft10to14FgPct: 0.500,
                    ft15to19Fga: 2.2,
                    ft15to19Fgm: 1.1,
                    ft15to19FgPct: 0.500,
                    ft20to24Fga: 1.4,
                    ft20to24Fgm: 0.6,
                    ft20to24FgPct: 0.429,
                    ft25to29Fga: 6.8,
                    ft25to29Fgm: 2.4,
                    ft25to29FgPct: 0.353,
                    ft30to34Fga: 0.8,
                    ft30to34Fgm: 0.3,
                    ft30to34FgPct: 0.375,
                    ft35to39Fga: 0.2,
                    ft35to39Fgm: 0.1,
                    ft35to39FgPct: 0.500,
                    ft40PlusFga: 0.1,
                    ft40PlusFgm: 0.0,
                    ft40PlusFgPct: 0.000
                )
            ),
            
            // Stephen Curry
            PlayerShootingStats(
                player: PlayerInSeasonStats(
                    id: 201,
                    firstName: "Stephen",
                    lastName: "Curry",
                    position: "G",
                    height: "6-2",
                    weight: "185",
                    jerseyNumber: "30",
                    college: "Davidson",
                    country: "USA",
                    draftYear: 2009,
                    draftRound: 1,
                    draftNumber: 7
                ),
                season: 2024,
                seasonType: "regular",
                stats: ShootingRangeStats(
                    lessThan5FtFga: 3.2,
                    lessThan5FtFgm: 2.4,
                    lessThan5FtFgPct: 0.750,
                    ft5to9Fga: 1.8,
                    ft5to9Fgm: 1.0,
                    ft5to9FgPct: 0.556,
                    ft10to14Fga: 1.2,
                    ft10to14Fgm: 0.6,
                    ft10to14FgPct: 0.500,
                    ft15to19Fga: 1.4,
                    ft15to19Fgm: 0.7,
                    ft15to19FgPct: 0.500,
                    ft20to24Fga: 1.8,
                    ft20to24Fgm: 0.9,
                    ft20to24FgPct: 0.500,
                    ft25to29Fga: 8.4,
                    ft25to29Fgm: 3.6,
                    ft25to29FgPct: 0.429,
                    ft30to34Fga: 2.2,
                    ft30to34Fgm: 0.9,
                    ft30to34FgPct: 0.409,
                    ft35to39Fga: 0.8,
                    ft35to39Fgm: 0.3,
                    ft35to39FgPct: 0.375,
                    ft40PlusFga: 0.4,
                    ft40PlusFgm: 0.1,
                    ft40PlusFgPct: 0.250
                )
            ),
            
            // LeBron James
            PlayerShootingStats(
                player: PlayerInSeasonStats(
                    id: 302,
                    firstName: "LeBron",
                    lastName: "James",
                    position: "F",
                    height: "6-9",
                    weight: "250",
                    jerseyNumber: "23",
                    college: nil,
                    country: "USA",
                    draftYear: 2003,
                    draftRound: 1,
                    draftNumber: 1
                ),
                season: 2024,
                seasonType: "regular",
                stats: ShootingRangeStats(
                    lessThan5FtFga: 6.8,
                    lessThan5FtFgm: 4.5,
                    lessThan5FtFgPct: 0.662,
                    ft5to9Fga: 2.2,
                    ft5to9Fgm: 1.2,
                    ft5to9FgPct: 0.545,
                    ft10to14Fga: 1.4,
                    ft10to14Fgm: 0.7,
                    ft10to14FgPct: 0.500,
                    ft15to19Fga: 1.2,
                    ft15to19Fgm: 0.5,
                    ft15to19FgPct: 0.417,
                    ft20to24Fga: 1.6,
                    ft20to24Fgm: 0.6,
                    ft20to24FgPct: 0.375,
                    ft25to29Fga: 4.8,
                    ft25to29Fgm: 1.6,
                    ft25to29FgPct: 0.333,
                    ft30to34Fga: 0.6,
                    ft30to34Fgm: 0.2,
                    ft30to34FgPct: 0.333,
                    ft35to39Fga: 0.0,
                    ft35to39Fgm: 0.0,
                    ft35to39FgPct: 0.000,
                    ft40PlusFga: 0.0,
                    ft40PlusFgm: 0.0,
                    ft40PlusFgPct: 0.000
                )
            ),
            
            // Luka Doncic
            PlayerShootingStats(
                player: PlayerInSeasonStats(
                    id: 501,
                    firstName: "Luka",
                    lastName: "Doncic",
                    position: "G",
                    height: "6-7",
                    weight: "230",
                    jerseyNumber: "77",
                    college: nil,
                    country: "Slovenia",
                    draftYear: 2018,
                    draftRound: 1,
                    draftNumber: 3
                ),
                season: 2024,
                seasonType: "regular",
                stats: ShootingRangeStats(
                    lessThan5FtFga: 5.4,
                    lessThan5FtFgm: 3.6,
                    lessThan5FtFgPct: 0.667,
                    ft5to9Fga: 2.8,
                    ft5to9Fgm: 1.4,
                    ft5to9FgPct: 0.500,
                    ft10to14Fga: 2.2,
                    ft10to14Fgm: 1.1,
                    ft10to14FgPct: 0.500,
                    ft15to19Fga: 1.8,
                    ft15to19Fgm: 0.8,
                    ft15to19FgPct: 0.444,
                    ft20to24Fga: 2.4,
                    ft20to24Fgm: 1.0,
                    ft20to24FgPct: 0.417,
                    ft25to29Fga: 7.6,
                    ft25to29Fgm: 2.8,
                    ft25to29FgPct: 0.368,
                    ft30to34Fga: 1.4,
                    ft30to34Fgm: 0.5,
                    ft30to34FgPct: 0.357,
                    ft35to39Fga: 0.4,
                    ft35to39Fgm: 0.1,
                    ft35to39FgPct: 0.250,
                    ft40PlusFga: 0.2,
                    ft40PlusFgm: 0.0,
                    ft40PlusFgPct: 0.000
                )
            ),
            
            // Joel Embiid
            PlayerShootingStats(
                player: PlayerInSeasonStats(
                    id: 601,
                    firstName: "Joel",
                    lastName: "Embiid",
                    position: "C",
                    height: "7-0",
                    weight: "280",
                    jerseyNumber: "21",
                    college: "Kansas",
                    country: "Cameroon",
                    draftYear: 2014,
                    draftRound: 1,
                    draftNumber: 3
                ),
                season: 2024,
                seasonType: "regular",
                stats: ShootingRangeStats(
                    lessThan5FtFga: 8.2,
                    lessThan5FtFgm: 5.4,
                    lessThan5FtFgPct: 0.659,
                    ft5to9Fga: 3.4,
                    ft5to9Fgm: 1.8,
                    ft5to9FgPct: 0.529,
                    ft10to14Fga: 2.2,
                    ft10to14Fgm: 1.0,
                    ft10to14FgPct: 0.455,
                    ft15to19Fga: 1.8,
                    ft15to19Fgm: 0.9,
                    ft15to19FgPct: 0.500,
                    ft20to24Fga: 1.4,
                    ft20to24Fgm: 0.6,
                    ft20to24FgPct: 0.429,
                    ft25to29Fga: 3.6,
                    ft25to29Fgm: 1.2,
                    ft25to29FgPct: 0.333,
                    ft30to34Fga: 0.4,
                    ft30to34Fgm: 0.1,
                    ft30to34FgPct: 0.250,
                    ft35to39Fga: 0.0,
                    ft35to39Fgm: 0.0,
                    ft35to39FgPct: 0.000,
                    ft40PlusFga: 0.0,
                    ft40PlusFgm: 0.0,
                    ft40PlusFgPct: 0.000
                )
            )
        ],
        meta: Meta(
            totalPages: nil,
            currentPage: nil,
            nextPage: nil,
            perPage: 25,
            totalCount: nil
        )
    )
    
    // MARK: - Helper Methods
    
    static func getSeasonAverages(for playerId: Int) -> PlayerSeasonAverages? {
        return seasonAveragesResponse.data.first { $0.player.id == playerId }
    }
    
    static func getShootingStats(for playerId: Int) -> PlayerShootingStats? {
        return shootingStatsResponse.data.first { $0.player.id == playerId }
    }
}
