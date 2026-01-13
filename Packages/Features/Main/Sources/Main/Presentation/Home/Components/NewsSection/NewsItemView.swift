//
//  NewsItemView.swift
//  Swish
//
//  Created by Bacho on 09.01.26.
//

import SwiftUI

struct NewsItemView: View {
    let imageURL: String
    let title: String
    let source: String
    let timeAgo: String
    
    var body: some View {
        HStack(spacing: 12) {
            Image(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 80)
                .roundedCorners(8)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.system(size: 15, weight: .semibold))
                    .lineLimit(3)
                
                HStack(spacing: 4) {
                    Text(source)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(.gray)
                    
                    Text("•")
                        .foregroundStyle(.gray)
                    
                    Text(timeAgo)
                        .font(.system(size: 12))
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer(minLength: 0)
        }
        .padding(12)
        .background(Color.game)
        .roundedCorners(12)
    }
}
