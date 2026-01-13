//
//  ProfileViewModel.swift
//  Swish
//
//  Created by Bacho on 06.01.26.
//

import Combine

@MainActor
public final class ProfileViewModel: ObservableObject {
    
    private weak var coordinator: MainCoordinator?
    
    @Published var userEmail: String = ""
    
    public init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        loadUserData()
    }
    
    deinit {
        print("ProfileViewModel destroyed")
    }
    
    // MARK: - Navigation
    
    func navigateBack() {
        coordinator?.navigateBack()
    }
    
    func signOut() {
        coordinator?.signOut()
    }
    
    // MARK: - Actions
    
    func subscribe() {
        // TODO: Handle subscription payment
        print("Subscribe tapped")
    }
    
    func addFavoriteTeam() {
        // TODO: Add favorite team
        print("Add favorite team tapped")
    }
    
    func addFavoritePlayer() {
        // TODO: Add favorite player
        print("Add favorite player tapped")
    }
    
    // MARK: - Private Methods
    
    private func loadUserData() {
        // TODO: Load user data from firebase or usserDefaults
        userEmail = "bacho@gmail.com"
    }
}
