//
//  ViewController.swift
//  PlayPauseAnimation
//
//  Created by Neeraj Kumar on 24/02/15.
//  Copyright (c) 2015 Neeraj Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var playPauseView:PlayPauseView!
    var button:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Chose an appropriate size.
        playPauseView = PlayPauseView(frame:CGRectMake(50, 50, 200 ,200))
        view.addSubview(playPauseView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

