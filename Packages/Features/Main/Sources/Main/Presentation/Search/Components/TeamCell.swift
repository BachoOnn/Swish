//
//  TeamCell.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import UIKit
import Common
import TeamDomain

final class TeamCell: UIView {
    
    // MARK: - UI Components
    private let teamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let teamNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let conferenceLabel: UILabel = {
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
        
        addSubview(teamImageView)
        addSubview(stackView)
        
        stackView.addArrangedSubview(teamNameLabel)
        stackView.addArrangedSubview(locationLabel)
        stackView.addArrangedSubview(conferenceLabel)
        
        NSLayoutConstraint.activate([
            teamImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            teamImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            teamImageView.widthAnchor.constraint(equalToConstant: 50),
            teamImageView.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.leadingAnchor.constraint(equalTo: teamImageView.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    // MARK: - Configuration
    func configure(with team: Team) {
        let image = UIImage(named: team.name)
        teamImageView.image = image ?? UIImage(systemName: "basketball")
        
        teamNameLabel.text =  team.fullName
        locationLabel.text = "\(team.city), \(team.name)"
        conferenceLabel.text = "\(team.conference) • \(team.division)"
    }
}
