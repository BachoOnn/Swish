//
//  UIColor + Extension.swift
//  Common
//
//  Created by Bacho on 13.01.26.
//

import UIKit

public extension UIColor {
    static var game: UIColor {
        return UIColor(named: "game", in: .module, compatibleWith: nil) ?? .systemCyan
    }
}
