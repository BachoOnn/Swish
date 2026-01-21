//
//  PlayerCell.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import UIKit
import Common
import PlayerDomain

final class PlayerCell: UIView {
    
    // MARK: - UI Components
    private let playerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray5
        imageView.layer.cornerRadius = 25
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let playerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let positionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let teamLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .tertiaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupUI() {
        backgroundColor = .game
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray2.cgColor
        
        addSubview(playerImageView)
        addSubview(stackView)
        
        stackView.addArrangedSubview(playerNameLabel)
        stackView.addArrangedSubview(positionLabel)
        stackView.addArrangedSubview(teamLabel)
        
        NSLayoutConstraint.activate([
            playerImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            playerImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            playerImageView.widthAnchor.constraint(equalToConstant: 50),
            playerImageView.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.leadingAnchor.constraint(equalTo: playerImageView.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    // MARK: - Configuration
    func configure(with player: Player) {
        let fullName = "\(player.firstName) \(player.lastName)"
        playerImageView.setNBAHeadshot(for: fullName)
        
        playerNameLabel.text = fullName
        
        if player.jerseyNumber != nil {
            positionLabel.text = "\(player.position) • #\(player.jerseyNumber ?? "N/A")"
        } else {
            positionLabel.text = player.position
        }
        
        teamLabel.text = player.country
    }
}
