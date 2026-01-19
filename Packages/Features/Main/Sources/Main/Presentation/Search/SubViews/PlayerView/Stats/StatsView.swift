//
//  StatsView.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import SwiftUI
import Common
import Helpers

struct StatsView: View {
    
    @ObservedObject var viewModel: PlayerViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isLoadingStats {
                ProgressView("Loading Stats...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if viewModel.playerStats != nil {
                mainStatsContent
            } else {
                Text("No statistics available.")
            }
        }
        .task {
            await viewModel.fetchPlayerStats()
        }
    }
}
