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
    
    @State var selection: Date? = .now
    @State var title: String = Calendar.monthAndYear(from: .now)
    @State var focusedWeek: Week = .current
    @State var calendarType: CalendarType = .week
    @State var isDragging: Bool = false
    @State var dragProgress: CGFloat = .zero
    @State var initialDragOffset: CGFloat? = nil
    @State var verticalDragOffset: CGFloat = .zero
    
    var symbols = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            VStack(spacing: 1) {
                headerSection
                    .ignoresSafeArea()
                    .frame(height: 65)
                
                calendarSection
                
                if viewModel.isLoading {
                    CustomLoadingView(message: "Loading Games...")
                } else if let errorMessage = viewModel.errorMessage {
                    CustomErrorView(message: errorMessage) {
                        viewModel.loadGames(for: selection)
                    }
                } else if viewModel.games.isEmpty {
                        Text("No Game For This Day")
                        .padding(.top, 80)
                } else {
                    GamesCollectionView(viewModel: viewModel)
                }
                
                Spacer()
            }
        }
        .task {
            viewModel.loadGames(for: selection)
        }
        .onChange(of: selection) { _, newValue in
            viewModel.loadGames(for: newValue)
        }
    }
}
