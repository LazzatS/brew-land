//
//  PinKeypadView.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 06.04.2025.
//

import UIKit

protocol PinKeypadDelegate: AnyObject {
    func addDigit(number: Int)
    func removeLastDigit()
}

class PinKeypadView: UIView {
    
    var delegate: PinKeypadDelegate?
    
    private let grid: [[String]] = {
        return [
            ["1", "2", "3"],
            ["4", "5", "6"],
            ["7", "8", "9"],
            ["FaceID", "0", "⌫"],
        ]
    }()
    
    private var vStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = PinCodeConstants.keypadSpacing
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupKeypad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupKeypad() {
        for row in 0..<grid.count {
            let hStackView = UIStackView()
            hStackView.axis = .horizontal
            hStackView.distribution = .fillEqually
            hStackView.spacing = PinCodeConstants.keypadSpacing
            
            for col in 0..<grid[0].count {
                
                let button = PinNumberButton(title: grid[row][col])
                if row == grid.count - 1 && col == grid[0].count - 1 {
                    button.tag = -1
                } else {
                    button.tag = row * 3 + col + 1
                }
                
                button.addTarget(self, action: #selector(didTapKeypadButton(_:)), for: .touchUpInside)
                
                hStackView.addArrangedSubview(button)
                button.snp.makeConstraints {
                    $0.width.height.equalTo(PinCodeConstants.keypadButtonSize.width)
                }
            }
            vStackView.addArrangedSubview(hStackView)
        }
        
        addSubview(vStackView)
        vStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    @objc func didTapKeypadButton(_ sender: PinNumberButton) {
        switch sender.tag {
        case -1:
            delegate?.removeLastDigit()
        default:
            delegate?.addDigit(number: sender.tag)
        }
    }
}
