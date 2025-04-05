//
//  Color.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 05.04.2025.
//

import UIKit

enum BrewLandColor {
    
    enum Action {
        static var enabled = UIColor(named: "action_enabled")
        static var disabled = UIColor(named: "action_disabled")
    }
    
    enum Background {
        static var `default` = UIColor(named: "background_default")
        static var reversed = UIColor(named: "background_reversed")
        static var secondary = UIColor(named: "background_secondary")
    }
    
    enum Border {
        static var `default` = UIColor(named: "border_default")
        static var reversed = UIColor(named: "border_reversed")
        static var positive = UIColor(named: "border_positive")
        static var negative = UIColor(named: "border_negative")
    }
    
    enum Label {
        static var primaryStatic = UIColor(named: "label_primary_static")
        static var primaryDynamic = UIColor(named: "label_primary_dynamic")
        static var secondaryStatic = UIColor(named: "label_secondary_static")
        static var secondaryDynamic = UIColor(named: "label_secondary_dynamic")
    }
    
    enum Theme {
        static var lavander = UIColor(named: "lavander")
        static var carrot = UIColor(named: "carrot")
    }
}
