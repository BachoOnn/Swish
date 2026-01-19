//
//  CellWrappers.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import SwiftUI
import TeamDomain

struct PlayerCellView: UIViewRepresentable {
    
    let player: PlayerSeasonAverages
    
    func makeUIView(context: Context) -> PlayerCell {
        let cell = PlayerCell()
        cell.configure(with: player)
        return cell
    }
    
    func updateUIView(_ uiView: PlayerCell, context: Context) {
        uiView.configure(with: player)
    }
}

struct TeamCellView: UIViewRepresentable {
    
    let team: Team
    
    func makeUIView(context: Context) -> TeamCell {
        let cell = TeamCell()
        cell.configure(with: team)
        return cell
    }
    
    func updateUIView(_ uiView: TeamCell, context: Context) {
        uiView.configure(with: team)
    }
}
