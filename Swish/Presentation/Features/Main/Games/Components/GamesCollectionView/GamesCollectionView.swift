//
//  GamesCollectionView.swift
//  Swish
//
//  Created by Bacho on 12.01.26.
//


import SwiftUI
import UIKit

struct GamesCollectionView: UIViewRepresentable {
    var selectedDate: Date?
    
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
        context.coordinator.selectedDate = selectedDate
        context.coordinator.loadGames()
        uiView.reloadData()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}

// MARK: - Coordinator
extension GamesCollectionView {
    class Coordinator: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
        var games: [Game] = []
        var selectedDate: Date?
        
        func loadGames() {
            guard let selectedDate = selectedDate else {
                games = MockGameData.allGames
                return
            }
            
            let calendar = Calendar.current
            
            // Get date components for selected date (ignoring time)
            let selectedComponents = calendar.dateComponents([.year, .month, .day], from: selectedDate)
            
            games = MockGameData.allGames.filter { game in
                let formatter = ISO8601DateFormatter()
                guard let gameDate = formatter.date(from: game.date) else {
                    print("❌ Failed to parse date: \(game.date)")
                    return false
                }
                
                let gameComponents = calendar.dateComponents([.year, .month, .day], from: gameDate)
                let isSameDay = selectedComponents.year == gameComponents.year &&
                selectedComponents.month == gameComponents.month &&
                selectedComponents.day == gameComponents.day
                
                if isSameDay {
                    print("✅ Found game: \(game.homeTeam.abbreviation) vs \(game.visitorTeam.abbreviation) on \(game.formattedDate)")
                }
                
                return isSameDay
            }
            
            print("🏀 Total games found: \(games.count) for date: \(selectedDate)")
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
        
        // MARK: - Layout
        func createLayout() -> UICollectionViewLayout {
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(120)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(120)
            )
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 12
            section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
            
            return UICollectionViewCompositionalLayout(section: section)
        }
    }
}
