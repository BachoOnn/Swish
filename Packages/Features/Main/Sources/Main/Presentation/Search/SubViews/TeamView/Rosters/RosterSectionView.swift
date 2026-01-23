//
//  RosterSectionView.swift
//  Main
//
//  Created by Bacho on 23.01.26.
//

import SwiftUI
import Common
import Helpers

struct RosterSectionView: View {
    
    @ObservedObject var viewModel: TeamViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isLoadingRoster {
                CustomLoadingView(message: "Loading Roster...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if !viewModel.roster.isEmpty {
                rosterContent
            } else if let error = viewModel.rosterErrorMessage {
                CustomErrorView(
                    message: error,
                    retryAction: viewModel.onRostersLoad
                )
                .padding(.top, 40)
            } else {
                VStack(spacing: 16) {
                    Image(systemName: "person.3.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.secondary)
                    
                    Text("No roster available")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 40)
            }
        }
        .onLoad(perform: viewModel.onRostersLoad)
    }
}
