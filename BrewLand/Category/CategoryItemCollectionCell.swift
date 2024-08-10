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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = BLColor.Label.primaryReversed
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "from 4 USD"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = BLColor.Label.primaryReversed
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "300 mL"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = BLColor.Label.primaryReversed
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let itemBackgroundView = ItemBackgroudView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 20
        
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
        if let iconName = category?.title, !iconName.isEmpty {
            iconView.image = UIImage(named: iconName)
        }
        titleLabel.text = category?.title
    }
    
    private func setup() {
        [iconView, titleLabel, priceLabel, sizeLabel].forEach {
            contentView.addSubview($0)
        }
        
        contentView.addSubview(iconView)
        NSLayoutConstraint.activate([
            iconView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: itemBackgroundView.topAnchor),
        ])
        
        contentView.addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ])
        
        contentView.addSubview(sizeLabel)
        NSLayoutConstraint.activate([
            sizeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            sizeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
}
