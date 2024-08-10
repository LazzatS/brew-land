//
//  CategoriesHeaderView.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 10.08.2024.
//

import UIKit

class CategoriesHeaderView: UICollectionReusableView {
    
    static let id = "CategoriesHeaderView"
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = BLColor.Label.primary
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func configure(title: String) {
        titleLable.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubview(titleLable)
        
        NSLayoutConstraint.activate([
            titleLable.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLable.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
