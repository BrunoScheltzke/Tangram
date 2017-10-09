//
//  TangramBoard.swift
//  Tangram
//
//  Created by Bruno Scheltzke on 05/10/17.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import UIKit

enum Form {
    case tangram, cat, camel, goat
}

class TangramBoard: UIView {
    
    private var currentForm: Form = .tangram
    private var l: CGFloat!
    private var hipotenusa: CGFloat!
    
    let position = "position"
    let rotation = "transform.rotation"
    
    var triangle1 = CAShapeLayer()
    let triangle2 = CAShapeLayer()
    let triangle3 = CAShapeLayer()
    let triangle4 = CAShapeLayer()
    let triangle5 = CAShapeLayer()
    let square = CAShapeLayer()
    let parallelogram = CAShapeLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        l = frame.width
        hipotenusa = l/2 * sqrt(2)
        
        self.layer.addSublayer(triangle1)
        self.layer.addSublayer(triangle2)
        self.layer.addSublayer(triangle3)
        self.layer.addSublayer(square)
        self.layer.addSublayer(triangle4)
        self.layer.addSublayer(triangle5)
        self.layer.addSublayer(parallelogram)
        
        createLayers()
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        switch currentForm {
//        case .camel:
//            makeCamel()
//        case .cat:
//            makeCat()
//        case .goat:
//            makeGoat()
//        default:
//            makeTangram()
//        }
//    }
//
    func makeTangram() {
        triangle2.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat.pi/2))
        triangle2.frame.origin.x = 0
        triangle2.frame.origin.y = 0
        
        triangle3.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat.pi))
        triangle3.frame.origin.x = l - l/4
        
        square.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat.pi/4))
        square.frame.origin.x = l - l/4
        square.frame.origin.y = l/4
        
        triangle4.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat.pi/4))
        triangle4.frame.origin.x = l
        triangle4.frame.origin.y = l/2
        
        triangle5.setAffineTransform(CGAffineTransform(rotationAngle: -CGFloat.pi/2))
        triangle5.frame.origin = CGPoint(x: l/4, y: l/2)
        
        parallelogram.frame.origin.x =  0
        parallelogram.frame.origin.y = l - l / 4
    }
    
    func makeCamel() {
        
    }
    
    func makeCat() {
    }
    
    func makeGoat() {
        let initialPosition = CGPoint(x: triangle5.position.x, y: triangle5.position.y)
        triangle5.position = CGPoint(x: l/4, y: l)
        let animation = CABasicAnimation(keyPath: position)
        animation.fromValue = initialPosition
        animation.toValue = [l/4, l]
        
        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.fromValue = triangle5.value(forKeyPath: "transform.rotation")
        rotate.toValue = Double.pi/4
        triangle5.setValue(Double.pi/4, forKeyPath: "transform.rotation")

        let groupAnimations = CAAnimationGroup()
        groupAnimations.animations = [rotate, animation]
        groupAnimations.duration = 3
        triangle5.add(groupAnimations, forKey: nil)
    }
    
    func createLayers() {
        //layer for triangle1
        triangle1.frame = CGRect(x: 0, y: 0, width: l/2, height: l)
        triangle1.path = createTrianglePath(width: l/2, height: l)
        triangle1.fillColor = UIColor.red.cgColor
        
        //layer for triangle2
        triangle2.frame = CGRect(x: 0, y: 0, width: l/2, height: l)
        triangle2.path = createTrianglePath(width: l/2, height: l)
        triangle2.fillColor = UIColor.black.cgColor
        
        //layer for triangle3
        triangle3.frame = CGRect(x: 0, y: 0, width: l/4, height: l/2)
        triangle3.path = createTrianglePath(width: l/4, height: l/2)
        triangle3.fillColor = UIColor.blue.cgColor
        
        //layer for square
        let squareWidth = (l/2)/sqrt(2)
        square.frame = CGRect(x: 0, y: 0, width: squareWidth, height: squareWidth)
        square.path = CGPath(rect: square.frame, transform: nil)
        square.backgroundColor = UIColor.blue.cgColor
        square.fillColor = UIColor.green.cgColor
        
        //layer for triangle4
        let t4height = l/2 * sqrt(2)
        triangle4.frame = CGRect(x: 0, y: 0, width: hipotenusa/2, height: t4height)
        triangle4.path = createTrianglePath(width: hipotenusa/2, height: t4height)
        triangle4.fillColor = UIColor.yellow.cgColor
        
        triangle5.frame = CGRect(x: 0, y: 0, width: l/4, height: l/2)
        triangle5.path = createTrianglePath(width: l/4, height: l/2)
        triangle5.fillColor = UIColor.purple.cgColor
        
        parallelogram.frame = CGRect(x: 0, y: 0, width: l - l / 4, height: l / 4)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: l / 4, y: 0))
        path.addLine(to: CGPoint(x: l - l / 4, y:  0))
        path.addLine(to: CGPoint(x: l / 2, y: l / 4))
        path.addLine(to: CGPoint(x: 0, y: l / 4))
        path.close()
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
