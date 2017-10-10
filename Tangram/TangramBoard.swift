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
    
    func makeTangram() {
        triangle1.animate(angleRotation: Double.pi * 4, finalPosition: CGPoint(x: l/4, y: l/2), duration: 3)

        triangle2.animate(angleRotation: Double.pi/2, finalPosition: CGPoint(x: l/2, y: l/4), duration: 2)

        triangle3.animate(angleRotation: Double.pi, finalPosition: CGPoint(x: l - l/8, y: (l/4)), duration: 2)

        square.animate(angleRotation: Double.pi/4, finalPosition: CGPoint(x: l * 0.75, y: l/2), duration: 2)
        
        triangle4.animate(angleRotation: Double.pi/4, finalPosition: CGPoint(x: l - l/8, y: l - l/8), duration: 2)
        
        triangle5.animate(angleRotation: -Double.pi/2, finalPosition: CGPoint(x: l/2, y: l/2 + l/8), duration: 2)
        
        parallelogram.animate(angleRotation: Double.pi, finalPosition: CGPoint(x: l/2 - l/8, y: l - l/8), duration: 2)
        
    }
    
    func makeCamel() {
        
    }
    
    func makeCat() {
        triangle1.animate(angleRotation: Double.pi * 4, finalPosition: CGPoint(x: l/4, y: l/2), duration: 3)

        triangle2.animate(angleRotation: Double.pi/4, finalPosition: CGPoint(x: l/3.1, y: l + sqrt(l/6)), duration: 2)
        
        parallelogram.setValue(Double.pi * 3, forKeyPath: rotation)
        parallelogram.position.x =  l - parallelogram.frame.width/6
        parallelogram.position.y = triangle2.position.y/2 + triangle2.frame.size.height/2
        
        square.setValue(Double.pi/4, forKeyPath: rotation)
        square.position.x = -l/6
        square.position.y = -square.frame.width/6
        
        triangle5.setValue(Double.pi, forKeyPath: rotation)
        triangle5.position = CGPoint(x: square.position.x + triangle5.frame.width/2, y: square.position.y - triangle5.frame.height/2)
        
        triangle3.setValue(Double.pi * 4, forKeyPath: rotation)
        triangle3.position = CGPoint(x: square.position.x - triangle3.frame.width/2, y: square.position.y - triangle5.frame.height/2)
        
        triangle4.setValue(Double.pi, forKeyPath: rotation)
        triangle4.position = CGPoint(x: triangle1.frame.origin.x - triangle4.frame.width/2, y: triangle1.frame.origin.y + triangle4.frame.height/2)
    }
    
    func makeGoat() {
        let initialPosition = CGPoint(x: triangle5.position.x, y: triangle5.position.y)
        triangle5.position = CGPoint(x: l/4, y: l)
        let animation = CABasicAnimation(keyPath: position)
        animation.fromValue = initialPosition
        animation.toValue = [l/4, l]
        
        let rotate = CABasicAnimation(keyPath: rotation)
        rotate.fromValue = triangle5.value(forKeyPath: rotation)
        rotate.toValue = Double.pi/4
        triangle5.setValue(Double.pi/4, forKeyPath: rotation)

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
    
    func animate(layer: CAShapeLayer, angleRotation: Double, finalPosition: CGPoint, duration: TimeInterval) {
//        if layer.position != finalPosition {
//            let initialPosition = layer.position
//
            layer.setValue(angleRotation, forKeyPath: rotation)
            layer.position = finalPosition
//
//            let rotateAnimation = CABasicAnimation(keyPath: rotation)
//            rotateAnimation.fromValue = layer.value(forKeyPath: rotation)
//            rotateAnimation.toValue = angleRotation
//            rotateAnimation.duration = duration
//
//            let moveAnimation = CABasicAnimation(keyPath: position)
//            moveAnimation.fromValue = initialPosition
//            moveAnimation.duration = duration
//            moveAnimation.toValue = finalPosition
//
//            layer.add(rotateAnimation, forKey: rotation)
//            layer.add(moveAnimation, forKey: position)
//        }
    }
}
