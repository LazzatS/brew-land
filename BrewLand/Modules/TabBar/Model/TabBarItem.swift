//
//  TabBarItem.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 05.04.2025.
//

import UIKit

enum TabBarItem: Int {
    case home
    case favourites
    case cart
    case location
    case profile
    
    var icon: TabBarIcon {
        switch self {
        case .home:
            return TabBarIcon(
                title: "Home",
                image: UIImage(named: "home_tab"),
                selectedImage: UIImage(named: "home_tab_selected")
            )
        case .favourites:
            return TabBarIcon(
                title: "Favourites",
                image: UIImage(systemName: "circle"),
                selectedImage: UIImage(systemName: "circle")
            )
        case .cart:
            return TabBarIcon(
                title: "Cart",
                image: UIImage(systemName: "circle"),
                selectedImage: UIImage(systemName: "circle")
            )
        case .location:
            return TabBarIcon(
                title: "Location",
                image: UIImage(systemName: "circle"),
                selectedImage: UIImage(systemName: "circle")
            )
        case .profile:
            return TabBarIcon(
                title: "Profile",
                image: UIImage(systemName: "circle"),
                selectedImage: UIImage(systemName: "circle")
            )
        }
    }
    
    var tabItem: UITabBarItem {
        return UITabBarItem(
            title: icon.title,
            image: icon.image,
            selectedImage: icon.selectedImage
        )
    }
}

struct TabBarIcon {
    let title: String?
    let image: UIImage?
    let selectedImage: UIImage?
}
