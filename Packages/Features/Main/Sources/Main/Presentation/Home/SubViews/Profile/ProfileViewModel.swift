//
//  ProfileViewModel.swift
//  Swish
//
//  Created by Bacho on 06.01.26.
//

import Combine
import AuthDomain

@MainActor
public final class ProfileViewModel: ObservableObject {
    
    private weak var coordinator: MainCoordinator?
    private let getProfileUseCase: DefaultGetProfileUseCase
    
    @Published var userEmail: String = ""
    @Published var userName: String = ""
    
    public init(coordinator: MainCoordinator, getProfileUseCase: DefaultGetProfileUseCase) {
        self.coordinator = coordinator
        self.getProfileUseCase = getProfileUseCase
        loadUserData()
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
        let data = getProfileUseCase.execute()
        self.userEmail = data.email
        self.userName = data.name
    }
}
