//
//  HomeTabBarController.swift
//  Slowpost
//
//  Created by Evan Waters on 7/23/15.
//  Copyright (c) 2015 Evan Waters. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        modalPresentationStyle = UIModalPresentationStyle.OverFullScreen

    }

}
