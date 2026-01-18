//
//  StartersView.swift
//  Main
//
//  Created by Bacho on 18.01.26.
//

import UIKit
import GameDomain

final class StartersView: UIView {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Starting Lineups"
        label.font = .systemFont(ofSize: 22, weight: .black)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let homeTeamContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let awayTeamContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Starting lineups is not available yet"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        layer.cornerRadius = 12
        
        addSubview(titleLabel)
        addSubview(containerStackView)
        addSubview(loadingIndicator)
        addSubview(emptyLabel)
        
        containerStackView.addArrangedSubview(homeTeamContainer)
        containerStackView.addArrangedSubview(awayTeamContainer)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            containerStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            emptyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptyLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            emptyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            emptyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    // MARK: - Public Methods
    
    func showLoading() {
        loadingIndicator.startAnimating()
        containerStackView.isHidden = true
        emptyLabel.isHidden = true
    }
    
    func hideLoading() {
        loadingIndicator.stopAnimating()
    }
    
    func configure(homeLineup: Lineup?, awayLineup: Lineup?) {
        hideLoading()
        
        // Clear old views
        homeTeamContainer.subviews.forEach { $0.removeFromSuperview() }
        awayTeamContainer.subviews.forEach { $0.removeFromSuperview() }
        
        // Check if we have any lineups
        guard homeLineup != nil || awayLineup != nil else {
            showEmptyState()
            return
        }
        
        containerStackView.isHidden = false
        emptyLabel.isHidden = true
        
        // Configure home team
        if let lineup = homeLineup {
            let teamView = createTeamLineupView(lineup: lineup)
            homeTeamContainer.addSubview(teamView)
            
            NSLayoutConstraint.activate([
                teamView.topAnchor.constraint(equalTo: homeTeamContainer.topAnchor),
                teamView.leadingAnchor.constraint(equalTo: homeTeamContainer.leadingAnchor),
                teamView.trailingAnchor.constraint(equalTo: homeTeamContainer.trailingAnchor),
                teamView.bottomAnchor.constraint(equalTo: homeTeamContainer.bottomAnchor)
            ])
        }
        
        // Configure away team
        if let lineup = awayLineup {
            let teamView = createTeamLineupView(lineup: lineup)
            awayTeamContainer.addSubview(teamView)
            
            NSLayoutConstraint.activate([
                teamView.topAnchor.constraint(equalTo: awayTeamContainer.topAnchor),
                teamView.leadingAnchor.constraint(equalTo: awayTeamContainer.leadingAnchor),
                teamView.trailingAnchor.constraint(equalTo: awayTeamContainer.trailingAnchor),
                teamView.bottomAnchor.constraint(equalTo: awayTeamContainer.bottomAnchor)
            ])
        }
    }
    
    // MARK: - Private Methods
    
    private func createTeamLineupView(lineup: Lineup) -> UIView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Team name label
        let teamLabel = UILabel()
        teamLabel.text = lineup.team.fullName
        teamLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        teamLabel.textColor = .label
        stackView.addArrangedSubview(teamLabel)
        
        // Add each starter
        for starter in lineup.starters {
            let playerView = createPlayerRow(player: starter)
            stackView.addArrangedSubview(playerView)
        }
        
        return stackView
    }
    
    private func createPlayerRow(player: Player) -> UIView {
        let container = UIView()
        container.backgroundColor = .tertiarySystemBackground
        container.layer.cornerRadius = 8
        
        let jerseyLabel = UILabel()
        jerseyLabel.text = "#\(player.jerseyNumber ?? "-")"
        jerseyLabel.font = .systemFont(ofSize: 12, weight: .bold)
        jerseyLabel.textColor = .label
        jerseyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let nameLabel = UILabel()
        nameLabel.text = player.fullName
        nameLabel.font = .systemFont(ofSize: 14, weight: .medium)
        nameLabel.textColor = .label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let positionLabel = UILabel()
        positionLabel.text = player.position
        positionLabel.font = .systemFont(ofSize: 12)
        positionLabel.textColor = .secondaryLabel
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(jerseyLabel)
        container.addSubview(nameLabel)
        container.addSubview(positionLabel)
        
        NSLayoutConstraint.activate([
            container.heightAnchor.constraint(equalToConstant: 44),
            
            jerseyLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 12),
            jerseyLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            jerseyLabel.widthAnchor.constraint(equalToConstant: 30),
            
            nameLabel.leadingAnchor.constraint(equalTo: jerseyLabel.trailingAnchor, constant: 12),
            nameLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
            positionLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -12),
            positionLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
        
        return container
    }
    
    private func showEmptyState() {
        containerStackView.isHidden = true
        emptyLabel.isHidden = false
    }
}
