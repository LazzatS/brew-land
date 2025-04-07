//
//  PinDotsView.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 06.04.2025.
//

import UIKit

class PinDotsView: UIView {
    
    private lazy var pinDotsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = PinCodeConstants.dotViewSpacing
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDots()
        
        addSubview(pinDotsStackView)
        pinDotsStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDots() {
        for _ in 0..<PinCodeConstants.maxCount {
            let dotView = UIView()
            dotView.backgroundColor = BrewLandColor.Background.secondary
            dotView.layer.cornerRadius = PinCodeConstants.dotViewSize / 2
            pinDotsStackView.addArrangedSubview(dotView)
            
            dotView.snp.makeConstraints {
                $0.width.height.equalTo(PinCodeConstants.dotViewSize)
            }
        }
    }
    
    func colorDots(enteredDigits: Int) {
        for (i, pinDotView) in pinDotsStackView.subviews.enumerated() {
            if i <= enteredDigits {
                pinDotView.backgroundColor = BrewLandColor.Theme.carrot
            }
        }
    }
    
    func clearDots() {
        pinDotsStackView.subviews.forEach {
            $0.backgroundColor = BrewLandColor.Background.secondary
        }
    }
}
