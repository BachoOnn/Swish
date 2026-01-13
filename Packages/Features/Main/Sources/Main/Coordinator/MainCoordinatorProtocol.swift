//
//  MainCoordinatorProtocol.swift
//  Swish
//
//  Created by Bacho on 06.01.26.
//

import Foundation

public protocol MainCoordinatorProtocol: ObservableObject {
    var navigationPath: [AppRoute] { get set }
    
    func navigateToProfile()
    func navigateToGameDetails(game: Game)
    func navigateBack()
    func signOut()
}
