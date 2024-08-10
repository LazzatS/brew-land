//
//  CategoryView.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 04.08.2024.
//

import UIKit

class CategoryView: UIView {
    
    var category: Category?
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: layout
        )
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ category: Category) {
        self.category = category
    }
    
    private func setup() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CategoryItemCollectionCell.self,
                                forCellWithReuseIdentifier: CategoryItemCollectionCell.id)
        
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

extension CategoryView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category?.items.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryItemCollectionCell.id,
            for: indexPath
        ) as? CategoryItemCollectionCell
        else { return UICollectionViewCell() }
        cell.configure(category: category?.items[indexPath.row])
        return cell
    }
}

extension CategoryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 250
        let width: CGFloat = (frame.width - 16) / 2  // spacing = 16
        return CGSize(width: width, height: height)
    }
}
