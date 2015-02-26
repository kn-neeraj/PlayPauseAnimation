//
//  PauseView.swift
//  SignatureAnimation
//
//  Created by Neeraj Kumar on 23/02/15.
//  Copyright (c) 2015 Neeraj Kumar. All rights reserved.
//

import UIKit

class PauseView: UIView {

    var shapeLayer:CAShapeLayer! {
        return self.layer as CAShapeLayer
    }
    
    override class func layerClass() -> AnyClass {
        return PauseLayer.self
    }
    
    // override backgroundColor.
    
    override var backgroundColor: UIColor? {
        get {
            return UIColor(CGColor : shapeLayer.fillColor)
        }
        
        set {
            shapeLayer.fillColor = newValue!.CGColor
        }
    }
    
//    func addAnim(duration:NSTimeInterval, delay:NSTimeInterval, widthToAnimate:CGFloat) {
//        let pauseLayer = shapeLayer as PauseLayer
//        pauseLayer.addAnim(duration, delay: delay, widthToAnimate: widthToAnimate)
//    }

}
