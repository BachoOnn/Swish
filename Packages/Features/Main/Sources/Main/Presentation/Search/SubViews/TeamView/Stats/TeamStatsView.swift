//
//  TeamStatsView.swift
//  Main
//
//  Created by Bacho on 23.01.26.
//

import SwiftUI
import Common
import Helpers

struct TeamStatsView: View {
    
    @ObservedObject var viewModel: TeamViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isLoadingStats {
                CustomLoadingView(message: "Loading Team Statistics...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let stats = viewModel.stats {
                mainStatsContent(stats: stats)
            } else if let error = viewModel.errorMessage {
                CustomErrorView(
                    message: error,
                    retryAction: viewModel.onStatsLoad
                )
                .padding(.top, 40)
            } else {
                VStack(spacing: 16) {
                    Image(systemName: "chart.bar")
                        .font(.system(size: 50))
                        .foregroundColor(.secondary)
                    
                    Text("No stats available")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 40)
            }
        }
        .onLoad(perform: viewModel.onStatsLoad)
    }
}
