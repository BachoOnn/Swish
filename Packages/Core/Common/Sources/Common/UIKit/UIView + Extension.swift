//
//  UIView + Extension.swift
//  Common
//
//  Created by Bacho on 13.01.26.
//

import UIKit

public extension UIView {
    static func createHeaderView() -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let logoImageView = UIImageView(image: UIImage(named: "ball"))
        logoImageView.tintColor = .label
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = "DISCOVER"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let separator = CustomElements.createSeparator()
        
        container.addSubview(logoImageView)
        container.addSubview(label)
        container.addSubview(separator)
        
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            logoImageView.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 20),
            logoImageView.widthAnchor.constraint(equalToConstant: 25),
            logoImageView.heightAnchor.constraint(equalToConstant: 25),
            
            label.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 8),
            label.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            
            separator.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        
        return container
    }
}
