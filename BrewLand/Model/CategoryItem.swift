//
//  CategoryItem.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 04.08.2024.
//

import Foundation

struct CategoryItem {
    
    var title: String
    var price: Double
    var image: String
    
    init(title: String, price: Double, imageTitle: String) {
        self.title = title
        self.price = price
        self.image = imageTitle
    }
}
