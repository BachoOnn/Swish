//
//  DateFormatter + Extension.swift
//  Common
//
//  Created by Bacho on 17.01.26.
//

import Foundation

public extension DateFormatter {
    static let apiDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()

    /// Uses Tbilisi timezone for display
    static let displayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, d MMMM"
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeZone = TimeZone(identifier: "Asia/Tbilisi")
        return formatter
    }()
    
    /// Uses Tbilisi timezone for display
    static let displayTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        formatter.timeZone = TimeZone(identifier: "Asia/Tbilisi")
        return formatter
    }()
    
    /// Converts a Date to calendar date string  for use
    static func calendarDateString(from date: Date) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        
        guard let year = components.year,
              let month = components.month,
              let day = components.day else {
            return apiDateFormatter.string(from: date)
        }
        
        return String(format: "%04d-%02d-%02d", year, month, day)
    }
}
