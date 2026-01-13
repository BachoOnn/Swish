//
//  QuarterScoresView.swift
//  Swish
//
//  Created by Bacho on 10.01.26.
//

import UIKit
import Common

final class QuarterScoresView: UIView {
    
    // MARK: - UI Components
    private let containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
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
        backgroundColor = UIColor(named: "game")
        addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        let headerRow = createHeaderRow()
        containerStackView.addArrangedSubview(headerRow)
        
        let separator = CustomElements.createSeparator()
        containerStackView.addArrangedSubview(separator)
    }
    
    private func createHeaderRow() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 0
        
        let logoView = UIView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(logoView)
        
        let quarters = ["Q1", "Q2", "Q3", "Q4", "T"]
        quarters.forEach { quarter in
            let label = createLabel(text: quarter, isBold: false)
            label.textColor = .lightGray
            stack.addArrangedSubview(label)
        }
        
        stack.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return stack
    }
    
    private func createTeamRow(
        teamName: String,
        quarterScores: [Int],
        totalScore: Int
    ) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 0
        
        let logoContainer = UIView()
        let logoImageView = UIImageView(image: UIImage(named: teamName))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoContainer.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: logoContainer.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: logoContainer.centerYAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 30),
            logoImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        stack.addArrangedSubview(logoContainer)
        
        let allScores = quarterScores + [totalScore]
        allScores.forEach { score in
            let label = createLabel(text: "\(score)", isBold: true)
            stack.addArrangedSubview(label)
        }
        
        stack.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return stack
    }
    
    private func createLabel(text: String, isBold: Bool) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.textColor = .label
        label.font = isBold ? .systemFont(ofSize: 18, weight: .bold) : .systemFont(ofSize: 14)
        return label
    }
    
    // MARK: - Public Configuration
    func configure(with game: Game) {
        let homeRow = createTeamRow(
            teamName: game.homeTeam.name,
            quarterScores: game.homeTeamQuarterScores,
            totalScore: game.homeTeamScore
        )
        containerStackView.addArrangedSubview(homeRow)
        
        let separator = CustomElements.createSeparator()
        containerStackView.addArrangedSubview(separator)
        
        let visitorRow = createTeamRow(
            teamName: game.visitorTeam.name,
            quarterScores: game.visitorTeamQuarterScores,
            totalScore: game.visitorTeamScore
        )
        containerStackView.addArrangedSubview(visitorRow)
    }
}
