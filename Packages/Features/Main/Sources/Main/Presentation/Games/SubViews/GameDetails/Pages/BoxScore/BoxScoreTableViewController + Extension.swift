//
//  BoxScoreTableViewController + Extension.swift
//  Main
//
//  Created by Bacho on 21.01.26.
//

import UIKit
import GameDomain

extension BoxScoreTableViewController {

    func configure(homeStats: [PlayerStats], awayStats: [PlayerStats]) {
        hideLoading()
        
        self.homeStats = homeStats.filter { $0.didPlay }
        self.awayStats = awayStats.filter { $0.didPlay }
        
        guard !self.homeStats.isEmpty || !self.awayStats.isEmpty else {
            showEmptyState()
            return
        }
        self.homeTeamName = homeStats.first?.team.abbreviation ?? "Home"
        self.awayTeamName = awayStats.first?.team.abbreviation ?? "Away"
        
        segmentedControl.setTitle(homeTeamName, forSegmentAt: 0)
        segmentedControl.setTitle(awayTeamName, forSegmentAt: 1)
        scrollView.isHidden = false
        emptyLabel.isHidden = true
        segmentedControl.isHidden = false
        displayCurrentTeam()
    }
    
    // MARK: - Private Methods
    
    @objc func segmentChanged() {
        displayCurrentTeam()
    }
    
    private func displayCurrentTeam() {
        tableContainer.subviews.forEach { $0.removeFromSuperview() }
        
        let stats = segmentedControl.selectedSegmentIndex == 0 ? homeStats : awayStats
        let teamName = segmentedControl.selectedSegmentIndex == 0 ?
        (homeStats.first?.team.fullName ?? homeTeamName) :
        (awayStats.first?.team.fullName ?? awayTeamName)
        
        guard !stats.isEmpty else {
            showEmptyTeamMessage()
            return
        }
        
        let teamSection = createTeamSection(teamName: teamName, stats: stats)
        teamSection.translatesAutoresizingMaskIntoConstraints = false
        
        tableContainer.addSubview(teamSection)
        
        NSLayoutConstraint.activate([
            teamSection.topAnchor.constraint(equalTo: tableContainer.topAnchor),
            teamSection.leadingAnchor.constraint(equalTo: tableContainer.leadingAnchor),
            teamSection.trailingAnchor.constraint(equalTo: tableContainer.trailingAnchor),
            teamSection.bottomAnchor.constraint(equalTo: tableContainer.bottomAnchor)
        ])
    }
    
