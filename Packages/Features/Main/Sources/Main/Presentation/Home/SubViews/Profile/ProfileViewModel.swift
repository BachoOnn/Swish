//
//  ProfileViewModel.swift
//  Swish
//
//  Created by Bacho on 06.01.26.
//

import Combine
import AuthDomain
import TeamDomain
import FavoritesDomain

@MainActor
public final class ProfileViewModel: ObservableObject {
    
    private weak var coordinator: MainCoordinator?
    private let getProfileUseCase: DefaultGetProfileUseCase
    private let getTeamFavoritesUseCase: DefaultGetTeamFavoritesUseCase
    
    @Published var userEmail: String = ""
    @Published var userName: String = ""
    @Published var favoriteTeams: [Team] = []
    
    public init(coordinator: MainCoordinator, getProfileUseCase: DefaultGetProfileUseCase, getTeamFavoritesUseCase: DefaultGetTeamFavoritesUseCase) {
        self.coordinator = coordinator
        self.getProfileUseCase = getProfileUseCase
        self.getTeamFavoritesUseCase = getTeamFavoritesUseCase
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
    
    // MARK: - Actions
    
    func subscribe() {
        // TODO: Handle subscription payment
        print("Subscribe tapped")
    }
    
    func loadFavoriteTeams() {
        favoriteTeams = getTeamFavoritesUseCase.executeGet()
    }
    
    func addFavoritePlayer() {
        // TODO: Add favorite player
        print("Add favorite player tapped")
    }
    
    // MARK: - Private Methods
    private func loadUserData() {
        let data = getProfileUseCase.execute()
        self.userEmail = data.email
        self.userName = data.name
    }
}
