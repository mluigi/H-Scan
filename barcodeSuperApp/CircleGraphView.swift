//
//  CircleGraphView.swift
//  cerchi
//
//  Created by Davide Compagnone on 15/03/18.
//  Copyright © 2018 Davide Compagnone. All rights reserved.
//

import UIKit

class CircleGraphView: UIView {

    var endArc:CGFloat = 0.0{   // in range of 0.0 to 1.0
        didSet{
            
            setNeedsDisplay()
        }
    }
    
    var arcBackgroundColor = UIColor.yellow
    var arcWidth:CGFloat = 35.1
    var arcColor = UIColor.green
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        //var endArc:CGFloat = 0.0 // in range of 0.0 to 1.0
        
       
        
        
        //Important constants for circle
        let fullCircle = 2.0 * CGFloat(Double.pi)
        let start:CGFloat = -0.25 * fullCircle
        let end:CGFloat = endArc * fullCircle + start
        
        //centro del rettangolo
        var centerX = rect.midX
        var centerY = rect.midY
        var center = CGPoint (x: centerX, y: centerY)
        
        
        //define the radius by the smallest side of the view
        var radius:CGFloat = 0.0
        
        if rect.width < rect.height {
            radius = (rect.width - arcWidth) / 2.0
        }else{
            radius = (rect.height - arcWidth) / 2.0
        }

        //starting point for all drawing code is getting the context.
        let context = UIGraphicsGetCurrentContext()
        
        //set colorspace
        let colorspace = CGColorSpaceCreateDeviceRGB()
            
        
        //set line attributes
        context!.setLineWidth(arcWidth) // in modo da fare dei bordi all'arcp
        context!.setLineCap(.round)
        
        //per lo sfondo dell'arco
        //CGContextSetStrokeColorWithColor(context, arcBackgroundColor.CGColor)
        //CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, 0, fullCircle, 0)
       // CGContextStrokePath(context)
        
        context?.setStrokeColor(arcBackgroundColor.cgColor)
        context?.addArc(center: center, radius: radius, startAngle: 0, endAngle: fullCircle, clockwise: false)
        context?.strokePath()
        
        //linea dell'arco
        
        //CGContextSetLineWidth(context, lineWidth* 0.8)
        context?.setLineWidth( arcWidth * 0.9)
        
        
        //Disegno dell'arco di interesse
        
        context!.setStrokeColor(arcColor.cgColor)
        //CGContextSetLineCap(context, kCGLineCapRound)
        //CGContextSetStrokeColorWithColor(context!!, arcColor.CGColor)
        
        //CGContextAddArc(context, centerPoint.x, centerPoint.y, radius, start, end, 0)
        //CGContextStrokePath(context)
        
        context?.addArc(center: center, radius: radius, startAngle: start, endAngle: end, clockwise: false)
        context?.strokePath()
        
        
        
        
        
    }
    

}
