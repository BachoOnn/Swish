//
//  GameDetailsViewController.swift
//  Main
//
//  Created by Bacho on 18.01.26.
//

import UIKit
import Common
import Helpers

final class GameDetailsViewController: UIViewController {
    
    let viewModel: GameDetailsViewModel
    var currentPageViewController: UIViewController?
    
    // MARK: - UI Components
    
    let customNavigationBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left.chevron.left.dotted"), for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gameScoreHeaderView: GameScoreHeaderView = {
        let view = GameScoreHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Summary", "Box Score"])
        sc.selectedSegmentIndex = 0
        sc.setTitleTextAttributes([.foregroundColor: UIColor.label], for: .selected)
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    let pageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initialization
    init(viewModel: GameDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSwiftUIBackground(PosterBackground(poster: "poster2"))
        setupCustomNavigationBar()
        setupUI()
        configureViews()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
