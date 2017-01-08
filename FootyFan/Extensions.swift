//
//  Extensions.swift
//  FootyFan
//
//  Created by Loveneet Sharma on 08/01/17.
//  Copyright © 2017 Ritesh Chopra. All rights reserved.
//

import Foundation


public extension  UIView
{
    
    
    func roundedTopCorners()
    {
        let path = UIBezierPath(roundedRect:self.bounds,
                                byRoundingCorners:[.topLeft, .topRight],
                                cornerRadii: CGSize(width: 10, height:  10))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
 
    
}
