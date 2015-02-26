//
//  PlayView.swift
//  SignatureAnimation
//
//  Created by Neeraj Kumar on 22/02/15.
//  Copyright (c) 2015 Neeraj Kumar. All rights reserved.
//

import UIKit

class PlayView: UIView {

    var shapeLayer:CAShapeLayer! {
        return self.layer as CAShapeLayer
    }
    
    override class func layerClass() -> AnyClass {
        return TriangleShapeLayer.self
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
    
}
