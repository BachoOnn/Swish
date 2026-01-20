//  GameScoreHeaderView.swift
//  Swish
//
//  Created by Bacho on 10.01.26.
//

import UIKit
import GameDomain

final class GameScoreHeaderView: UIView {
    
    // MARK: - UI Components
    private let containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let homeTeamStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 2
        return stack
    }()
    
    private let homeTeamLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let homeTeamAbbreviationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private let scoreStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        return stack
    }()
    
    private let homeScoreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private let statusStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 4
        return stack
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    
    private let visitorScoreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private let visitorTeamStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 2
        return stack
    }()
    
    private let visitorTeamLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let visitorTeamAbbreviationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        return label
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
        backgroundColor = .clear
        addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            homeTeamLogoImageView.widthAnchor.constraint(equalToConstant: 40),
            homeTeamLogoImageView.heightAnchor.constraint(equalToConstant: 40),
            
            visitorTeamLogoImageView.widthAnchor.constraint(equalToConstant: 40),
            visitorTeamLogoImageView.heightAnchor.constraint(equalToConstant: 40),
        
        ])
        
        homeTeamStackView.addArrangedSubview(homeTeamLogoImageView)
        homeTeamStackView.addArrangedSubview(homeTeamAbbreviationLabel)
        
        statusStackView.addArrangedSubview(statusLabel)
        
        scoreStackView.addArrangedSubview(homeScoreLabel)
        scoreStackView.addArrangedSubview(statusStackView)
        scoreStackView.addArrangedSubview(visitorScoreLabel)
        
        visitorTeamStackView.addArrangedSubview(visitorTeamLogoImageView)
        visitorTeamStackView.addArrangedSubview(visitorTeamAbbreviationLabel)
        
        containerStackView.addArrangedSubview(homeTeamStackView)
        containerStackView.addArrangedSubview(scoreStackView)
        containerStackView.addArrangedSubview(visitorTeamStackView)
    }
    
    // MARK: - Public Configuration
    func configure(with game: Game) {
        homeTeamLogoImageView.image = UIImage(named: game.homeTeam.name)
        homeTeamAbbreviationLabel.text = game.homeTeam.abbreviation
        homeScoreLabel.text = "\(game.homeTeamScore)"
        
        visitorTeamLogoImageView.image = UIImage(named: game.visitorTeam.name)
        visitorTeamAbbreviationLabel.text = game.visitorTeam.abbreviation
        visitorScoreLabel.text = "\(game.visitorTeamScore)"
        
        if game.isFinished {
            statusLabel.text = "FINAL"
        } else if game.isUpcoming {
            statusLabel.text = game.formattedTime
        } else if game.isLive {
            statusLabel.text = game.status
            statusLabel.textColor = .red
        }
    }
}
