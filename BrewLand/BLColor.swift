//
//  BLColor.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 01.08.2024.
//

import UIKit

enum BLColor {
    enum Background {
        static let primary = UIColor(named: "backgroundPrimary")
        static let reversed = UIColor(named: "backgroundReversed")
    }
    
    enum Button {
        static let active = UIColor(named: "buttonPrimary")
    }
    
    enum Label {
        static let primary = UIColor(named: "labelPrimary")
        static let primaryReversed = UIColor(named: "labelReversed")
        static let secondary = UIColor.secondaryLabel
        static let tertiary = UIColor.tertiaryLabel
    }
}
