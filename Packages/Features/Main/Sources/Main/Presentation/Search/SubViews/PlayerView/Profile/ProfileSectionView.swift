//
//  ProfileSectionView.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import SwiftUI
import Common
import PlayerDomain

struct ProfileSectionView: View {
    let playerData: Player
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack(spacing: 16) {
                    CustomContainer(
                        width: 180,
                        height: 80) {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Height")
                                    .font(.system(size: 18))
                                    .foregroundStyle(.gray)
                                
                                HStack(spacing: 20) {
                                    Text((playerData.height ?? "0-0").heightInCentimeters())
                                        .font(.system(size: 24, weight: .semibold))
                                    
                                    Text((playerData.height ?? "0-0").formattedHeight())
                                        .font(.system(size: 16))
                                        .offset(y: 2)
                                }
                            }
                        }
                    
                    CustomContainer(
                        width: 180,
                        height: 80) {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Weight")
                                    .font(.system(size: 18))
                                    .foregroundStyle(.gray)
                                
                                HStack(spacing: 20) {
                                    Text((playerData.weight ?? "0").weightInKilograms())
                                        .font(.system(size: 24, weight: .semibold))
                                    
                                    Text("\(playerData.weight ?? "0") lbs")
                                        .font(.system(size: 16))
                                        .offset(y: 2)
                                }
                            }
                        }
                }
                .padding(.vertical)
                .padding(.horizontal, 5)
                
                HStack(spacing: 16) {
                    CustomContainer(
                        width: 180,
                        height: 80) {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Country")
                                    .font(.system(size: 18))
                                    .foregroundStyle(.gray)
                                    .padding(.trailing, 80)
                                
                                HStack(spacing: 20) {
                                    Text(playerData.country ?? "N/A")
                                        .font(.system(size: 24, weight: .semibold))
                                }
                            }
                        }
                    
                    CustomContainer(
                        width: 180,
                        height: 80) {
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Position")
                                    .font(.system(size: 18))
                                    .foregroundStyle(.gray)
                                    .padding(.trailing, 80)
                                
                                HStack(spacing: 20) {
                                    Text(playerData.position)
                                        .font(.system(size: 24, weight: .semibold))
                                }
                            }
                        }
                }
                .padding(.horizontal, 5)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Bio")
                        .font(.system(size: 24, weight: .bold))
                        .padding(.horizontal, 5)
                    
                    CustomContainer(
                        width: 376,
                        height: 70) {
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Jersey Number")
                                        .font(.system(size: 16))
                                        .foregroundStyle(.gray)
                                    
                                    Text("#\(playerData.jerseyNumber ?? "0")")
                                        .font(.system(size: 24, weight: .semibold))
                                }
                                .padding(.horizontal)
                                
                                Spacer()
                            }
                        }
                    
                    CustomContainer(
                        width: 376,
                        height: 220) {
                            VStack(alignment: .leading, spacing: 16) {
                                HStack {
                                    Text("College")
                                        .font(.system(size: 16))
                                        .foregroundStyle(.gray)
                                        .frame(width: 100, alignment: .leading)
                                    
                                    Text(playerData.college ?? "N/A")
                                        .font(.system(size: 18, weight: .medium))
                                }
                                
                                Divider()
                                
                                HStack {
                                    Text("Draft Year")
                                        .font(.system(size: 16))
                                        .foregroundStyle(.gray)
                                        .frame(width: 100, alignment: .leading)
                                    
                                    Text("\(playerData.draftYear ?? 0)")
                                        .font(.system(size: 18, weight: .medium))
                                }
                                
                                Divider()
                                
                                HStack {
                                    Text("Draft Pick")
                                        .font(.system(size: 16))
                                        .foregroundStyle(.gray)
                                        .frame(width: 100, alignment: .leading)
                                    
                                    if let round = playerData.draftRound,
                                       let pick = playerData.draftNumber {
                                        Text("Round \(round), Pick \(pick)")
                                            .font(.system(size: 18, weight: .medium))
                                    } else {
                                        Text("Undrafted")
                                            .font(.system(size: 18, weight: .medium))
                                    }
                                }
                                
                                Divider()
                                
                                HStack {
                                    Text("Experience")
                                        .font(.system(size: 16))
                                        .foregroundStyle(.gray)
                                        .frame(width: 100, alignment: .leading)
                                    
                                    if let draftYear = playerData.draftYear {
                                        Text("\(Calendar.current.component(.year, from: Date()) - draftYear) Seasons")
                                            .font(.system(size: 18, weight: .medium))
                                    } else {
                                        Text("N/A")
                                            .font(.system(size: 18, weight: .medium))
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                }
                .padding(.horizontal, 5)
                .padding(.top, 24)
            }
        }
    }
}
