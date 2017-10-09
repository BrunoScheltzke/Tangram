//
//  CALayer.swift
//  Tangram
//
//  Created by Bruno Scheltzke on 09/10/17.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import UIKit

fileprivate let positionKey = "position"
fileprivate let rotation = "transform.rotation"

extension CALayer {
    func animate(angleRotation: Double, finalPosition: CGPoint, duration: TimeInterval) {
        if self.position != finalPosition {
            let initialPosition = self.position
            
            position = finalPosition
            
            let rotateAnimation = CABasicAnimation(keyPath: rotation)
            rotateAnimation.fromValue = value(forKeyPath: rotation)
            rotateAnimation.toValue = angleRotation
            rotateAnimation.duration = duration

            let moveAnimation = CABasicAnimation(keyPath: positionKey)
            moveAnimation.fromValue = initialPosition
            moveAnimation.duration = duration
            moveAnimation.toValue = finalPosition
            
            add(rotateAnimation, forKey: rotation)
            setValue(angleRotation, forKeyPath: rotation)
            add(moveAnimation, forKey: positionKey)
        }
    }
}
