//
//  TopPerformersView.swift
//  Swish
//
//  Created by Bacho on 11.01.26.
//

import UIKit
import Common
import GameDomain

final class TopPerformersView: UIView {
    
    // MARK: - UI Components
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TOP PERFORMERS"
        label.font = .systemFont(ofSize: 20, weight: .black)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    private let playerCardsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var separatorLine = CustomElements.createSeparator()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        backgroundColor = UIColor(named: "game")
        layer.cornerRadius = 10
        clipsToBounds = true
        
        addSubview(containerStackView)
        
        let titleContainer = UIView()
        titleContainer.backgroundColor = UIColor(named: "game")
        titleContainer.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: titleContainer.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: titleContainer.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: titleContainer.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: titleContainer.bottomAnchor, constant: -16)
        ])
        
        containerStackView.addArrangedSubview(titleContainer)
        containerStackView.addArrangedSubview(separatorLine)
        containerStackView.addArrangedSubview(playerCardsStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Configuration
    func configure(with players: [PlayerStats]) {
        playerCardsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        players.forEach { stats in
            let cardView = PlayerStatCardView()
            cardView.configure(with: stats)
            cardView.translatesAutoresizingMaskIntoConstraints = false
            cardView.heightAnchor.constraint(equalToConstant: 90).isActive = true
            playerCardsStackView.addArrangedSubview(cardView)
        }
    }
}
