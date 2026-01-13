//
//  Week.swift
//  Swish
//
//  Created by Bacho on 11.01.26.
//

import Foundation

public struct Week: Hashable, Identifiable {
    public let id: String
    public let days: [Date]
    public let order: Order
    
    public init(days: [Date], order: Order) {
        self.id = Calendar.weekAndYear(from: days.last ?? .now)
        self.days = days
        self.order = order
    }
    
    public enum Order {
        case previous, current, next
    }
}

extension Week: Equatable {
    public static func == (lhs: Week, rhs: Week) -> Bool {
        lhs.id == rhs.id
    }
}

public extension Week {
    static let current = Week(days: Calendar.currentWeek(from: Calendar.nearestMonday(from: .now)), order: .current)
}
