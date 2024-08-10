//
//  CategoryItemCollectionCell.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 04.08.2024.
//

import UIKit

class CategoryItemCollectionCell: UICollectionViewCell {
    
    static let id = "CategoryItemCollectionCell"
    
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
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.black.cgColor
        
        let itemBackgroundView = ItemBackgroudView()
        itemBackgroundView.backgroundColor = UIColor.clear
        contentView.addSubview(itemBackgroundView)
        itemBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                                    constant: contentView.frame.height / 3),
            itemBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(category: CategoryItem?) {
//        if let iconName = category.icon, !iconName.isEmpty {
//            iconView.image = UIImage(named: iconName)
//        }
        titleLabel.text = category?.title
    }
    
    private func setup() {
        [iconView, titleLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        
        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
