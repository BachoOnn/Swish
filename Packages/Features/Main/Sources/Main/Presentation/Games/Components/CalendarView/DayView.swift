//
//  DayView.swift
//  Swish
//
//  Created by Bacho on 11.01.26.
//

import SwiftUI

struct DayView: View {
    
    let date: Date
    @Binding var selectedDate: Date?
    
    var body: some View {
        VStack(spacing:12){
            Text(Calendar.dayNumber(from: date))
                .background{
                    if date == selectedDate{
                        Image(systemName: "basketball.fill")
                            .font(.system(size: 26))
                            .foregroundStyle(.indigo)
                            .opacity(0.7)
                    }else if Calendar.current.isDateInToday(date){
                        Image(systemName: "basketball")
                            .font(.system(size: 26))
                            .foregroundStyle(.gray)
                            .opacity(0.5)
                    }
                }
        }
        .foregroundStyle(Color(.label))
        .font(.system(.body, design: .rounded, weight: selectedDate == date ? .bold : .medium))
        .onTapGesture {
            withAnimation(.easeInOut) {
                selectedDate = date
            }
        }
    }
}

#Preview {
    DayView(date: .now, selectedDate: .constant(nil))
}
