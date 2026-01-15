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
                    
                    recordSection
                    
                    keyStatsSection
                    
                    shootingChartsSection
                    
                    leagueRankingsSection
                    
                }
            }
        }
    }
}


#Preview {
    TeamView(viewModel: TeamViewModel(team: .lakersMock))
}
