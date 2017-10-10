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
            setValue(angleRotation, forKeyPath: rotation)

            let moveAnimation = CABasicAnimation(keyPath: positionKey)
            moveAnimation.fromValue = initialPosition
            moveAnimation.duration = duration
            moveAnimation.toValue = finalPosition
            
            let groupAnimations = CAAnimationGroup()
            groupAnimations.animations = [moveAnimation, rotateAnimation]
            groupAnimations.duration = 3
            add(groupAnimations, forKey: nil)
        }
    }
    
    func animate(angleRotation: Double, finalPositionX: CGFloat, finalPositionY: CGFloat, duration: TimeInterval){
        let finalPosition = CGPoint(x: finalPositionX, y: finalPositionY)
        
        if self.position != finalPosition {
            let initialPosition = self.position
            
            position = finalPosition
            
            let rotateAnimation = CABasicAnimation(keyPath: rotation)
            rotateAnimation.fromValue = value(forKeyPath: rotation)
            rotateAnimation.toValue = angleRotation
            rotateAnimation.duration = duration
            setValue(angleRotation, forKeyPath: rotation)
            
            let moveAnimation = CABasicAnimation(keyPath: positionKey)
            moveAnimation.fromValue = initialPosition
            moveAnimation.duration = duration
            moveAnimation.toValue = finalPosition
            
            let groupAnimations = CAAnimationGroup()
            groupAnimations.animations = [moveAnimation, rotateAnimation]
            groupAnimations.duration = 3
            add(groupAnimations, forKey: nil)
        }
    }
}
