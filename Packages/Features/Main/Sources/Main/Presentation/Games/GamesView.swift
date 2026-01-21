//
//  GamesView.swift
//  Swish
//
//  Created by Bacho on 01.01.26.
//

import Foundation
import SwiftUI
import Common
import Helpers

struct GamesView: View {
    
    @StateObject var viewModel: GamesViewModel
        
    var body: some View {
        ZStack {
            GradientBackground()
            
            VStack(spacing: .zero) {
                headerSection
                    .ignoresSafeArea()
                    .frame(height: 65)
                
                calendarSection
                
                if viewModel.isLoading {
                    CustomLoadingView(message: "Loading Games...")
                } else if let errorMessage = viewModel.errorMessage {
                    CustomErrorView(
                        message: errorMessage,
                        retryAction: viewModel.onLoad
                    )
                } else if viewModel.games.isEmpty {
                        Text("No Game For This Day")
                        .padding(.top, 80)
                } else {
                    GamesCollectionView(viewModel: viewModel)
                }
                
                Spacer()
            }
        }
        .onLoad(perform: viewModel.onLoad)
        .onChange(of: viewModel.selection, viewModel.onLoad)
    }
}
