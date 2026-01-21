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
    
    // MARK: - UI Components
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "game")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let playerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let teamInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
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
        addSubview(containerView)
        containerView.addSubview(playerImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(teamInfoLabel)
        containerView.addSubview(statsStackView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            playerImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            playerImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            playerImageView.widthAnchor.constraint(equalToConstant: 60),
            playerImageView.heightAnchor.constraint(equalToConstant: 60),
            
            nameLabel.topAnchor.constraint(equalTo: playerImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: playerImageView.trailingAnchor, constant: 12),
            
            teamInfoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            teamInfoLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            statsStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 5),
            statsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            statsStackView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func createStatView(value: String, label: String) -> UIView {
        let container = UIView()
        
        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = .systemFont(ofSize: 24, weight: .bold)
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
            
            titleLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 4),
            titleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        
        return container
    }
    
    // MARK: - Configuration
    func configure(with stats: PlayerStats) {
        playerImageView.setNBAHeadshot(for: stats.player.fullName)
        nameLabel.text = stats.player.fullName
        let jerseyNumber: String = stats.player.jerseyNumber ?? "N/A"
        
        teamInfoLabel.text = "\(stats.team.abbreviation) | #\(jerseyNumber) | \(stats.player.position)"
        
        statsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        statsStackView.addArrangedSubview(createStatView(value: "\(stats.pts)", label: "PTS"))
        statsStackView.addArrangedSubview(createStatView(value: "\(stats.reb)", label: "REB"))
        statsStackView.addArrangedSubview(createStatView(value: "\(stats.ast)", label: "AST"))
    }
}
