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
                CustomLoadingView(message: "Loading Stats...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if viewModel.playerStats != nil {
                mainStatsContent
            } else {
                VStack {
                    Text("No statistics available.")
                        .padding(.top, 40)
                    Spacer()
                }
            }
        }
        .onLoad(perform: viewModel.onLoad)
    }
}
