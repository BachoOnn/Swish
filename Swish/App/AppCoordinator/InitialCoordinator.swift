//
//  InitialCoordinator.swift
//  Swish
//
//  Created by Bacho on 01.01.26.
//

import UIKit
import SwiftUI
import Authorization
import Main
import PersistanceService
import FirebaseService
import APIService

@MainActor
final class InitialCoordinator {
    let navigationController: UINavigationController
    private var authCoordinator: AuthCoordinator?
    private var mainDIContainer: MainDIContainer?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        showLaunchScreen()
    }
    
    func showLaunchScreen() {
        let launchView = LaunchView { [weak self] in
            let persistenceRepo = KeychainUserRepository()
            
            if persistenceRepo.fetchUser() != nil {
                self?.showMainApp()
            } else {
                self?.showAuth()
            }
        }
        let hostingController = UIHostingController(rootView: launchView)
        navigationController.setViewControllers([hostingController], animated: false)
    }
    
    func showAuth() {
        let authCoordinator = AuthCoordinator()
        let authRepository = FirebaseAuthRepository(googleSignInService: GoogleSignInService())
        
        authCoordinator.setNavigationController(navigationController)
        authCoordinator.onAuthSuccess = { [weak self] in
            if let user = authRepository.currentUser {
                let persistence = KeychainUserRepository()
                persistence.saveUser(email: user.email, name: user.name)
            }
            self?.showMainApp()
        }
        self.authCoordinator = authCoordinator
        authCoordinator.start()
    }
    
    func showMainApp() {
        authCoordinator = nil
        
        let authRepository = FirebaseAuthRepository(googleSignInService: GoogleSignInService())
        let persistenceRepository = KeychainUserRepository()
        let gameRepository = GamesRepository()
        let newsRepository = NewsRepository()
        let teamsRepository = TeamsRepository()
        let playersRepository = PlayersRepository()
        let favoritesRepository = FavoritesRepository()
        
        let mainDIContainer = MainDIContainer(
            authRepository: authRepository,
            persistenceRepository: persistenceRepository,
            gameRepository: gameRepository,
            newsRepository: newsRepository,
            teamsRepository: teamsRepository,
            playersRepository: playersRepository,
            favoritesRepository: favoritesRepository
        )
        
        self.mainDIContainer = mainDIContainer
        
        mainDIContainer.coordinator.onSignOut = { [weak self] in
            persistenceRepository.clear()
            try? authRepository.signOut()
            self?.showAuth()
        }
        
        let rootView = RootView(container: mainDIContainer)
        let hostingController = UIHostingController(rootView: rootView)
        
        navigationController.setViewControllers([hostingController], animated: false)
    }
}
