//
//  TeamView + Extension.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import SwiftUI
import Common

extension TeamView {
    
    var headerSection: some View {
        HStack {
            
            Spacer()
            
            Text("Add Favorites")
                .font(.headline)
            Button {
                viewModel.toggleFavorite()
            } label: {
                Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 25, height: 20)
                    .tint(.primary)
            }
        }
        .padding(.horizontal)
    }
    
    var teamInfoSection: some View {
        VStack(spacing: 12) {
            Image(viewModel.team.team.name, bundle: .common)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text(viewModel.team.team.fullName)
                .font(.system(size: 28, weight: .bold))
            
            HStack(spacing: 20) {
                HStack(spacing: 6) {
                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                    Text("\(viewModel.team.team.conference) • \(viewModel.team.team.division)")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                }
            }
        }
        .padding()
    }
    
    var recordSection: some View {
        HStack(spacing: 16) {
            CustomContainer(width: 110, height: 100) {
                VStack(spacing: 10) {
                    Text("\(viewModel.team.stats.w)")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundStyle(.green)
                    
                    Text("Wins")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
            }
            
            CustomContainer(width: 110, height: 100) {
                VStack(spacing: 10) {
                    Text("\(viewModel.team.stats.l)")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundStyle(.red)
                    
                    Text("Losses")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
            }
            
            CustomContainer(width: 110, height: 100) {
                VStack(spacing: 10) {
                    Text(viewModel.team.stats.winPercentage)
                        .font(.system(size: 30))
                    
                    Text("Win %")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
            }
        }
        .padding(.horizontal, 5)
    }
    
    var keyStatsSection: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Season Averages")
                    .font(.system(size: 20, weight: .heavy))
                Spacer()
            }
            .padding(.horizontal)
            
            VStack(spacing: 12) {
                HStack(spacing: 16) {
                    CustomContainer(width: 110, height: 100) {
                        VStack(spacing: 10) {
                            Text(viewModel.team.stats.ppg)
                                .font(.system(size: 30, weight: .regular))
                            
                            Text("PPG")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    CustomContainer(width: 110, height: 100) {
                        VStack(spacing: 10) {
                            Text(viewModel.team.stats.rpg)
                                .font(.system(size: 30, weight: .regular))
                            
                            Text("RPG")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    CustomContainer(width: 110, height: 100) {
                        VStack(spacing: 10) {
                            Text(viewModel.team.stats.apg)
                                .font(.system(size: 30, weight: .regular))
                            
                            Text("APG")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                    }
                }

                HStack(spacing: 16) {
                    CustomContainer(width: 110, height: 100) {
                        VStack(spacing: 10) {
                            Text(String(format: "%.1f", viewModel.team.stats.stl))
                                .font(.system(size: 30, weight: .regular))
                            
                            Text("SPG")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    CustomContainer(width: 110, height: 100) {
                        VStack(spacing: 10) {
                            Text(String(format: "%.1f", viewModel.team.stats.blk))
                                .font(.system(size: 30, weight: .regular))
                            
                            Text("BPG")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    CustomContainer(width: 110, height: 100) {
                        VStack(spacing: 10) {
                            Text(String(format: "%.1f", viewModel.team.stats.tov))
                                .font(.system(size: 30, weight: .regular))
                            
                            Text("TOV")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    var shootingChartsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Shooting Breakdown")
                    .font(.system(size: 20, weight: .heavy))
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    CustomContainer(width: 200, height: 250) {
                        CustomChart(
                            centerValue: viewModel.team.stats.ppg,
                            chartData: [
                                ChartData(
                                    category: "2-Points",
                                    value: (viewModel.team.stats.fgm - viewModel.team.stats.fg3m) * 2,
                                    color: .gray
                                ),
                                ChartData(
                                    category: "3-Points",
                                    value: viewModel.team.stats.fg3m * 3,
                                    color: .red
                                ),
                                ChartData(
                                    category: "Free Throws",
                                    value: viewModel.team.stats.ftm,
                                    color: .gray.opacity(0.5)
                                )
                            ],
                            text: "Points Per Game"
                        )
                    }
                    
                    CustomContainer(width: 200, height: 250) {
                        CustomGaugeChart(
                            title: "Field Goal %",
                            value: viewModel.team.stats.fgPct,
                            color: .gray
                        )
                    }
                    
                    CustomContainer(width: 200, height: 250) {
                        CustomGaugeChart(
                            title: "3-Point %",
                            value: viewModel.team.stats.fg3Pct,
                            color: .red
                        )
                    }
                    
                    CustomContainer(width: 200, height: 250) {
                        CustomGaugeChart(
                            title: "Free Throw %",
                            value: viewModel.team.stats.ftPct,
                            color: .gray.opacity(0.3)
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    var leagueRankingsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("League Rankings")
                    .font(.system(size: 20, weight: .heavy))
                Spacer()
            }
            .padding(.horizontal)
            
            VStack(spacing: 8) {
                RankingRow(
                    statName: "Points",
                    rank: viewModel.team.stats.ptsRank,
                    icon: "basketball.fill",
                )
                
                RankingRow(
                    statName: "Assists",
                    rank: viewModel.team.stats.astRank,
                    icon: "a",
                )
                
                RankingRow(
                    statName: "Rebounds",
                    rank: viewModel.team.stats.rebRank,
                    icon: "r.circle.fill",
                )
                
                RankingRow(
                    statName: "Steals",
                    rank: viewModel.team.stats.stlRank,
                    icon: "hand.raised.fill",
                )
                
                RankingRow(
                    statName: "Blocks",
                    rank: viewModel.team.stats.blkRank,
                    icon: "nosign",
                )
                
                RankingRow(
                    statName: "Win Percentage",
                    rank: viewModel.team.stats.wPctRank,
                    icon: "trophy.fill",
                )
            }
            .padding(.horizontal)
        }
    }
}
