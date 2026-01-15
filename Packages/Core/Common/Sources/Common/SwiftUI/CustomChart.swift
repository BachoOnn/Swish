//
//  CustomChart.swift
//  Common
//
//  Created by Bacho on 15.01.26.
//

import SwiftUI
import Charts

public struct CustomChart: View {
    let centerValue: String
    let chartData: [ChartData]
    let text: String
    
    public init(centerValue: String, chartData: [ChartData], text: String) {
        self.centerValue = centerValue
        self.chartData = chartData
        self.text = text
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            
            Text(text)
                .font(.system(size: 14, weight: .semibold))
            ZStack {
                Chart(chartData) { item in
                    SectorMark(
                        angle: .value("Value", item.value),
                        innerRadius: .ratio(0.93),
                        angularInset: 2
                    )
                    .foregroundStyle(item.color)
                }
                .frame(width: 140, height: 140)
                
                Text(centerValue)
                    .font(.system(size: 30, weight: .bold))
            }
            
            VStack(spacing: 4) {
                ForEach(chartData) { item in
                    HStack(spacing: 8) {
                        Circle()
                            .fill(item.color)
                            .frame(width: 8, height: 8)
                        
                        Text(item.category)
                            .font(.system(size: 10))
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                        Text(String(format: "%.1f", item.value))
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(item.color)
                    }
                }
            }
        }
        .padding(24)
    }
}

// MARK: - Model
public struct ChartData: Identifiable {
    public let id = UUID()
    public let category: String
    public let value: Double
    public let color: Color
    
    public init(category: String, value: Double, color: Color) {
        self.category = category
        self.value = value
        self.color = color
    }
}
