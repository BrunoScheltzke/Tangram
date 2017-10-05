//
//  TangramBoard.swift
//  Tangram
//
//  Created by Bruno Scheltzke on 05/10/17.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import UIKit

class TangramBoard: UIView {
    let triangle1 = CAShapeLayer()
    let triangle2 = CAShapeLayer()
    let triangle3 = CAShapeLayer()
    let triangle4 = CAShapeLayer()
    let triangle5 = CAShapeLayer()
    let square = CAShapeLayer()
    let parallelogram = CAShapeLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.addSublayer(triangle2)
        self.layer.addSublayer(triangle1)
        self.layer.addSublayer(triangle3)
        self.layer.addSublayer(square)
        self.layer.addSublayer(triangle4)
        self.layer.addSublayer(parallelogram)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        createLayers()
    }
    
    func createLayers() {
        let l = frame.width
        
        //layer for triangle1
        triangle1.frame = layer.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: l/2, y: l/2))
        path.addLine(to: CGPoint(x: 0, y: l))
        path.close()
        triangle1.path = path.cgPath
        triangle1.fillColor = UIColor.red.cgColor
        
        //layer for triangle2
        triangle2.frame = layer.bounds
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 0, y: 0))
        path2.addLine(to: CGPoint(x: l/2, y: l/2))
        path2.addLine(to: CGPoint(x: l, y: 0))
        path2.close()
        triangle2.path = path2.cgPath
        triangle2.fillColor = UIColor.black.cgColor
        
        //layer for triangle3
        triangle3.frame = layer.bounds
        let path3 = UIBezierPath()
        path3.move(to: CGPoint(x: l, y: 0))
        path3.addLine(to: CGPoint(x: l - l/4, y: l/4))
        path3.addLine(to: CGPoint(x: l, y: l/2))
        path3.close()
        triangle3.path = path3.cgPath
        triangle3.fillColor = UIColor.blue.cgColor
        
        //layer for square
        square.frame = layer.bounds
        let squareWidth = (l/2)/sqrt(2)
        square.path = CGPath(rect: CGRect(x: l/2, y: l/2, width: squareWidth, height: squareWidth), transform: nil)
        //square.setAffineTransform(CGAffineTransform(rotationAngle: -45.5))
        square.fillColor = UIColor.green.cgColor
    }
}
