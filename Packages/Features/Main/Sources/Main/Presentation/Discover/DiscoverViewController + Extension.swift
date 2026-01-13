//
//  DiscoverViewController + Extension.swift
//  Main
//
//  Created by Bacho on 14.01.26.
//

import SwiftUI
import Common
import SafariServices

extension DiscoverViewController {
    
    func setupBackground() {
        let hostingController = UIHostingController(rootView: GradientBackground())
        let backgroundView = hostingController.view!
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addChild(hostingController)
        view.addSubview(backgroundView)
        hostingController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        backgroundView.backgroundColor = .clear
    }
    
    func setupGrid() {
        let standingsBtn = UIButton.makeMenuCard(title: "Standings", imageName: "chart.bar") { [weak self] in
            self?.openWebsite(urlString: "https://www.nba.com/standings")
        }
        let askBtn = UIButton.makeMenuCard(title: "Ask SWISH", imageName: "basketball.fill") { [weak self] in
            self?.openWebsite(urlString: "")
        }
        let playersBtn = UIButton.makeMenuCard(title: "Players", imageName: "figure.basketball") { [weak self] in
            self?.openWebsite(urlString: "https://www.nba.com/players")
        }
        let teamsBtn = UIButton.makeMenuCard(title: "Teams", imageName: "person.2.fill") { [weak self] in
            self?.openWebsite(urlString: "https://www.nba.com/teams")
        }
        let statsBtn = UIButton.makeMenuCard(title: "Stats Leader", imageName: "chart.bar.xaxis") { [weak self] in
            self?.openWebsite(urlString: "https://www.nba.com/stats/leaders")
        }
        let allStarBtn = UIButton.makeMenuCard(title: "All-Star Voting", imageName: "star.leadinghalf.filled") { [weak self] in
            self?.openWebsite(urlString: "https://vote.nba.com/en")
        }
        
        let row1 = UIStackView.makeHorizontalRow(leftView: standingsBtn, rightView: askBtn)
        let row2 = UIStackView.makeHorizontalRow(leftView: playersBtn, rightView: teamsBtn)
        let row3 = UIStackView.makeHorizontalRow(leftView: statsBtn, rightView: allStarBtn)
        
        let mainStack = UIStackView(arrangedSubviews: [row1, row2, row3])
        mainStack.axis = .vertical
        mainStack.spacing = 16
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: titleLabel1.bottomAnchor, constant: 16),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        view.addSubview(titleLabel2)
        NSLayoutConstraint.activate([
            titleLabel2.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 32),
            titleLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    func setupAffiliateLeagues() {
        let balBtn = UIButton.makeLeagueCard(title: "BAL", imageName: "bal") { [weak self] in
            self?.openWebsite(urlString: "https://bal.nba.com/")
        }
        let wnbaBtn = UIButton.makeLeagueCard(title: "WNBA", imageName: "wnba") { [weak self] in
            self?.openWebsite(urlString: "https://www.wnba.com/")
        }
        let nba2kBtn = UIButton.makeLeagueCard(title: "NBA 2K", imageName: "nba2k") { [weak self] in
            self?.openWebsite(urlString: "https://nba2kleague.com/")
        }
        let nbaGBtn = UIButton.makeLeagueCard(title: "G League", imageName: "gLeague") { [weak self] in
            self?.openWebsite(urlString: "https://gleague.nba.com/")
        }
        
        [balBtn, wnbaBtn, nba2kBtn, nbaGBtn].forEach {
            $0.widthAnchor.constraint(equalToConstant: 90).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 90).isActive = true
        }
        
        let leagueRow = UIStackView.makeScrollableRow(buttons: [balBtn, wnbaBtn, nba2kBtn, nbaGBtn])
        leagueRow.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(leagueRow)
        
        NSLayoutConstraint.activate([
            leagueRow.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 16),
            leagueRow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            leagueRow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            leagueRow.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func openWebsite(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let safariVC = SFSafariViewController(url: url)
        safariVC.modalPresentationStyle = .pageSheet
        safariVC.preferredBarTintColor = .game
        safariVC.preferredControlTintColor = .systemBackground
        
        present(safariVC, animated: true)
    }
}
