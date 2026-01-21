//
//  TeamView + Extension.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import SwiftUI
import Common
import TeamDomain

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
            Image(viewModel.team.name)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text(viewModel.team.fullName)
                .font(.system(size: 28, weight: .bold))
            
            HStack(spacing: 20) {
                HStack(spacing: 6) {
                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                    Text("\(viewModel.team.conference) • \(viewModel.team.division)")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                }
            }
        }
        .padding()
    }
    
    func recordSection(stats: TeamSeasonStats) -> some View {
        HStack(spacing: 20) {
            CustomContainer(width: 110, height: 110) {
                VStack(spacing: 10) {
                    Text("\(stats.w)")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundStyle(.green)
                    
                    Text("Wins")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
            }
            
            CustomContainer(width: 110, height: 110) {
                VStack(spacing: 10) {
                    Text("\(stats.l)")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundStyle(.red)
                    
                    Text("Losses")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
            }
            
            CustomContainer(width: 110, height: 110) {
                VStack(spacing: 10) {
                    Text(stats.winPercentage)
                        .font(.system(size: 26))
                    
                    Text("Win %")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
            }
        }
        .padding(.horizontal, 5)
    }
    
    func keyStatsSection(stats: TeamSeasonStats) -> some View {
        VStack(spacing: 16) {
            HStack {
                Text("Season Averages")
                    .font(.system(size: 20, weight: .heavy))
                Spacer()
            }
            .padding(.horizontal)
            
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    CustomContainer(width: 110, height: 110) {
                        VStack(spacing: 10) {
                            Text(stats.ppg)
                                .font(.system(size: 26, weight: .regular))
                            
                            Text("PPG")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    CustomContainer(width: 110, height: 110) {
                        VStack(spacing: 10) {
                            Text(stats.rpg)
                                .font(.system(size: 26, weight: .regular))
                            
                            Text("RPG")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    CustomContainer(width: 110, height: 110) {
                        VStack(spacing: 10) {
                            Text(stats.apg)
                                .font(.system(size: 26, weight: .regular))
                            
                            Text("APG")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                    }
                }
                
                HStack(spacing: 20) {
                    CustomContainer(width: 110, height: 110) {
                        VStack(spacing: 10) {
                            Text(String(format: "%.1f", stats.stl))
                                .font(.system(size: 26, weight: .regular))
                            
                            Text("SPG")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    CustomContainer(width: 110, height: 110) {
                        VStack(spacing: 10) {
                            Text(String(format: "%.1f", stats.blk))
                                .font(.system(size: 26, weight: .regular))
                            
                            Text("BPG")
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                    }
                    
                    CustomContainer(width: 110, height: 110) {
                        VStack(spacing: 10) {
                            Text(String(format: "%.1f", stats.tov))
                                .font(.system(size: 26, weight: .regular))
                            
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
    
    func shootingChartsSection(stats: TeamSeasonStats) -> some View {
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
                            centerValue: stats.ppg,
                            chartData: [
                                ChartData(
                                    category: "2-Points",
                                    value: (stats.fgm - stats.fg3m) * 2,
                                    color: .gray
                                ),
                                ChartData(
                                    category: "3-Points",
                                    value: stats.fg3m * 3,
                                    color: .red
                                ),
                                ChartData(
                                    category: "Free Throws",
                                    value: stats.ftm,
                                    color: .gray.opacity(0.5)
                                )
                            ],
                            text: "Points Per Game"
                        )
                    }
                    
                    CustomContainer(width: 200, height: 250) {
                        CustomGaugeChart(
                            title: "Field Goal %",
                            value: stats.fgPct,
                            color: .gray
                        )
                    }
                    
                    CustomContainer(width: 200, height: 250) {
                        CustomGaugeChart(
                            title: "3-Point %",
                            value: stats.fg3Pct,
                            color: .red
                        )
                    }
                    
                    CustomContainer(width: 200, height: 250) {
                        CustomGaugeChart(
                            title: "Free Throw %",
                            value: stats.ftPct,
                            color: .gray.opacity(0.3)
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    func leagueRankingsSection(stats: TeamSeasonStats) -> some View {
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
                    rank: stats.ptsRank,
                    icon: "basketball.fill"
                )
                
                RankingRow(
                    statName: "Assists",
                    rank: stats.astRank,
                    icon: "a"
                )
                
                RankingRow(
                    statName: "Rebounds",
                    rank: stats.rebRank,
                    icon: "r.circle.fill"
                )
                
                RankingRow(
                    statName: "Steals",
                    rank: stats.stlRank,
                    icon: "hand.raised.fill"
                )
                
                RankingRow(
                    statName: "Blocks",
                    rank: stats.blkRank,
                    icon: "nosign"
                )
                
                RankingRow(
                    statName: "Win Percentage",
                    rank: stats.wPctRank,
                    icon: "trophy.fill"
                )
            }
            .padding(.horizontal)
        }
    }
    
    func errorSection(message: String) -> some View {
        CustomErrorView(
            message: message,
            retryAction: viewModel.onLoad
        )
        .padding(.top, 40)
    }
    
    var placeholderSection: some View {
        VStack(spacing: 16) {
            Image(systemName: "chart.bar")
                .font(.system(size: 50))
                .foregroundColor(.gray)
            
            Text("No stats available")
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .padding(.top, 40)
    }
    
    var loadingSection: some View {
        VStack(spacing: 16) {
            CustomLoadingView(message: "Loading Team Statistics...")
        }
        .padding(.top, 40)
    }
}
