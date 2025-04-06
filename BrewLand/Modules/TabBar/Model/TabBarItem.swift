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
                image: UIImage(named: "favourites_tab"),
                selectedImage: UIImage(named: "favourites_tab_selected")
            )
        case .cart:
            return TabBarIcon(
                title: "Cart",
                image: UIImage(named: "cart_tab"),
                selectedImage: UIImage(named: "cart_tab_selected")
            )
        case .location:
            return TabBarIcon(
                title: "Location",
                image: UIImage(named: "location_tab"),
                selectedImage: UIImage(named: "location_tab_selected")
            )
        case .profile:
            return TabBarIcon(
                title: "Profile",
                image: UIImage(named: "profile_tab"),
                selectedImage: UIImage(named: "profile_tab_selected")
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
