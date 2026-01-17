//
//  String + Extension.swift
//  Helpers
//
//  Created by Bacho on 15.01.26.
//

import Foundation

public extension String {
    
    /// Converts "6-2" → "188 cm"
    func heightInCentimeters() -> String {
        let parts = self.split(separator: "-")
        guard parts.count == 2,
              let feet = Double(parts[0]),
              let inches = Double(parts[1]) else {
            return "-- cm"
        }
        
        let totalInches = (feet * 12) + inches
        let centimeters = totalInches * 2.54
        return "\(Int(centimeters.rounded())) cm"
    }
    
    /// Converts "6-2" → "6'2 ft"
    func formattedHeight() -> String {
        let parts = self.split(separator: "-")
        guard parts.count == 2 else {
            return "-- ft"
        }
        
        return "\(parts[0])'\(parts[1]) ft"
    }
    
    /// Converts "185" → "84 kg"
    func weightInKilograms() -> String {
        // 'self' refers to the string value (e.g., "185")
        guard let lbs = Double(self) else {
            return "-- kg"
        }
        
        let kilograms = lbs * 0.453592
        return "\(Int(kilograms.rounded())) kg"
    }
    
    func toFormattedDate(format: String = "MMM d, yyyy") -> String {
        let isoFormatter = ISO8601DateFormatter()
        
        guard let date = isoFormatter.date(from: self) else {
            return self
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale.current
        
        return dateFormatter.string(from: date)
    }
    
    func toRelativeDate() -> String {
        let isoFormatter = ISO8601DateFormatter()
        
        guard let date = isoFormatter.date(from: self) else {
            return self
        }
        
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        
        return formatter.localizedString(for: date, relativeTo: Date())
    }
    
    func toTimeAgo() -> String {
        let isoFormatter = ISO8601DateFormatter()
        
        guard let date = isoFormatter.date(from: self) else {
            return self
        }
        
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        
        return formatter.localizedString(for: date, relativeTo: Date())
    }
    
    func toDate() -> Date? {
        let isoFormatter = ISO8601DateFormatter()
        return isoFormatter.date(from: self)
    }
    
    func toFormattedDateTime() -> String {
        let isoFormatter = ISO8601DateFormatter()
        
        guard let date = isoFormatter.date(from: self) else {
            return self
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy 'at' h:mm a"
        dateFormatter.locale = Locale.current
        
        return dateFormatter.string(from: date)
    }
}
