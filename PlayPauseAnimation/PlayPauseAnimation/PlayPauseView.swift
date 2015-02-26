//
//  PlayPauseView.swift
//  PlayPauseAnimation
//
//  Created by Neeraj Kumar on 24/02/15.
//  Copyright (c) 2015 Neeraj Kumar. All rights reserved.
//

import UIKit

enum ViewState{
    // When the play button is visible
    case Play
    // When the pause button is visible.
    case Pause
}

class PlayPauseView: UIView {
    
    private var playView:PlayView!
    private var pauseView:PauseView!
    private var transparentButton:UIButton!
    
    // TODO:Only expose get.
    var currentState:ViewState!
    
    // Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func didTapView() {
        // fire animation on the basis of state.
        performAnimation(currentState, duration:0.3, delay: 0.0)
        
        // tell the delegate that button is tapped.
    }

}

private extension PlayPauseView {
    
    func commonInit() {
        
        let defaultWidth:CGFloat = 60.0
        currentState = .Play
        let viewBounds = self.bounds
        playView = PlayView(frame: CGRectMake(CGRectGetMidX(viewBounds) - defaultWidth/2.0, CGRectGetMidY(viewBounds) - defaultWidth/2.0, defaultWidth, defaultWidth))
        playView.backgroundColor = UIColor(red: 130.0/255.0, green: 129.0/255.0, blue: 130.0/255.0, alpha: 1.0)
        //playView.alpha = 0.0
        
        pauseView = PauseView(frame:CGRectMake(CGRectGetMidX(viewBounds) - defaultWidth/2.0 - defaultWidth, CGRectGetMidY(viewBounds) - defaultWidth/2.0, 0.0, defaultWidth))
        pauseView.backgroundColor = UIColor(red: 130.0/255.0, green: 129.0/255.0, blue: 130.0/255.0, alpha: 1.0)
        pauseView.alpha = 0.0
        
        transparentButton = UIButton(frame:viewBounds)
        transparentButton.addTarget(self, action: Selector("didTapView"), forControlEvents: .TouchUpInside)
        transparentButton.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.0)
        transparentButton.alpha = 1.0
        
        self.addSubview(playView)
        self.addSubview(pauseView)
        self.addSubview(transparentButton)
    }
    
    
    func performAnimation(animationType:ViewState, duration:NSTimeInterval, delay:NSTimeInterval) {
        
        self.userInteractionEnabled = false
        
        let defaultWidth:CGFloat = 60.0
        let displacement:CGFloat = 60.0
        let oldPlayBounds  = playView.bounds
        var newPlayBounds = oldPlayBounds
        var oldPlayFrame = playView.frame
        var newPlayFrame = oldPlayFrame
        var newPlayAlpha:CGFloat  = 0.0
        
        let oldPauseFrame = pauseView.frame
        var newPauseFrame =  oldPauseFrame
        var newPauseAlpha:CGFloat = 0.0
        
        switch(animationType) {
        case .Play:
            newPlayAlpha = 0.0
            newPlayFrame = CGRectMake(oldPlayFrame.origin.x + displacement, oldPlayFrame.origin.y + defaultWidth/2.0, oldPlayBounds.size.width, 0.0)
            newPauseFrame = CGRectMake(oldPauseFrame.origin.x + displacement, oldPauseFrame.origin.y, defaultWidth, oldPauseFrame.size.height)
            newPauseAlpha = 1.0
            
            
        case .Pause:
            newPlayAlpha = 1.0
            newPlayFrame = CGRectMake(oldPlayFrame.origin.x - displacement, oldPlayFrame.origin.y - defaultWidth/2.0, defaultWidth, defaultWidth)
            newPauseFrame = CGRectMake(oldPauseFrame.origin.x - displacement, oldPauseFrame.origin.y, 0.0, oldPauseFrame.size.height)
            newPauseAlpha = 0.0
        }
        
        
        UIView.animateWithDuration(duration, delay: delay, options:.CurveEaseInOut, animations: { () -> Void in
            
            self.playView.alpha = newPlayAlpha
            self.playView.frame = newPlayFrame
            
            self.pauseView.alpha = newPauseAlpha
            self.pauseView.frame = newPauseFrame
            
            }) { (Bool) -> Void in
                
                 self.userInteractionEnabled = true
                if (self.currentState == .Play) {
                   self.currentState = .Pause
                }
                else {
                    self.currentState = .Play
                }
        }
    }
    
}
