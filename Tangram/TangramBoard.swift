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
        let triangle1Width = frame.width/2
        let triangle1Height = frame.height
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: triangle1Width, y: triangle1Height/2))
        path.addLine(to: CGPoint(x: 0, y: triangle1Height))
        path.close()
        
        triangle1.path = path.cgPath
        triangle1.lineWidth = 2.0
        triangle1.fillColor = UIColor.red.cgColor
        
        self.layer.addSublayer(triangle1)
    }
}
