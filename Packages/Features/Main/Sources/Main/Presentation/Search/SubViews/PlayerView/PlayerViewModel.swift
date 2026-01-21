//
//  PlayerViewModel.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import Combine
import PlayerDomain
import FavoritesDomain

@MainActor
public final class PlayerViewModel: ObservableObject {
    
    @Published var isFavorite: Bool = false
    @Published var selectedSide: PlayerPickerSide = .Profile
    @Published var player: Player
    @Published var playerStats: PlayerSeasonStats?
    @Published var isLoadingStats: Bool = false
    @Published var errorMessage: String?
    
    private let getPlayerStatsUseCase: DefaultGetPlayerStatsUseCase
    private let getPlayerFavoritesUseCase: DefaultGetPlayerFavoritesUseCase
    
    public init(player: Player, getPlayerStatsUseCase: DefaultGetPlayerStatsUseCase, getPlayerFavoritesUseCase: DefaultGetPlayerFavoritesUseCase) {
        self.player = player
        self.getPlayerStatsUseCase = getPlayerStatsUseCase
        self.getPlayerFavoritesUseCase = getPlayerFavoritesUseCase
        self.isFavorite = getPlayerFavoritesUseCase.executeCheck(player: player)
    }
    
    func toggleFavorite() {
        getPlayerFavoritesUseCase.executeSave(player: player)
        isFavorite = getPlayerFavoritesUseCase.executeCheck(player: player)
    }
    
    func fetchPlayerStats() async {
        isLoadingStats = true
        errorMessage = nil
        
        do {
            playerStats = try await getPlayerStatsUseCase.execute(id: player.id)
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoadingStats = false
    }
    
    var playerName: String {
        "\(player.firstName) \(player.lastName)"
    }
    
    var number: String {
        "№ \(player.jerseyNumber ?? "N")"
    }
    
    var position: String {
        "Position: \(player.position)"
    }
    
    var team: String {
        player.team.name
    }

}
