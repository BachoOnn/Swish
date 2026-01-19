//
//  GamesView + Extension.swift
//  Swish
//
//  Created by Bacho on 11.01.26.
//

import SwiftUI

extension GamesView {
    var headerSection: some View {
        ZStack(alignment: .bottom) {
            Color(.systemBackground)
            VStack(spacing: 10) {
                HStack {
                    Text("GAMES")
                        .font(.system(size: 30, weight: .bold))
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                Divider()
                    .background(Color.gray)
            }
        }
    }
    
    var calendarSection: some View {
        ZStack(alignment: .top) {
            VStack {
                HStack {
                    Text(title).font(.title3.bold())
                }
                .padding(.vertical, 13)
                .padding(.horizontal)
                
                HStack {
                    ForEach(symbols, id: \.self) { symbol in
                        Text(symbol)
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.secondary)
                        
                        if symbol != symbols.last {
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal)
                
                VStack {
                    switch calendarType {
                    case .week :
                        if #available(iOS 18.0, *) {
                            WeekCalendarView(
                                $title,
                                selection: $selection,
                                focused: $focusedWeek,
                                isDragging: isDragging
                            )
                        } else {
                        }
                    case .month:
                        if #available(iOS 18.0, *) {
                            MonthCalendarView(
                                $title,
                                selection: $selection,
                                focused: $focusedWeek,
                                isDragging: isDragging,
                                dragProgress: dragProgress
                            )
                        } else {
                        }
                    }
                }
                
                .frame(height: Constants.dayHeight + verticalDragOffset)
                .clipped()
                
                if #available(iOS 18.0, *) {
                    Capsule()
                        .fill(.gray.mix(with: .black, by: 0.6))
                        .frame(width: 40, height: 4)
                        .padding(.bottom, 6)
                } else {
                }
            }
            .background(
                UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 26, bottomTrailing: 26))
                    .fill(Color(.systemBackground))
            )
            
            .onChange(of: selection) { _, newValue in
                guard let newValue else { return }
                
                title = Calendar.monthAndYear(from: newValue)
            }
            
            .gesture(
                DragGesture(minimumDistance: .zero)
                    .onChanged { value in
                        isDragging = true
                        calendarType = verticalDragOffset == 0 ? .week : .month
                        
                        if initialDragOffset == nil {
                            initialDragOffset = verticalDragOffset
                        }
                        
                        verticalDragOffset = max(
                            .zero,
                            min(
                                (initialDragOffset ?? 0) + value.translation.height,
                                Constants.monthHeight - Constants.dayHeight
                            )
                        )
                        
                        dragProgress = verticalDragOffset / (Constants.monthHeight - Constants.dayHeight)
                    }
                    .onEnded { value in
                        isDragging = false
                        initialDragOffset = nil
                        
                        withAnimation {
                            switch calendarType {
                            case .week:
                                if verticalDragOffset > Constants.monthHeight/3 {
                                    verticalDragOffset = Constants.monthHeight - Constants.dayHeight
                                } else {
                                    verticalDragOffset = 0
                                }
                            case .month:
                                if verticalDragOffset < Constants.monthHeight/3 {
                                    verticalDragOffset = 0
                                } else {
                                    verticalDragOffset = Constants.monthHeight - Constants.dayHeight
                                }
                            }
                            
                            dragProgress = verticalDragOffset / (Constants.monthHeight - Constants.dayHeight)
                        } completion: {
                            calendarType = verticalDragOffset == 0 ? .week : .month
                        }
                    }
            )
        }
    }
}
