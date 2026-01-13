//
//  CustomElements.swift
//  Swish
//
//  Created by Bacho on 11.01.26.
//

import UIKit

public final class CustomElements {
    
    static func createSeparator() -> UIView {
        let separator = UIView()
        separator.backgroundColor = .darkGray
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return separator
    }
}
