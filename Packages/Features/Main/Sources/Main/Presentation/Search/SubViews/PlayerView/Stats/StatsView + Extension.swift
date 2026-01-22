//
//  StatsView + Extension.swift
//  Main
//
//  Created by Bacho on 20.01.26.
//

import SwiftUI
import Common

extension StatsView {
    var mainStatsContent: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("On Court")
                        .font(.system(size: 20, weight: .heavy))
                    Spacer()
                }
                .padding()
                
                HStack {
                    
                    CustomContainer(width: 120, height: 100) {
                        VStack(spacing: 10) {
                            Text("\(viewModel.playerStats?.gp ?? 0)")
                                .font(.system(size: 30))
                            
                            Text("Games Played")
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 30)
                                .font(.system(size: 14))
                        }
                    }
                    CustomContainer(width: 120, height: 100) {
                        VStack(spacing: 10) {
                            Text("\(viewModel.playerStats?.w ?? 0)")
                                .font(.system(size: 30))
                            
                            Text("Games Won")
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 30)
                                .font(.system(size: 14))
                            
                        }
                    }
                    CustomContainer(width: 120, height: 100) {
                        VStack(spacing: 10) {
                            Text("\(viewModel.playerStats?.mpg ?? "0")")
                                .font(.system(size: 30))
                            
                            Text("Avg. Minutes Played")
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 10)
                                .font(.system(size: 14))
                            
                        }
                    }
                }
                
                HStack {
                    Text("Key Stats")
                        .font(.system(size: 20, weight: .heavy))
                    Spacer()
                }
                .padding()
                
                HStack(spacing: 20) {
                    CustomContainer(width: 195, height: 240) {
                        CustomChart(
                            centerValue: viewModel.playerStats?.ppg ?? "0",
                            chartData: [
                                ChartData(category: "2-Points", value: ((viewModel.playerStats?.fgm ?? 0) - (viewModel.playerStats?.fg3m ?? 0)) * 2, color: .gray),
                                ChartData(category: "3-Points", value: (viewModel.playerStats?.fg3m ?? 0) * 3, color: .red),
                                ChartData(category: "Free Throws", value: viewModel.playerStats?.ftm ?? 0, color: .gray.opacity(0.5))
                            ],
                            text: "Points Per Game"
                        )
                    }
                    
                    VStack(spacing: 20) {
                        CustomContainer(width: 160, height: 110) {
                            VStack(spacing: 10) {
                                Text("\(viewModel.playerStats?.rpg ?? "0")")
                                    .font(.system(size: 30))
                                
                                Text("Rebound Per game")
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 30)
                                    .font(.system(size: 14))
                                
                            }
                        }
                        
                        CustomContainer(width: 160, height: 110) {
                            VStack(spacing: 10) {
                                Text("\(viewModel.playerStats?.apg ?? "0")")
                                    .font(.system(size: 30))
                                
                                Text("Assist Per Game")
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 30)
                                    .font(.system(size: 14))
                                
                            }
                        }
                    }
                    
                }
                
                HStack {
                    CustomContainer(width: 120, height: 100) {
                        VStack(spacing: 10) {
                            Text("\(viewModel.playerStats?.spg ?? "0.0")")
                                .font(.system(size: 30))
                            
                            Text("Steal Per Game")
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 30)
                                .font(.system(size: 14))
                        }
                    }
                    CustomContainer(width: 120, height: 100) {
                        VStack(spacing: 10) {
                            Text("\(viewModel.playerStats?.bpg ?? "0.0")")
                                .font(.system(size: 30))
                            
                            Text("Block Per Game")
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 25)
                                .font(.system(size: 14))
                        }
                    }
                    CustomContainer(width: 120, height: 100) {
                        VStack(spacing: 10) {
                            Text("\(viewModel.playerStats?.topg ?? "0.0")")
                                .font(.system(size: 30))
                            
                            Text("Turnover Per Game")
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 10)
                                .font(.system(size: 14))
                        }
                    }
                }
                .padding(.top)
                
                HStack(spacing: 16) {
                    CustomContainer(width: 180, height: 200) {
                        CustomGaugeChart(
                            title: "2-Point Shots",
                            value: viewModel.playerStats?.fgPct ?? 0,
                            color: .gray
                        )
                    }
                    
                    CustomContainer(width: 180, height: 200) {
                        CustomGaugeChart(
                            title: "3-Point Shots",
                            value: viewModel.playerStats?.fg3Pct ?? 0,
                            color: .red
                        )
                    }
                }
                .padding(.top)
                
                HStack(spacing: 16) {
                    CustomContainer(width: 180, height: 200) {
                        CustomGaugeChart(
                            title: "Free Throws",
                            value: viewModel.playerStats?.ftPct ?? 0,
                            color: .gray.opacity(0.3)
                        )
                    }
                    
                    CustomContainer(width: 180, height: 200) {
                        CustomGaugeChart(
                            title: "Win Ratio",
                            value: viewModel.playerStats?.wPct ?? 0,
                            color: .green
                        )
                    }
                }
                .padding(.top)
                
                HStack {
                    Text("League Ranking")
                        .font(.system(size: 20, weight: .heavy))
                    Spacer()
                }
                .padding()
                
                VStack(spacing: 12) {
                    RankingRow(statName: "Points", rank: viewModel.playerStats?.ptsRank ?? 0, icon: "basketball.fill")
                    RankingRow(statName: "Assists", rank: viewModel.playerStats?.astRank ?? 0, icon: "a")
                    RankingRow(statName: "Rebounds", rank: viewModel.playerStats?.rebRank ?? 0, icon: "r.circle.fill")
                    RankingRow(statName: "Steals", rank: viewModel.playerStats?.stlRank ?? 0, icon: "hand.raised.fill")
                    RankingRow(statName: "Blocks", rank: viewModel.playerStats?.blkRank ?? 0, icon: "nosign")
                }
                .padding(.horizontal)
            }
        }
        .scrollIndicators(.hidden)
    }
}

