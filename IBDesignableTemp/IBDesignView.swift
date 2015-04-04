//
//  IBDesignView.swift
//  IBDesignableTemp
//
//  Created by Mohsin on 04/04/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

@IBDesignable class IBDesignView: UIView {

    
    
    // Only override drawRect: if you perform custom drawing.
   //  An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {

        var circle = UIBezierPath(arcCenter: self.center, radius: 50.0, startAngle: 0, endAngle: 360, clockwise: true)
        UIColor.grayColor().setStroke()
        circle.lineWidth=10
        circle.stroke()
        
    }
    

}
