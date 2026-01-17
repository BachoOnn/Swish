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
    @State private var scrollID: Int?
    @State private var hasLoadedOnce = false
    @State private var selectedNewsURL: URL?
    
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
                await viewModel.refreshGames()
            }
        }
        .sheet(item: $selectedNewsURL) { url in
            WebView(url)
        }
    }
}

extension HomeView {
    private var gameCardSection: some View {
        VStack {
            if viewModel.isGamesLoading {
                VStack(spacing: 26) {
                    CustomProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1)
                    
                    Text("Loading today's games...")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                .frame(height: 200)
                .padding(.vertical)
            } else if viewModel.featuredGames.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "basketball.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.gray)
                    Text("No games today")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(height: 200)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        ForEach(Array(viewModel.featuredGames.enumerated()), id: \.element.id) { index, game in
                            GameCardView(game: game)
                                .padding(.horizontal, 10)
                                .containerRelativeFrame(.horizontal)
                                .scrollTransition(.animated, axis: .horizontal) { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1.0 : 0.6)
                                        .scaleEffect(phase.isIdentity ? 1.0 : 0.9)
                                }
                                .id(index)
                                .onTapGesture {
                                    viewModel.navigateToGameDetails(game: game)
                                }
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollPosition(id: $scrollID)
                .scrollTargetBehavior(.paging)
                
                CustomPageIndicator(
                    numberOfPages: viewModel.featuredGames.count,
                    scrollID: $scrollID
                )
            }
        }
    }
    
    private var newsSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 10) {
                Image("news")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text("TOP HEADLINES")
                    .font(.system(size: 20, weight: .black))
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            .background(Color.game)
            
            Divider()
                .background(Color.gray.opacity(0.3))
            
            LazyVStack(spacing: 0) {
                ForEach(Array(viewModel.news.enumerated()), id: \.element.id) { index, news in
                    if let url = URL(string: news.links.web.href) {
                            NewsItemView(
                                imageURL: news.images.first?.url ?? "",
                                title: news.description,
                                source: news.type,
                                time: news.published.toRelativeDate()
                            )
                            .onTapGesture {
                                selectedNewsURL = url
                            }
                        
                        if index < viewModel.news.count - 1 {
                            Divider()
                                .background(Color.gray.opacity(0.3))
                                .padding(.horizontal, 20)
                        }
                    }
                }
            }
            .background(Color.game)
        }
        .roundedCorners(10)
        .padding(.horizontal, 10)
    }
}
