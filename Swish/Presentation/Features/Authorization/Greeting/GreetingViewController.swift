//
//  WelcomePageViewController.swift
//  Swish
//
//  Created by Bacho on 31.12.25.
//

import UIKit

final class GreetingViewController: UIViewController {
    
    private let viewModel: GreetingViewModel
    
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "WELCOME TO THE SWISH APP"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subLabel: UILabel = {
        let label = UILabel()
        label.text = "Experience live stats from your favorite teams and players"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let getStartedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.layer.cornerRadius = 14
        button.layer.masksToBounds = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let haveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Have an account?"
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor.white.withAlphaComponent(0.8)
        return label
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        return button
    }()
    
    private lazy var signInStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            haveAccountLabel,
            signInButton
        ])
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }()
    
    init(viewModel: GreetingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSwiftUIBackground(PosterBackground(poster: "poster"))
        setupUI()
        setupConstraints()
        setupActions()
    }
    
    private func setupUI() {
        view.addSubview(greetingLabel)
        view.addSubview(subLabel)
        view.addSubview(getStartedButton)
        view.addSubview(signInStackView)
    }
    
    private func setupActions() {
        getStartedButtonAction()
        signInButtonAction()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            greetingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 520),
            greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            subLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 16),
            subLabel.leadingAnchor.constraint(equalTo: greetingLabel.leadingAnchor),
            subLabel.trailingAnchor.constraint(equalTo: greetingLabel.trailingAnchor),
            
            getStartedButton.leadingAnchor.constraint(equalTo: subLabel.leadingAnchor),
            getStartedButton.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 26),
            getStartedButton.trailingAnchor.constraint(equalTo: subLabel.trailingAnchor),
            getStartedButton.heightAnchor.constraint(equalToConstant: 60),
            
            signInStackView.topAnchor.constraint(equalTo: getStartedButton.bottomAnchor, constant: 10),
            signInStackView.centerXAnchor.constraint(equalTo: getStartedButton.centerXAnchor)
        ])
    }
    
    
    private func getStartedButtonAction() {
        getStartedButton.addAction(UIAction { [weak self] _ in
            self?.viewModel.getStartedTapped()
        }, for: .touchUpInside)
    }
    
    
    private func signInButtonAction() {
        signInButton.addAction(UIAction { [weak self] _ in
            self?.viewModel.signInTapped()
        }, for: .touchUpInside)
    }

}
