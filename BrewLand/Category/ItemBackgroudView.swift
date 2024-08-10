//
//  ItemBackgroudView.swift
//  BrewLand
//
//  Created by Lazzat Seiilova on 10.08.2024.
//

import UIKit

class ItemBackgroudView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let offset: CGFloat = 20
        let width = rect.width
        let height = rect.height - offset
        let radius: CGFloat = 20
        
        let path = UIBezierPath()
        
        // bottom right arc
        path.addArc(
            withCenter: CGPoint(x: width - radius, y: height),
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat.pi / 2,
            clockwise: true
        )
        // bottom left arc
        path.addArc(
            withCenter: CGPoint(x: radius, y: height),
            radius: radius,
            startAngle: 1.6 * CGFloat.pi / 3,
            endAngle: CGFloat.pi,
            clockwise: true
        )
        // top left arc
        path.addArc(
            withCenter: CGPoint(x: radius, y: radius),
            radius: radius,
            startAngle: CGFloat.pi,
            endAngle: CGFloat.pi * 1.5,
            clockwise: true
        )
        // top right arc
        path.addArc(
            withCenter: CGPoint(x: width-radius, y: radius),
            radius: radius,
            startAngle: CGFloat.pi * 1.5,
            endAngle: CGFloat.pi * 2,
            clockwise: true
        )
        
        path.addLine(to: CGPoint(x: width, y: height * 0.6))
        
        // rounded corner before D
        path.addArc(
            withCenter: CGPoint(x: width-radius, y: height * 0.6 - radius),
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat.pi / 2,
            clockwise: true
        )
        
        // D-shape curve reversed
        path.addCurve(
            to: CGPoint(x: width-radius, y: 3.5 * height / 4),
            controlPoint1: CGPoint(x: width - 2 * radius, y: height * 0.6),
            controlPoint2: CGPoint(x: width - 2 * radius, y: 3.5 * height / 4)
        )
        
        // rounded corner after D
        path.addArc(
            withCenter: CGPoint(x: width-radius, y: 3.5 * height / 4 + radius),
            radius: radius,
            startAngle: CGFloat.pi * 1.5,
            endAngle: CGFloat.pi * 2,
            clockwise: true
        )
        
        path.addLine(to: CGPoint(x: width, y: height))
        path.close()
        
        BLColor.Background.purple?.setFill()
        path.fill()
    }
}
