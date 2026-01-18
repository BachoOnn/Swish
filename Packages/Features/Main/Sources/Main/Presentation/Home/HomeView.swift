//  HomeView.swift
//  Auth
//
//  Created by Bacho on 01.01.26.
//

import SwiftUI
import Common
import Helpers

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    @State var scrollID: Int?
    @State private var hasLoadedOnce = false
    @State var selectedNewsURL: URL?
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            VStack(spacing: 0) {
                HeaderView(action: {
                    viewModel.navigateToProfile()
                })
                .ignoresSafeArea()
                .frame(height: 60)
                
                ScrollView {
                    VStack(spacing: 50) {
                        gameCardSection
                        newsSection
                    }
                }
                .scrollIndicators(.hidden)
                .frame(maxWidth: .infinity)
            }
        }
        .task(id: hasLoadedOnce) {
            guard !hasLoadedOnce else { return }
            async let games: () = viewModel.loadTodaysGames()
            async let news: () = viewModel.loadNews()
            
            _ = await (games, news)
            hasLoadedOnce = true
        }
        .refreshable {
            Task {
                async let games: () = viewModel.refreshGames()
                async let news: () = viewModel.refreshNews()
                
                _ = await (games, news)
            }
        }
        .sheet(item: $selectedNewsURL) { url in
            WebView(url)
        }
    }
}

