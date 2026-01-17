//
//  GameCell.swift
//  Swish
//
//  Created by Bacho on 12.01.26.
//

import UIKit
import SwiftUI
import GameDomain

final class GameCell: UICollectionViewCell {
    
    // MARK: - Properties
    private var homeTeamHosting: UIHostingController<TeamSideView>?
    private var awayTeamHosting: UIHostingController<TeamSideView>?
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "game")
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let vsLabel: UILabel = {
        let label = UILabel()
        label.text = "VS"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
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
        contentView.addSubview(containerView)
        containerView.addSubview(timeLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(vsLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            dateLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            timeLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            vsLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 6),
            vsLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
    }
    
    // MARK: - Configure
    func configure(with game: Game) {
        homeTeamHosting?.view.removeFromSuperview()
        awayTeamHosting?.view.removeFromSuperview()
        
        let homeView = TeamSideView(team: game.homeTeam.name, conference: game.homeTeam.conference)
        let awayView = TeamSideView(team: game.visitorTeam.name, conference: game.visitorTeam.conference)
        
        homeTeamHosting = UIHostingController(rootView: homeView)
        awayTeamHosting = UIHostingController(rootView: awayView)
        
        if let homeView = homeTeamHosting?.view,
           let awayView = awayTeamHosting?.view {
            homeView.backgroundColor = .clear
            awayView.backgroundColor = .clear
            
            containerView.addSubview(homeView)
            containerView.addSubview(awayView)
            
            homeView.translatesAutoresizingMaskIntoConstraints = false
            awayView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                homeView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
                homeView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                homeView.heightAnchor.constraint(equalToConstant: 100),
                homeView.widthAnchor.constraint(equalToConstant: 100),
                
                awayView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
                awayView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                awayView.heightAnchor.constraint(equalToConstant: 100),
                awayView.widthAnchor.constraint(equalToConstant: 100)
            ])
        }
        
        if game.isFinished {
            timeLabel.text = "Final"
            vsLabel.text = "\(game.homeTeamScore) - \(game.visitorTeamScore)"
        } else {
            timeLabel.text = game.formattedTime
            vsLabel.text = "VS"
        }
        dateLabel.text = game.formattedDate
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        homeTeamHosting?.view.removeFromSuperview()
        awayTeamHosting?.view.removeFromSuperview()
        homeTeamHosting = nil
        awayTeamHosting = nil
        timeLabel.text = nil
        dateLabel.text = nil
    }
}
