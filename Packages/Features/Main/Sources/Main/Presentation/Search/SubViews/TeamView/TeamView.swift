//
//  TeamView.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import SwiftUI
import Common

struct TeamView: View {
    
    @StateObject var viewModel: TeamViewModel
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    headerSection
                    teamInfoSection
                    
                    if viewModel.isLoadingStats {
                        loadingSection
                        
                    } else if let stats = viewModel.stats {
                        
                        recordSection(stats: stats)
                        keyStatsSection(stats: stats)
                        shootingChartsSection(stats: stats)
                        leagueRankingsSection(stats: stats)
                        
                    } else if let error = viewModel.errorMessage {
                        
                        errorSection(message: error)
                        
                    } else {
                        placeholderSection
                    }
                }
            }
        }
        .task {
            await viewModel.fetchTeamStats()
        }
    }
}
