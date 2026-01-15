//
//  ProfileSectionView.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import SwiftUI
import Common

struct ProfileSectionView: View {
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
                                    Text("6-9".heightInCentimeters())
                                        .font(.system(size: 24, weight: .semibold))
                                    
                                    Text("6-9".formattedHeight())
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
                                    Text("250".weightInKilograms())
                                        .font(.system(size: 24, weight: .semibold))
                                    
                                    Text("250 lbs")
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
                                    Text("USA")
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
                                    Text("F")
                                        .font(.system(size: 24, weight: .semibold))
                                }
                            }
                        }
                    
                }
                .padding(.horizontal, 5)
                
                VStack(spacing: 100) {
                    Text("Some Bio here")
                    Text("Some Bio here")
                    Text("Some Bio here")
                    Text("Some Bio here")
                    Text("Some Bio here")
                    Text("Some Bio here")
                }
                .padding()
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileSectionView()
}
