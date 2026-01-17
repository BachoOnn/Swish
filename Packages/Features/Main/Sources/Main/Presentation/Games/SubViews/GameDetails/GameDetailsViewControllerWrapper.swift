//
//  GameDetailsViewControllerWrapper.swift
//  Swish
//
//  Created by Bacho on 10.01.26.
//

import SwiftUI
import GameDomain

struct GameDetailsViewControllerWrapper: UIViewControllerRepresentable {
    
    let game: Game

    func makeUIViewController(context: Context) -> GameDetailsViewController {
        let viewModel = GameDetailsViewModel(game: game)
        return GameDetailsViewController(viewModel: viewModel)
    }
    
    func updateUIViewController(_ uiViewController: GameDetailsViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = GameDetailsViewController
    
}
