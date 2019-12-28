//
//  CustomTabBar.swift
//  Wayfinder
//
//  Created by andre insigne on 03/04/2018.
//  Copyright © 2018 andre insigne. All rights reserved.
//

import UIKit

class CustomTabBar : UITabBar {
    @IBInspectable var height: CGFloat = 0.0

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 200
  
        return sizeThatFits
    }
    
   
}
