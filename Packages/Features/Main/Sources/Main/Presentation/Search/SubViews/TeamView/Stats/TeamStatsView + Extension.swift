//
//  TeamStatsView + Extension.swift
//  Main
//
//  Created by Bacho on 23.01.26.
//

import SwiftUI
import Common
import TeamDomain

extension TeamStatsView {
    
    func mainStatsContent(stats: TeamSeasonStats) -> some View {
        ScrollView {
            VStack(spacing: 16) {
                recordSection(stats: stats)
                keyStatsSection(stats: stats)
                shootingChartsSection(stats: stats)
                leagueRankingsSection(stats: stats)
            }
        }
        .scrollIndicators(.hidden)
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
                        .foregroundStyle(.secondary)
                }
            }
            
            CustomContainer(width: 110, height: 110) {
                VStack(spacing: 10) {
                    Text("\(stats.l)")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundStyle(.red)
                    
                    Text("Losses")
                        .font(.system(size: 14))
                        .foregroundStyle(.secondary)
                }
            }
            
            CustomContainer(width: 110, height: 110) {
                VStack(spacing: 10) {
                    Text(stats.winPercentage)
                        .font(.system(size: 26))
                    
                    Text("Win %")
                        .font(.system(size: 14))
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.horizontal, 5)
        .padding(.top)
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
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    CustomContainer(width: 110, height: 110) {
                        VStack(spacing: 10) {
                            Text(stats.rpg)
                                .font(.system(size: 26, weight: .regular))
                            
                            Text("RPG")
                                .font(.system(size: 14))
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    CustomContainer(width: 110, height: 110) {
                        VStack(spacing: 10) {
                            Text(stats.apg)
                                .font(.system(size: 26, weight: .regular))
                            
                            Text("APG")
                                .font(.system(size: 14))
                                .foregroundStyle(.secondary)
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
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    CustomContainer(width: 110, height: 110) {
                        VStack(spacing: 10) {
                            Text(String(format: "%.1f", stats.blk))
                                .font(.system(size: 26, weight: .regular))
                            
                            Text("BPG")
                                .font(.system(size: 14))
                                .foregroundStyle(.secondary)
                        }
                    }
                    
                    CustomContainer(width: 110, height: 110) {
                        VStack(spacing: 10) {
                            Text(String(format: "%.1f", stats.tov))
                                .font(.system(size: 26, weight: .regular))
                            
                            Text("TOV")
                                .font(.system(size: 14))
                                .foregroundStyle(.secondary)
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
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    CustomContainer(width: 200, height: 250) {
                        CustomChart(
                            centerValue: stats.ppg,
                            chartData: [
                                ChartData(
                                    category: "2-Points",
                                    value: (stats.fgm - stats.fg3m) * 2,
                                    color: .secondary
                                ),
                                ChartData(
                                    category: "3-Points",
                                    value: stats.fg3m * 3,
                                    color: .red
                                ),
                                ChartData(
                                    category: "Free Throws",
                                    value: stats.ftm,
                                    color: .secondary.opacity(0.5)
                                )
                            ],
                            text: "Points Per Game"
                        )
                    }
                    
                    CustomContainer(width: 200, height: 250) {
                        CustomGaugeChart(
                            title: "Field Goal %",
                            value: stats.fgPct,
                            color: .secondary
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
                            color: .secondary.opacity(0.3)
                        )
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.hidden)
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
}