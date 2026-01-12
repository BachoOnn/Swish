//  GameDetailsViewModel.swift
//  Swish
//
//  Created by Bacho on 10.01.26.
//

final class GameDetailsViewModel {
    
    private let game: Game
    
    // MARK: - Init
    init(game: Game) {
        self.game = game
    }
    
    // MARK: - Properties
    var currentGame: Game { game }
    
    var homeTeam: String {
        game.homeTeam.abbreviation
    }
    
    var visitorTeam: String {
        game.visitorTeam.abbreviation
    }
    
    var homeTeamScore: Int {
        game.homeTeamScore
    }
    
    var visitorTeamScore: Int {
        game.visitorTeamScore
    }
    
    var status: String {
        game.status
    }
    
    var topPerformers: [PlayerGameStats] {
        let homeTop = currentGame.getTopHomePerformers(from: MockGameData.mockPlayerStats)
        let visitorTop = currentGame.getTopVisitorPerformers(from: MockGameData.mockPlayerStats)
        return homeTop + visitorTop
    }
}
