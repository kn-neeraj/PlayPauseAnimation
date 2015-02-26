//
//  TriangleShapeLayer.swift
//  SignatureAnimation
//
//  Created by Neeraj Kumar on 22/02/15.
//  Copyright (c) 2015 Neeraj Kumar. All rights reserved.
//

import UIKit

class TriangleShapeLayer: CAShapeLayer {

    override var bounds : CGRect {
        didSet {
            path = self.shapeForBounds(bounds).CGPath
        }
    }
    
    
    func shapeForBounds(rect: CGRect) -> UIBezierPath {
        // Triangle side length 
        let length = rect.size.height
        let point1 = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect))
        let point2 = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect))
        let point3 = CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect))
        
        let trianglePath = UIBezierPath()
        trianglePath.moveToPoint(point1)
        trianglePath.addLineToPoint(point2)
        trianglePath.addLineToPoint(point3)
        trianglePath.closePath()
        return trianglePath
    }
    
    override func addAnimation(anim: CAAnimation!, forKey key: String!) {
        super.addAnimation(anim, forKey: key)
        
        if (anim.isKindOfClass(CABasicAnimation.self)) {
            let basicAnimation = anim as CABasicAnimation
            if (basicAnimation.keyPath == "bounds.size") {
               var pathAnimation = basicAnimation.mutableCopy() as CABasicAnimation
                pathAnimation.keyPath = "path"
                pathAnimation.fromValue = self.path
                pathAnimation.toValue = self.shapeForBounds(self.bounds).CGPath
                self.removeAnimationForKey("path")
                self.addAnimation(pathAnimation,forKey: "path")
            }
        }
    }
}
