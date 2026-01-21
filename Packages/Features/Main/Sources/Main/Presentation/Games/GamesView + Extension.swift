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
                    Text(viewModel.title).font(.title3.bold())
                }
                .padding(.vertical, 13)
                .padding(.horizontal)
                
                HStack {
                    ForEach(viewModel.symbols, id: \.self) { symbol in
                        Text(symbol)
                            .fontWeight(.regular)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.secondary)
                        
                        if symbol != viewModel.symbols.last {
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal)
                
                VStack {
                    switch viewModel.calendarType {
                    case .week :
                        if #available(iOS 18.0, *) {
                            WeekCalendarView(
                                $viewModel.title,
                                selection: $viewModel.selection,
                                focused: $viewModel.focusedWeek,
                                isDragging: viewModel.isDragging
                            )
                        } else {
                        }
                    case .month:
                        if #available(iOS 18.0, *) {
                            MonthCalendarView(
                                $viewModel.title,
                                selection: $viewModel.selection,
                                focused: $viewModel.focusedWeek,
                                isDragging: viewModel.isDragging,
                                dragProgress: viewModel.dragProgress
                            )
                        } else {
                        }
                    }
                }
                
                .frame(height: Constants.dayHeight + viewModel.verticalDragOffset)
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
            
            .onChange(of: viewModel.selection) { _, newValue in
                guard let newValue else { return }
                
                viewModel.title = Calendar.monthAndYear(from: newValue)
            }
            
            .gesture(
                DragGesture(minimumDistance: .zero)
                    .onChanged { value in
                        viewModel.isDragging = true
                        viewModel.calendarType = viewModel.verticalDragOffset == 0 ? .week : .month
                        
                        if viewModel.initialDragOffset == nil {
                            viewModel.initialDragOffset = viewModel.verticalDragOffset
                        }
                        
                        viewModel.verticalDragOffset = max(
                            .zero,
                            min(
                                (viewModel.initialDragOffset ?? 0) + value.translation.height,
                                Constants.monthHeight - Constants.dayHeight
                            )
                        )
                        
                        viewModel.dragProgress = viewModel.verticalDragOffset / (Constants.monthHeight - Constants.dayHeight)
                    }
                    .onEnded { value in
                        viewModel.isDragging = false
                        viewModel.initialDragOffset = nil
                        
                        withAnimation {
                            switch viewModel.calendarType {
                            case .week:
                                if viewModel.verticalDragOffset > Constants.monthHeight/3 {
                                    viewModel.verticalDragOffset = Constants.monthHeight - Constants.dayHeight
                                } else {
                                    viewModel.verticalDragOffset = 0
                                }
                            case .month:
                                if viewModel.verticalDragOffset < Constants.monthHeight/3 {
                                    viewModel.verticalDragOffset = 0
                                } else {
                                    viewModel.verticalDragOffset = Constants.monthHeight - Constants.dayHeight
                                }
                            }
                            
                            viewModel.dragProgress = viewModel.verticalDragOffset / (Constants.monthHeight - Constants.dayHeight)
                        } completion: {
                            viewModel.calendarType = viewModel.verticalDragOffset == 0 ? .week : .month
                        }
                    }
            )
        }
    }
}
