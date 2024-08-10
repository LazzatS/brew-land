//
//  Category.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 04.08.2024.
//

import Foundation

struct Category {
    
    var icon: String?
    var title: String
    var items = [CategoryItem]()
    
    init(icon: String?, title: String, items: [CategoryItem]) {
        self.icon = icon
        self.title = title
        self.items = items
    }
}
