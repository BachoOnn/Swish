//
//  CustomPageIndicator.swift
//  Swish
//
//  Created by Bacho on 09.01.26.
//

import SwiftUI

struct CustomPageIndicator: View {
    let numberOfPages: Int
    @Binding var scrollID: Int?
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<numberOfPages, id: \.self) { indicator in
                let index = scrollID ?? 0
                Button {
                    withAnimation {
                        scrollID = indicator
                    }
                } label: {
                    if indicator == index {
                        Image("ball")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(Color(.label))
                            .frame(width: 12, height: 12)
                    } else {
                        Circle()
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 8, height: 8)
                    }
                }
            }
        }
    }
}
