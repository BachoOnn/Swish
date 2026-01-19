////
////  StatsView.swift
////  Main
////
////  Created by Bacho on 15.01.26.
////
//
//import SwiftUI
//import Common
//import Helpers
//
//struct StatsView: View {
//    
//    let player: PlayerSeasonAverages
//    
//    var body: some View {
//        ScrollView(showsIndicators: false) {
//            VStack {
//                HStack {
//                    Text("On Court")
//                        .font(.system(size: 20, weight: .heavy))
//                    Spacer()
//                }
//                .padding()
//                
//                HStack {
//                    
//                    CustomContainer(width: 120, height: 100) {
//                            VStack(spacing: 10) {
//                                Text("\(player.stats.gp)")
//                                    .font(.system(size: 30))
//                                
//                                Text("Games Played")
//                                    .lineLimit(2)
//                                    .multilineTextAlignment(.center)
//                                    .padding(.horizontal, 30)
//                                    .font(.system(size: 14))
//                            }
//                        }
//                    CustomContainer(width: 120, height: 100) {
//                            VStack(spacing: 10) {
//                                Text("\(player.stats.w ?? 0)")
//                                    .font(.system(size: 30))
//                                
//                                Text("Games Won")
//                                    .lineLimit(2)
//                                    .multilineTextAlignment(.center)
//                                    .padding(.horizontal, 30)
//                                    .font(.system(size: 14))
//
//                            }
//                        }
//                    CustomContainer(width: 120, height: 100) {
//                            VStack(spacing: 10) {
//                                Text("\(player.stats.mpg)")
//                                    .font(.system(size: 30))
//                                
//                                Text("Avg. Minutes Played")
//                                    .lineLimit(2)
//                                    .multilineTextAlignment(.center)
//                                    .padding(.horizontal, 10)
//                                    .font(.system(size: 14))
//
//                            }
//                        }
//                }
//                
//                HStack {
//                    Text("Key Stats")
//                        .font(.system(size: 20, weight: .heavy))
//                    Spacer()
//                }
//                .padding()
//                
//                HStack(spacing: 20) {
//                    CustomContainer(width: 195, height: 240) {
//                        CustomChart(
//                            centerValue: player.stats.ppg,
//                            chartData: [
//                                ChartData(category: "2-Points", value: (player.stats.fgm - player.stats.fg3m) * 2, color: .gray),
//                                ChartData(category: "3-Points", value: player.stats.fg3m * 3, color: .red),
//                                ChartData(category: "Free Throws", value: player.stats.ftm, color: .gray.opacity(0.5))
//                            ],
//                            text: "Points Per Game"
//                        )
//                    }
//                    
//                    VStack(spacing: 20) {
//                        CustomContainer(width: 160, height: 110) {
//                            VStack(spacing: 10) {
//                                Text("\(player.stats.rbpg)")
//                                    .font(.system(size: 30))
//                                
//                                Text("Rebound Per game")
//                                    .lineLimit(2)
//                                    .multilineTextAlignment(.center)
//                                    .padding(.horizontal, 30)
//                                    .font(.system(size: 14))
//                                
//                            }
//                        }
//                        
//                        CustomContainer(width: 160, height: 110) {
//                            VStack(spacing: 10) {
//                                Text("\(player.stats.apg)")
//                                    .font(.system(size: 30))
//                                
//                                Text("Assist Per Game")
//                                    .lineLimit(2)
//                                    .multilineTextAlignment(.center)
//                                    .padding(.horizontal, 30)
//                                    .font(.system(size: 14))
//                                
//                            }
//                        }
//                    }
//                    
//                }
//                
//                HStack {
//                    
//                    CustomContainer(width: 120, height: 100) {
//                        VStack(spacing: 10) {
//                            Text("\(player.stats.spg)")
//                                .font(.system(size: 30))
//                            
//                            Text("Steal Per Game")
//                                .lineLimit(2)
//                                .multilineTextAlignment(.center)
//                                .padding(.horizontal, 30)
//                                .font(.system(size: 14))
//                        }
//                    }
//                    CustomContainer(width: 120, height: 100) {
//                        VStack(spacing: 10) {
//                            Text("\(player.stats.bpg)")
//                                .font(.system(size: 30))
//                            
//                            Text("Block Per Game")
//                                .lineLimit(2)
//                                .multilineTextAlignment(.center)
//                                .padding(.horizontal, 25)
//                                .font(.system(size: 14))
//                            
//                        }
//                    }
//                    CustomContainer(width: 120, height: 100) {
//                        VStack(spacing: 10) {
//                            Text("\(player.stats.tovpg)")
//                                .font(.system(size: 30))
//                            
//                            Text("Turnover Per Game")
//                                .lineLimit(2)
//                                .multilineTextAlignment(.center)
//                                .padding(.horizontal, 10)
//                                .font(.system(size: 14))
//                        }
//                    }
//                }
//                .padding(.top)
//                
//                HStack(spacing: 16) {
//                    CustomContainer(width: 180, height: 200) {
//                        CustomGaugeChart(
//                            title: "2-Point Shots",
//                            value: player.stats.fgPct,
//                            color: .gray
//                        )
//                    }
//                    
//                    CustomContainer(width: 180, height: 200) {
//                        CustomGaugeChart(
//                            title: "3-Point Shots",
//                            value: player.stats.fg3Pct,
//                            color: .red
//                        )
//                    }
//                }
//                .padding(.top)
//                
//                HStack(spacing: 16) {
//                    CustomContainer(width: 180, height: 200) {
//                        CustomGaugeChart(
//                            title: "Free Throws",
//                            value: player.stats.ftPct,
//                            color: .gray.opacity(0.3)
//                        )
//                    }
//                    
//                    CustomContainer(width: 180, height: 200) {
//                        CustomGaugeChart(
//                            title: "Win Ratio",
//                            value: player.stats.wPct ?? 0,
//                            color: .green
//                        )
//                    }
//                }
//                .padding(.top)
//                
//                HStack {
//                    Text("League Ranking")
//                        .font(.system(size: 20, weight: .heavy))
//                    Spacer()
//                }
//                .padding()
//                
//                VStack(spacing: 12) {
//                    RankingRow(statName: "Points", rank: player.stats.ptsRank ?? 0, icon: "basketball.fill")
//                    RankingRow(statName: "Assists", rank: player.stats.astRank ?? 0, icon: "a")
//                    RankingRow(statName: "Rebounds", rank: player.stats.rebRank ?? 0, icon: "r.circle.fill")
//                    RankingRow(statName: "Steals", rank: player.stats.stlRank ?? 0, icon: "hand.raised.fill")
//                    RankingRow(statName: "Blocks", rank: player.stats.blkRank ?? 0, icon: "nosign")
//                }
//                .padding(.horizontal)
//            }
//        }
//    }
//}
//
//#Preview {
//    StatsView(player: .lebronMock)
//}
