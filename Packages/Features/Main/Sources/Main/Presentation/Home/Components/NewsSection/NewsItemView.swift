//
//  NewsItemView.swift
//  Swish
//
//  Created by Bacho on 09.01.26.
//

import SwiftUI
import Common
import Helpers

struct NewsItemView: View {
    let imageURL: String
    let title: String
    let source: String
    let time: String
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: imageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Image(systemName: "basketball.circle.fill")
                        .foregroundStyle(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 60, height: 60)
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
                    
                    Text(time)
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
