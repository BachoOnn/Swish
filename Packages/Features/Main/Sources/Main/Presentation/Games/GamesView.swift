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
                    loadingView
                } else if let errorMessage = viewModel.errorMessage {
                    errorView(errorMessage)
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
    
    // MARK: - Loading View
    private var loadingView: some View {
        VStack {
            Spacer()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1.5)
            Text("Loading games...")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.top, 8)
            Spacer()
        }
    }
    
    // MARK: - Error View
    private func errorView(_ message: String) -> some View {
        VStack(spacing: 16) {
            Spacer()
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 50))
                .foregroundColor(.orange)
            
            Text("Oops!")
                .font(.title2.bold())
            
            Text(message)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            
            Button(action: {
                viewModel.loadGames(for: selection)
            }) {
                Text("Try Again")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 8)
            
            Spacer()
        }
    }
}
