//
//  PlayerViewModel.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import Combine
import PlayerDomain

@MainActor
public final class PlayerViewModel: ObservableObject {
    
    @Published var isFavorite: Bool = false
    @Published var selectedSide: PlayerPickerSide = .Profile
    @Published var player: Player
    @Published var playerStats: PlayerSeasonStats?
    @Published var isLoadingStats: Bool = false
    @Published var errorMessage: String?
    
    private let getPlayerStatsUseCase: DefaultGetPlayerStatsUseCase
    
    public init(player: Player, getPlayerStatsUseCase: DefaultGetPlayerStatsUseCase) {
        self.player = player
        self.getPlayerStatsUseCase = getPlayerStatsUseCase
    }
    
    func toggleFavorite() {
        // TODO: add userdefaults service here than and check like this :
        // isFavorite = favoritesService.isFavorite(player: Player)
        
        isFavorite.toggle()
    }
    
    func fetchPlayerStats() async {
        isLoadingStats = true
        errorMessage = nil
        
        do {
            playerStats = try await getPlayerStatsUseCase.execute(id: player.id)
            print("Stats fetched successfully: \(playerStats?.pts ?? 0)") 
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
