//
//  TangramBoard.swift
//  Tangram
//
//  Created by Bruno Scheltzke on 05/10/17.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import UIKit

class TangramBoard: UIView {
    var triangle1 = CAShapeLayer()
    let triangle2 = CAShapeLayer()
    let triangle3 = CAShapeLayer()
    let triangle4 = CAShapeLayer()
    let triangle5 = CAShapeLayer()
    let square = CAShapeLayer()
    let parallelogram = CAShapeLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.addSublayer(triangle1)
        self.layer.addSublayer(triangle2)
        self.layer.addSublayer(triangle3)
        self.layer.addSublayer(square)
        self.layer.addSublayer(triangle4)
        self.layer.addSublayer(triangle5)
        self.layer.addSublayer(parallelogram)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        createLayers()
    }
    
    func createLayers() {
        let l = frame.width
        let hipotenusa = l/2 * sqrt(2)
        
        //layer for triangle1
        triangle1.frame = CGRect(x: 0, y: 0, width: l/2, height: l)
        triangle1.path = createTrianglePath(width: l/2, height: l)
        triangle1.fillColor = UIColor.red.cgColor
        
        //layer for triangle2
        triangle2.frame = CGRect(x: 0, y: 0, width: l/2, height: l)
        triangle2.path = createTrianglePath(width: l/2, height: l)
        triangle2.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat.pi/2))
        triangle2.frame.origin.x = 0
        triangle2.frame.origin.y = 0
        triangle2.fillColor = UIColor.black.cgColor
        
        //layer for triangle3
        triangle3.frame = CGRect(x: 0, y: 0, width: l/4, height: l/2)
        triangle3.path = createTrianglePath(width: l/4, height: l/2)
        triangle3.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat.pi))
        triangle3.frame.origin.x = l - l/4
        triangle3.fillColor = UIColor.blue.cgColor
        
        //layer for square
        let squareWidth = (l/2)/sqrt(2)
        square.frame = CGRect(x: 0, y: 0, width: squareWidth, height: squareWidth)
        square.path = CGPath(rect: square.frame, transform: nil)
        square.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat.pi/4))
        square.frame.origin.x = l - l/4
        square.frame.origin.y = l/4
        square.backgroundColor = UIColor.blue.cgColor
        square.fillColor = UIColor.green.cgColor
        
        //layer for triangle4
        let t4height = l/2 * sqrt(2)
        triangle4.frame = CGRect(x: 0, y: 0, width: hipotenusa/2, height: t4height)
        triangle4.path = createTrianglePath(width: hipotenusa/2, height: t4height)
        triangle4.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat.pi/4))
        triangle4.frame.origin.x = l
        triangle4.frame.origin.y = l/2
        triangle4.fillColor = UIColor.yellow.cgColor
        
        triangle5.frame = CGRect(x: 0, y: 0, width: l/4, height: l/2)
        triangle5.path = createTrianglePath(width: l/4, height: l/2)
        triangle5.setAffineTransform(CGAffineTransform(rotationAngle: -CGFloat.pi/2))
        triangle5.frame.origin = CGPoint(x: l/4, y: l/2)
        triangle5.fillColor = UIColor.purple.cgColor
        
        parallelogram.frame = CGRect(x: 0, y: 0, width: l - l / 4, height: l / 4)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: l / 4, y: 0))
        path.addLine(to: CGPoint(x: l - l / 4, y:  0))
        path.addLine(to: CGPoint(x: l / 2, y: l / 4))
        path.addLine(to: CGPoint(x: 0, y: l / 4))
        path.close()
        parallelogram.frame.origin.x =  0
        parallelogram.frame.origin.y = l - l / 4
        parallelogram.path = path.cgPath
        parallelogram.fillColor = UIColor.cyan.cgColor
    }
    
    func createTrianglePath(width: CGFloat, height: CGFloat) -> CGPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: height/2))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.close()
        
        return path.cgPath
    }
}
