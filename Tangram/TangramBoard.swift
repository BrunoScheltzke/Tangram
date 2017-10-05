//
//  TangramBoard.swift
//  Tangram
//
//  Created by Bruno Scheltzke on 05/10/17.
//  Copyright © 2017 Bruno Scheltzke. All rights reserved.
//

import UIKit

class TangramBoard: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        createLayers()
    }
    
    func createLayers() {
        let triangle1 = CAShapeLayer()
        triangle1.frame = layer.bounds
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: frame.width/2, y: frame.height/2))
        path.addLine(to: CGPoint(x: 0, y: frame.height))
        path.close()
        
        triangle1.path = path.cgPath
        triangle1.fillColor = UIColor.red.cgColor
        
        self.layer.addSublayer(triangle1)
        
        let triangle2 = CAShapeLayer()
        triangle2.frame = layer.bounds
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: 0, y: 0))
        path2.addLine(to: CGPoint(x: frame.width/2, y: frame.height/2))
        path2.addLine(to: CGPoint(x: frame.width, y: 0))
        path2.close()
        
        triangle2.path = path2.cgPath
        triangle2.fillColor = UIColor.black.cgColor
        
        self.layer.addSublayer(triangle2)
    }
}
