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
            CategoryItem(title: "cappuccino", price: 200),
            CategoryItem(title: "latte", price: 200),
            CategoryItem(title: "americano", price: 200)
        ]),
        Category(icon: "teaCategory", title: "Tea", items: [
            CategoryItem(title: "black", price: 200),
            CategoryItem(title: "green", price: 200)
        ]),
        Category(icon: "lemonadeCategory", title: "Lemonade", items: [
            CategoryItem(title: "lime", price: 200)
        ]),
        Category(icon: "croissantCategory", title: "Croissant", items: [
            CategoryItem(title: "chicken", price: 200)
        ]),
        Category(icon: "dessertCategory", title: "Dessert", items: [
            CategoryItem(title: "brauni", price: 200)
        ]),
    ]
    
    private var categoriesMenu = CategoriesMenuView()
    private var categoryView = CategoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menu"
        view.backgroundColor = BLColor.Background.primary
        setup()
        categoriesMenu.configure(categories)
        categoryView.configure(categories[0])
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
        
        view.addSubview(categoryView)
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: categoriesMenu.bottomAnchor),
            categoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            categoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            categoryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
}