    private func createTeamSection(teamName: String, stats: [PlayerStats]) -> UIView {
        let container = UIView()
        container.backgroundColor = .game
        container.layer.cornerRadius = 12
        
        let teamLabel = UILabel()
        teamLabel.text = teamName
        teamLabel.font = .systemFont(ofSize: 16, weight: .bold)
        teamLabel.textColor = .label
        teamLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let tableScrollView = UIScrollView()
        tableScrollView.showsHorizontalScrollIndicator = true
        tableScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        let tableStackContainer = createStatsTable(for: stats)
        tableStackContainer.translatesAutoresizingMaskIntoConstraints = false
        
        tableScrollView.addSubview(tableStackContainer)
        container.addSubview(teamLabel)
        container.addSubview(tableScrollView)
        
        NSLayoutConstraint.activate([
            teamLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 12),
            teamLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            teamLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            tableScrollView.topAnchor.constraint(equalTo: teamLabel.bottomAnchor, constant: 12),
            tableScrollView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            tableScrollView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            tableScrollView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -12),
            
            tableStackContainer.topAnchor.constraint(equalTo: tableScrollView.topAnchor),
            tableStackContainer.leadingAnchor.constraint(equalTo: tableScrollView.leadingAnchor),
            tableStackContainer.trailingAnchor.constraint(equalTo: tableScrollView.trailingAnchor),
            tableStackContainer.bottomAnchor.constraint(equalTo: tableScrollView.bottomAnchor),
            tableStackContainer.heightAnchor.constraint(equalTo: tableScrollView.heightAnchor)
        ])
        
        return container
    }
    
    private func createStatsTable(for stats: [PlayerStats]) -> UIView {
        let tableStack = UIStackView()
        tableStack.axis = .vertical
        tableStack.spacing = 0
        tableStack.addArrangedSubview(createHeaderRow())
        
        for (index, stat) in stats.enumerated() {
            let isEven = index % 2 == 0
            tableStack.addArrangedSubview(createPlayerRow(for: stat, isAlternate: isEven))
        }
        
        return tableStack
    }
    
    private func createHeaderRow() -> UIView {
        let row = UIStackView()
        row.axis = .horizontal
        row.spacing = 0
        row.backgroundColor = .game
        
        let headers = ["PLAYER", "MIN", "PTS", "REB", "AST", "FG%", "3P%", "FT%", "STL", "BLK", "TO"]
        let widths: [CGFloat] = [140, 45, 40, 40, 40, 50, 50, 50, 40, 40, 40]
        
        for (index, header) in headers.enumerated() {
            let container = UIView()
            container.backgroundColor = .game
            
            let label = UILabel()
            label.text = header
            label.font = .systemFont(ofSize: 10, weight: .bold)
            label.textColor = .secondaryLabel
            label.textAlignment = index == 0 ? .left : .center
            label.translatesAutoresizingMaskIntoConstraints = false
            
            container.addSubview(label)
            
            NSLayoutConstraint.activate([
                container.widthAnchor.constraint(equalToConstant: widths[index]),
                container.heightAnchor.constraint(equalToConstant: 36),
                
                label.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: index == 0 ? 16 : 8),
                label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8)
            ])
            
            row.addArrangedSubview(container)
        }
        
        return row
    }
    
    private func createPlayerRow(for stat: PlayerStats, isAlternate: Bool) -> UIView {
        let row = UIStackView()
        row.axis = .horizontal
        row.spacing = 0
        row.backgroundColor = isAlternate ? .systemBackground : .secondarySystemBackground.withAlphaComponent(0.3)
        
        let nameInitial = stat.player.firstName.first.map { String($0).uppercased() } ?? ""
        let fullName = "\(nameInitial).\(stat.player.lastName)"
        
        let values: [String] = [
            fullName,
            stat.minFormatted,
            "\(stat.pts)",
            "\(stat.reb)",
            "\(stat.ast)",
            stat.fgPctFormatted,
            stat.fg3PctFormatted,
            stat.ftPctFormatted,
            "\(stat.stl)",
            "\(stat.blk)",
            "\(stat.turnover)"
        ]
        
        let widths: [CGFloat] = [140, 45, 40, 40, 40, 50, 50, 50, 40, 40, 40]
        
        for (index, value) in values.enumerated() {
            let container = UIView()
            container.backgroundColor = row.backgroundColor
            
            let label = UILabel()
            label.text = value
            label.font = .systemFont(ofSize: index == 0 ? 14 : 12, weight: index == 0 ? .semibold : .regular)
            label.textColor = .label
            label.textAlignment = index == 0 ? .left : .center
            label.translatesAutoresizingMaskIntoConstraints = false
            
            container.addSubview(label)
            
            NSLayoutConstraint.activate([
                container.widthAnchor.constraint(equalToConstant: widths[index]),
                container.heightAnchor.constraint(equalToConstant: 40),
                
                label.centerYAnchor.constraint(equalTo: container.centerYAnchor),
                label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: index == 0 ? 16 : 8),
                label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -8)
            ])
            
            row.addArrangedSubview(container)
        }
        return row
    }
    
    private func showEmptyState() {
        scrollView.isHidden = true
        emptyLabel.isHidden = false
        segmentedControl.isHidden = true
    }
    
    private func showEmptyTeamMessage() {
        tableContainer.subviews.forEach { $0.removeFromSuperview() }
    }
}
