//
//  MenuViewController.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 03.08.2024.
//

import UIKit

class MenuViewController: UIViewController {
    
    var categories: [Category] = [
        Category(icon: "coffeeCategory", title: "Coffee", items: [
            CategoryItem(title: "cappuccinoCup", price: 200),
            CategoryItem(title: "chocolateCup", price: 200),
            CategoryItem(title: "espressoCup", price: 200),
            CategoryItem(title: "flatWhiteCup", price: 200),
            CategoryItem(title: "latteCup", price: 200),
            CategoryItem(title: "lavenderCup", price: 200),
            CategoryItem(title: "mochaCup", price: 200)
        ]),
        Category(icon: "teaCategory", title: "Tea", items: [
            CategoryItem(title: "blackTeaCup", price: 200),
            CategoryItem(title: "lemonTeaCup", price: 200),
            CategoryItem(title: "redTeaCup", price: 200),
            CategoryItem(title: "mangoOolungTeaCup", price: 200),
            CategoryItem(title: "matchaCup", price: 200)
        ]),
        Category(icon: "lemonadeCategory", title: "Lemonade", items: [
            CategoryItem(title: "orangeLemonadeCup", price: 200)
        ]),
        Category(icon: "croissantCategory", title: "Croissant", items: [
            CategoryItem(title: "cheeseCroissant", price: 200),
            CategoryItem(title: "chickenCroissant", price: 200),
            CategoryItem(title: "eggsCroissant", price: 200),
            CategoryItem(title: "tunaCroissant", price: 200),
            CategoryItem(title: "spinachCroissant", price: 200),
            CategoryItem(title: "shrimpCroissant", price: 200),
            CategoryItem(title: "mozzarellaCroissant", price: 200),
            CategoryItem(title: "veganCroissant", price: 200)
        ]),
        Category(icon: "dessertCategory", title: "Dessert", items: [
            CategoryItem(title: "carrotCakeDessert", price: 200),
            CategoryItem(title: "cherryCakeDessert", price: 200),
            CategoryItem(title: "chocoDessert", price: 200),
            CategoryItem(title: "raspberryCakeDessert", price: 200),
            CategoryItem(title: "redVelvetDessert", price: 200),
            CategoryItem(title: "snickersDessert", price: 200),
            CategoryItem(title: "truffleDessert", price: 200),
            CategoryItem(title: "whiteChocoDessert", price: 200),
        ]),
    ]
    
    private var categoriesMenu = CategoriesMenuView()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        view.backgroundColor = BLColor.Background.primary
        setup()
        categoriesMenu.configure(categories)
    }
    
    private func setup() {
        view.addSubview(categoriesMenu)
        categoriesMenu.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoriesMenu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoriesMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            categoriesMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            categoriesMenu.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CategoriesHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: CategoriesHeaderView.id)
        collectionView.register(CategoryItemCollectionCell.self,
                                forCellWithReuseIdentifier: CategoryItemCollectionCell.id)
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: categoriesMenu.bottomAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int
    ) -> Int {
        return categories[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryItemCollectionCell.id,
            for: indexPath
        ) as? CategoryItemCollectionCell
        else { return UICollectionViewCell() }
        let categoryItem = categories[indexPath.section].items[indexPath.row]
        cell.configure(category: categoryItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind, withReuseIdentifier: CategoriesHeaderView.id, for: indexPath
        ) as? CategoriesHeaderView
        else { return UICollectionReusableView() }
        headerView.configure(title: categories[indexPath.section].title)
        return headerView
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = 250
        let width: CGFloat = (collectionView.frame.width - 16) / 2  // spacing = 16
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}
