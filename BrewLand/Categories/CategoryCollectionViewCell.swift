//
//  CategoryCollectionViewCell.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 04.08.2024.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let id = "CategoryCollectionViewCell"
    
    private let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = BLColor.Label.primaryReversed
        label.numberOfLines = 1
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = BLColor.Background.reversed
        contentView.layer.cornerRadius = 20
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(category: Category) {
        if let iconName = category.icon, !iconName.isEmpty {
            iconView.image = UIImage(named: iconName)
        }
        titleLabel.text = category.title
    }
    
    private func setup() {
        [iconView, titleLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
