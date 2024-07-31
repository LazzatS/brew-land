//
//  BLTextField.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 31.07.2024.
//

import UIKit

class BLTextField: UIControl {
    
    lazy var textField: UITextField = {
        let view = UITextField()
        view.layer.borderColor = UIColor.label.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 30
        let paddingView = UIView(frame: CGRect(
            origin: .zero,
            size: CGSize(width: 24, height: 60))
        )
        view.leftView = paddingView
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder: String) {
        self.init()
        textField.placeholder = placeholder
    }
    
    private func setup() {
        addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
