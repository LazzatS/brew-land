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
            CategoryItem(title: "Cappuccino", price: 200, imageTitle: "cappuccinoCup"),
            CategoryItem(title: "Chocolate", price: 200, imageTitle: "chocolateCup"),
            CategoryItem(title: "Espresso", price: 200, imageTitle: "espressoCup"),
            CategoryItem(title: "Flat white", price: 200, imageTitle: "flatWhiteCup"),
            CategoryItem(title: "Latte", price: 200, imageTitle: "latteCup"),
            CategoryItem(title: "Lavender Raf", price: 200, imageTitle: "lavenderRafCup"),
            CategoryItem(title: "Mocha", price: 200, imageTitle: "mochaCup")
        ]),
        Category(icon: "teaCategory", title: "Tea", items: [
            CategoryItem(title: "Black", price: 200, imageTitle: "blackTeaCup"),
            CategoryItem(title: "Lemon", price: 200, imageTitle: "lemonTeaCup"),
            CategoryItem(title: "Red", price: 200, imageTitle: "redTeaCup"),
            CategoryItem(title: "Mango oolung", price: 200, imageTitle: "mangoOolungTeaCup"),
            CategoryItem(title: "Matcha", price: 200, imageTitle: "matchaCup")
        ]),
        Category(icon: "lemonadeCategory", title: "Lemonade", items: [
            CategoryItem(title: "Orange juice", price: 200, imageTitle: "orangeLemonadeCup")
        ]),
        Category(icon: "croissantCategory", title: "Croissant", items: [
            CategoryItem(title: "Cheese", price: 200, imageTitle: "cheeseCroissant"),
            CategoryItem(title: "Chicken", price: 200, imageTitle: "chickenCroissant"),
            CategoryItem(title: "Eggs and vegies", price: 200, imageTitle: "eggsCroissant"),
            CategoryItem(title: "Tuna", price: 200, imageTitle: "tunaCroissant"),
            CategoryItem(title: "Spinach", price: 200, imageTitle: "spinachCroissant"),
            CategoryItem(title: "Shrimp", price: 200, imageTitle: "shrimpCroissant"),
            CategoryItem(title: "Mozzarella", price: 200, imageTitle: "mozzarellaCroissant"),
            CategoryItem(title: "Vegan", price: 200, imageTitle: "veganCroissant")
        ]),
        Category(icon: "dessertCategory", title: "Dessert", items: [
            CategoryItem(title: "Carrot cake", price: 200, imageTitle: "carrotCakeDessert"),
            CategoryItem(title: "Cherry cake", price: 200, imageTitle: "cherryCakeDessert"),
            CategoryItem(title: "Chocolate", price: 200, imageTitle: "chocoDessert"),
            CategoryItem(title: "Raspberry", price: 200, imageTitle: "raspberryCakeDessert"),
            CategoryItem(title: "Red velvet", price: 200, imageTitle: "redVelvetDessert"),
            CategoryItem(title: "Snickers", price: 200, imageTitle: "snickersDessert"),
            CategoryItem(title: "Truffle", price: 200, imageTitle: "truffleDessert"),
            CategoryItem(title: "White chocolate", price: 200, imageTitle: "whiteChocoDessert"),
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
