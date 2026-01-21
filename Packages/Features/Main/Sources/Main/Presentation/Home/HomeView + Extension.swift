//
//  HomeView + Extension.swift
//  Main
//
//  Created by Bacho on 18.01.26.
//

import SwiftUI
import Common

extension HomeView {
    var gameCardSection: some View {
        VStack {
            if viewModel.isGamesLoading {
                CustomLoadingView(message: "Loading Today's Games...")
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
    
    var newsSection: some View {
        VStack(spacing: 0) {
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
            
            if viewModel.isNewsLoading {
                VStack(spacing: 26) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1)
                    
                    Text("Loading today's news...")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                .frame(height: 200)
                .padding(.vertical)
            } else if viewModel.news.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "newspaper.fill")
                        .font(.system(size: 40))
                        .foregroundColor(.gray)
                    Text("No news today")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(height: 200)
                
            } else {
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
        }
        .roundedCorners(10)
        .padding(.horizontal, 10)
    }
}
