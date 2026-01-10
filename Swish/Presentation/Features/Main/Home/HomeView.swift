//
//  HomeView.swift
//  Auth
//
//  Created by Bacho on 01.01.26.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    @State private var scrollID: Int?
    
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
                    VStack(alignment: .leading, spacing: 50) {
                        gameCardSection
                        
                        newsSection
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
    
}

#Preview {
    HomeView(viewModel: HomeViewModel(coordinator: MainCoordinator()))
}

extension HomeView {
    private var gameCardSection: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(Array(viewModel.games.enumerated()), id: \.element.id) { index, game in
                        GameCardView(
                            homeTeam: game.homeTeam.name,
                            homeAbb: game.homeTeam.abbreviation,
                            visitorTeam: game.visitorTeam.name,
                            visitorAbb: game.visitorTeam.abbreviation
                        )
                        .padding(.horizontal, 10)
                        .containerRelativeFrame(.horizontal)
                        .scrollTransition(.animated, axis: .horizontal) { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.6)
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.9)
                            
                        }
                        .id(index)
                        .onTapGesture {
                            print("Tapped game: \(game.homeTeam.name) vs \(game.visitorTeam.name)")
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition(id: $scrollID)
            .scrollTargetBehavior(.paging)
            
            CustomPageIndicator(
                numberOfPages: viewModel.games.count,
                scrollID: $scrollID
            )
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
                ForEach(0..<5) { index in
                    NewsItemView(
                        imageURL: "placeholder-news",
                        title: "Lakers dominate in overtime thriller against Warriors",
                        source: "ESPN",
                        timeAgo: "2h ago"
                    )
                    .onTapGesture {
                        print(index.description)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 12)
                    .background(Color.game)
                    
                    if index < 4 {
                        Divider()
                            .background(Color.gray.opacity(0.3))
                            .padding(.horizontal, 20)
                    }
                }
            }
            .background(Color.game)
        }
        .roundedCorners(10)
        .padding(.horizontal, 10)
    }
}
