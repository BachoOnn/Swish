//
//  DiscoverViewModel.swift
//  Main
//
//  Created by Bacho on 13.01.26.
//

import Foundation

public final class DiscoverViewModel {
    
    enum NBALink: String {
        case standings = "https://www.nba.com/standings"
        case askSwish = "https://www.blitznba.com/"
        case players = "https://www.nba.com/players"
        case teams = "https://www.nba.com/teams"
        case statsLeader = "https://www.nba.com/stats/leaders"
        case allStarVoting = "https://vote.nba.com/en"
        case bal = "https://bal.nba.com/"
        case wnba = "https://www.wnba.com/"
        case nba2k = "https://nba2kleague.com/"
        case gLeague = "https://gleague.nba.com/"
        
        var url: URL? {
            URL(string: rawValue)
        }
    }
}
