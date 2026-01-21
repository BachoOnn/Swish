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
        .onLoad(perform: viewModel.onLoad)
        .refreshable { viewModel.refresh() }
        .sheet(item: $selectedNewsURL) { url in
            WebView(url)
        }
    }
}

