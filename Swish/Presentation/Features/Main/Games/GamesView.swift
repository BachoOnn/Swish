//
//  GamesView.swift
//  Swish
//
//  Created by Bacho on 01.01.26.
//

import SwiftUI

struct GamesView: View {
    
    @State var selection: Date?
    @State var title: String = Calendar.monthAndYear(from: .now)
    @State var focusedWeek: Week = .current
    @State var calendarType: CalendarType = .week
    @State var isDragging: Bool = false
    
    @State var dragProgress: CGFloat = .zero
    @State var initialDragOffset: CGFloat? = nil
    @State var verticalDragOffset: CGFloat = .zero
    
    var symbols = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            VStack(spacing: 1) {
                headerSection
                    .ignoresSafeArea()
                    .frame(height: 65)
                
                calendarSection
                
                GamesCollectionView(selectedDate: selection)
                
                Spacer()
            }
        }
    }
}


#Preview {
    GamesView()
}
