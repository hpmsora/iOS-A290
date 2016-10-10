//
//  ConcentratedView.swift
//  Concentrated
//
//  Created by Bailey, Erik D on 9/26/16.
//  Copyright © 2016 Bailey, Erik D. All rights reserved.
//

import UIKit

class ConcentratedView: UIView{
    
    override func drawRect(rect: CGRect) {
        
        //create path that can be used for drawing
        let path = UIBezierPath()
        
        //prepare the path by adding some geometric shapes to it
        var r = 20 as CGFloat
        
        if path.currentPoint.x != 160 {
        
        while r < 70 {
            path.addArcWithCenter(
            CGPoint(x: 100, y: 100),
            radius: r,
            startAngle: 0,
            endAngle: 6.28,
            clockwise: true)
            path.stroke()
            r += 5
        }
        
        } else {
            r = 50
            while r < 120 {
                path.addArcWithCenter(
                    CGPoint(x: 100, y: 100),
                    radius: r,
                    startAngle: 0,
                    endAngle: 6.28,
                    clockwise: true)
                path.stroke()
                r += 5
            }
        }
        path.moveToPoint(CGPoint(x: 160, y:100))
        
        
        
        
    }
}
