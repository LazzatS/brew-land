//
//  StartPageViewController.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 28.07.2024.
//

import UIKit

class StartPageViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "orangeCup")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Brew Land"
        label.font = UIFont.systemFont(ofSize: 75, weight: .bold)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
       let label = UILabel()
        label.text = "Your perfect cup awaits"
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "Explore, order, and elevate your coffee experience anywhere!"
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .tertiaryLabel
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get your coffee", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .label
        button.layer.cornerRadius = 30
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
        setup()
    }
    
    private func configure() {
        startButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
    }
    
    @objc func didTapStartButton() {
        print("didTapStartButton")
    }
    
    private func setup() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        view.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subtitleLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 2)
        ])
        
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 32),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
        
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            startButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
