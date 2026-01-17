//
//  GamesCollectionView.swift
//  Swish
//
//  Created by Bacho on 12.01.26.
//

import SwiftUI
import UIKit
import GameDomain

struct GamesCollectionView: UIViewRepresentable {
    @ObservedObject var viewModel: GamesViewModel
    
    func makeUIView(context: Context) -> UICollectionView {
        let layout = context.coordinator.createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = context.coordinator
        collectionView.dataSource = context.coordinator
        collectionView.register(GameCell.self, forCellWithReuseIdentifier: "GameCell")
        return collectionView
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {
        context.coordinator.games = viewModel.games
        uiView.reloadData()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(viewModel: viewModel)
    }
}

// MARK: - Coordinator
extension GamesCollectionView {
    class Coordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
        var games: [Game] = []
        let viewModel: GamesViewModel
        
        init(viewModel: GamesViewModel) {
            self.viewModel = viewModel
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            games.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCell", for: indexPath) as! GameCell
            let game = games[indexPath.item]
            cell.configure(with: game)
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let game = games[indexPath.item]
            viewModel.navigateToGameDetails(game: game) 
        }
        
        // MARK: - Layout
        func createLayout() -> UICollectionViewLayout {
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(150)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(150)
            )
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 5
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16)
            
            return UICollectionViewCompositionalLayout(section: section)
        }
    }
}
