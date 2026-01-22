//
//  PlayerStatCardView.swift
//  Swish
//
//  Created by Bacho on 11.01.26.
//

import UIKit
import Common
import GameDomain

final class PlayerStatCardView: UIView {
    
    // MARK: - Properties
    var pressAction: (() -> Void)?
    
    // MARK: - UI Components
    
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "game")
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let playerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.isUserInteractionEnabled = false // Allows touch to pass through to button
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let teamInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .lightGray
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.isUserInteractionEnabled = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        addSubview(actionButton)
        actionButton.addSubview(playerImageView)
        actionButton.addSubview(nameLabel)
        actionButton.addSubview(teamInfoLabel)
        actionButton.addSubview(statsStackView)
        
        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: topAnchor),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            playerImageView.leadingAnchor.constraint(equalTo: actionButton.leadingAnchor, constant: 16),
            playerImageView.centerYAnchor.constraint(equalTo: actionButton.centerYAnchor),
            playerImageView.widthAnchor.constraint(equalToConstant: 50),
            playerImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.topAnchor.constraint(equalTo: playerImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: playerImageView.trailingAnchor, constant: 12),
            
            teamInfoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            teamInfoLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            statsStackView.centerYAnchor.constraint(equalTo: actionButton.centerYAnchor, constant: 10),
            statsStackView.trailingAnchor.constraint(equalTo: actionButton.trailingAnchor, constant: -10),
            statsStackView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupActions() {
        actionButton.removeTarget(nil, action: nil, for: .allEvents)
        actionButton.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    }
    
    @objc private func handleTap() {
        pressAction?()
    }
    
    private func createStatView(value: String, label: String) -> UIView {
        let container = UIView()
        container.isUserInteractionEnabled = false
        
        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = .systemFont(ofSize: 20, weight: .bold)
        valueLabel.textColor = .label
        valueLabel.textAlignment = .center
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = label
        titleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        titleLabel.textColor = .lightGray
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(valueLabel)
        container.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: container.topAnchor),
            valueLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 2),
            titleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        
        return container
    }
    
    // MARK: - Configuration
    func configure(with stats: PlayerStats) {
        playerImageView.setNBAHeadshot(
            for: stats.player.fullName,
            defaultImage: "player1"
        )
        nameLabel.text = stats.player.fullName
        let jerseyNumber: String = stats.player.jerseyNumber ?? "N/A"
        
        teamInfoLabel.text = "\(stats.team.abbreviation) | #\(jerseyNumber) | \(stats.player.position)"
        
        statsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        statsStackView.addArrangedSubview(createStatView(value: "\(stats.pts)", label: "PTS"))
        statsStackView.addArrangedSubview(createStatView(value: "\(stats.reb)", label: "REB"))
        statsStackView.addArrangedSubview(createStatView(value: "\(stats.ast)", label: "AST"))
    }
}
