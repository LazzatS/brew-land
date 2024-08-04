//
//  MenuViewController.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 03.08.2024.
//

import UIKit

class MenuViewController: UIViewController {
    
    var categories: [Category] = [
        Category(icon: "coffeeCategory", title: "Coffee"),
        Category(icon: "teaCategory", title: "Tea"),
        Category(icon: "lemonadeCategory", title: "Lemonade"),
        Category(icon: "croissantCategory", title: "Croissant"),
        Category(icon: "dessertCategory", title: "Dessert"),
    ]
    
    private var categoriesMenu = CategoriesMenuView()
    
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
    }
}
