//
//  GameDetailsViewControllerWrapper.swift
//  Swish
//
//  Created by Bacho on 10.01.26.
//

import SwiftUI
import GameDomain

struct GameDetailsViewControllerWrapper: UIViewControllerRepresentable {
    
    let viewModel: GameDetailsViewModel

    func makeUIViewController(context: Context) -> GameDetailsViewController {
        return GameDetailsViewController(viewModel: viewModel)
    }
    
    func updateUIViewController(_ uiViewController: GameDetailsViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = GameDetailsViewController
    
}
