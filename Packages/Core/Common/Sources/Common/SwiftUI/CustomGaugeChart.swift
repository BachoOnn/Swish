//
//  CustomGaugeChart.swift
//  Common
//
//  Created by Bacho on 15.01.26.
//

import SwiftUI
import Charts

public struct CustomGaugeChart: View {
    let title: String
    let value: Double
    let color: Color
    
    public init(title: String, value: Double, color: Color) {
        self.title = title
        self.value = value
        self.color = color
    }
    
    public var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .padding(.horizontal)
            
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.75)
                    .stroke(color.opacity(0.3), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .frame(width: 120, height: 120)
                    .rotationEffect(.degrees(135))
                
                Circle()
                    .trim(from: 0, to: 0.75 * value)
                    .stroke(color, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .frame(width: 120, height: 120)
                    .rotationEffect(.degrees(135))
                
                Text("\(String(format: "%.3f", value))%")
                    .font(.system(size: 20, weight: .bold))
            }
        }
        .padding(20)
    }
}
