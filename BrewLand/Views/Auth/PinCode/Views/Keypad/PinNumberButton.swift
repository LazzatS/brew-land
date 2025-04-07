//
//  PinNumberButton.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 06.04.2025.
//

import UIKit

class PinNumberButton: UIButton {
    
    let title: String
    
    init(title: String) {
        self.title = title
        let frame = CGRect(origin: .zero, size: PinCodeConstants.keypadButtonSize)
        super.init(frame: frame)
        setTitle(title, for: .normal)
        layer.cornerRadius = frame.width / 2
        backgroundColor = BrewLandColor.Action.enabled
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
