//
//  PauseLayer.swift
//  SignatureAnimation
//
//  Created by Neeraj Kumar on 23/02/15.
//  Copyright (c) 2015 Neeraj Kumar. All rights reserved.
//

import UIKit

class PauseLayer: CAShapeLayer {
    
    override var bounds : CGRect {
        didSet {
            path = self.shapeForBounds(bounds, width: bounds.size.width/3.0).CGPath
        }
    }
    
    
    func shapeForBounds(rect: CGRect, width:CGFloat) -> UIBezierPath {
    
        let shapeWidth = width
        let point0 = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect))
        let point1 = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect))
        let point2 = CGPointMake(CGRectGetMinX(rect) + shapeWidth, CGRectGetMaxY(rect))
        let point3 = CGPointMake(CGRectGetMinX(rect) + shapeWidth, CGRectGetMinY(rect))
        let point4 = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect))
        
        let point5 = CGPointMake(CGRectGetMinX(rect) + shapeWidth + 15.0, CGRectGetMaxY(rect))
        let point6 = CGPointMake(CGRectGetMinX(rect) + shapeWidth + 15.0, CGRectGetMinY(rect))
        let point7 = CGPointMake(CGRectGetMinX(rect) + shapeWidth + 15.0 + shapeWidth, CGRectGetMinY(rect))
        let point8 = CGPointMake(CGRectGetMinX(rect) + shapeWidth + 15.0 + shapeWidth, CGRectGetMaxY(rect))
        
        
        let customPath = UIBezierPath()
        customPath.moveToPoint(point0)
        customPath.addLineToPoint(point1)
        customPath.addLineToPoint(point2)
        customPath.addLineToPoint(point3)
        customPath.addLineToPoint(point4)
        
        customPath.moveToPoint(point5)
        customPath.addLineToPoint(point6)
        customPath.addLineToPoint(point7)
        customPath.addLineToPoint(point8)
        
        
        return customPath
    }
    
    
    override func addAnimation(anim: CAAnimation!, forKey key: String!) {
        super.addAnimation(anim, forKey: key)
        
        if (anim.isKindOfClass(CABasicAnimation.self)) {
            let basicAnimation = anim as CABasicAnimation
            if (basicAnimation.keyPath == "bounds.size") {
                var pathAnimation = basicAnimation.mutableCopy() as CABasicAnimation
                pathAnimation.keyPath = "path"
                pathAnimation.fromValue = self.path
                pathAnimation.toValue = self.shapeForBounds(self.bounds, width: self.bounds.size.width/3.0).CGPath
                self.removeAnimationForKey("path")
                self.addAnimation(pathAnimation,forKey: "path")
            }
        }
    }

    
}
