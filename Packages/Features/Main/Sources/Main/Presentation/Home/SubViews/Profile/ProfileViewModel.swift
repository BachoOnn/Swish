//
//  ProfileViewModel.swift
//  Swish
//
//  Created by Bacho on 06.01.26.
//

import Combine
import AuthDomain
import TeamDomain
import PlayerDomain
import FavoritesDomain

@MainActor
public final class ProfileViewModel: ObservableObject {
    
    private weak var coordinator: MainCoordinator?
    private let getProfileUseCase: DefaultGetProfileUseCase
    private let getTeamFavoritesUseCase: DefaultGetTeamFavoritesUseCase
    private let getPlayerFavoritesUseCase: DefaultGetPlayerFavoritesUseCase
    
    @Published var userEmail: String = ""
    @Published var userName: String = ""
    @Published var favoriteTeams: [Team] = []
    @Published var favoritePlayers: [Player] = []
    
    public init(coordinator: MainCoordinator, getProfileUseCase: DefaultGetProfileUseCase, getTeamFavoritesUseCase: DefaultGetTeamFavoritesUseCase, getPlayerFavoritesUseCase: DefaultGetPlayerFavoritesUseCase) {
        self.coordinator = coordinator
        self.getProfileUseCase = getProfileUseCase
        self.getTeamFavoritesUseCase = getTeamFavoritesUseCase
        self.getPlayerFavoritesUseCase = getPlayerFavoritesUseCase
        loadUserData()
    }
    
    // MARK: - Navigation
    
    func navigateBack() {
        coordinator?.navigateBack()
    }
    
    func signOut() {
        coordinator?.signOut()
    }
    
    func goTeamDetails(team: Team) {
        coordinator?.navigateToTeam(team)
    }
    
    func goPlayerDetails(player: Player) {
        coordinator?.navigateToPlayer(player)
    }
    
    // MARK: - Actions
    
    func subscribe() {
        // TODO: Handle subscription payment
        print("Subscribe tapped")
    }
    
    func loadFavoriteTeams() {
        favoriteTeams = getTeamFavoritesUseCase.executeGet()
    }
    
    func loadFavoritePlayers() {
        favoritePlayers = getPlayerFavoritesUseCase.executeGet()
    }
    
    // MARK: - Private Methods
    private func loadUserData() {
        let data = getProfileUseCase.execute()
        self.userEmail = data.email
        self.userName = data.name
    }
}
