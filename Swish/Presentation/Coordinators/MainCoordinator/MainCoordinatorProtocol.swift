//
//  MainCoordinatorProtocol.swift
//  Swish
//
//  Created by Bacho on 06.01.26.
//

import Foundation

protocol MainCoordinatorProtocol: ObservableObject {
    var navigationPath: [AppRoute] { get set }
    
    func navigateToProfile()
    func navigateBack()
    func signOut()
}
