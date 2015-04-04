//
//  IBDesignView.swift
//  IBDesignableTemp
//
//  Created by Mohsin on 04/04/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

@IBDesignable class IBDesignView: UIView {
    
    // MARK: Inspectable properties ******************************
    
    @IBInspectable var startColor: UIColor = UIColor.whiteColor() {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var endColor: UIColor = UIColor.blackColor() {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = false {
        didSet{
            setupView()
        }
    }
    
    @IBInspectable var roundness: CGFloat = 0.0 {
        didSet{
            setupView()
        }
    }
    
    
    var tempView : UIView!
    
    // Helper to return the main layer as CAGradientLayer
    var gradientLayer: CAGradientLayer {
        return layer as CAGradientLayer
    }
    
    
    override class func layerClass()->AnyClass{
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    
    // Setup the view appearance
    private func setupView(){
        
        self.tempView = UIView(frame: CGRect(x: 10.0 , y: 10.0, width: 20.0, height: 20.0))
        
        let colors:Array = [startColor.CGColor, endColor.CGColor]
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = roundness
        
        if (isHorizontal){
            gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        }else{
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
        
        self.setNeedsDisplay()
        
    }
    
}



@IBDesignable class Circle: UIView {
    
    
    override func drawRect(rect: CGRect) {
        
//        var circle = UIBezierPath(arcCenter: self.center, radius: (self.frame.size.width/2)-5, startAngle: 10, endAngle: 130, clockwise: true)
//        UIColor.grayColor().setStroke()
//        circle.lineWidth=10
//        circle.stroke()
     
        let path : CGMutablePathRef = CGPathCreateMutable()
        
        CGPathMoveToPoint(path, nil, self.frame.origin.x, self.frame.origin.y)
        
        CGPathAddLineToPoint(path, nil, self.frame.origin.x+50, self.frame.origin.y+10)
        CGPathAddLineToPoint(path, nil, self.frame.origin.x+50, self.frame.origin.y+50)
        CGPathCloseSubpath(path)
        
        
        var line = UIBezierPath(CGPath: path)
        line.lineWidth = 5
        UIColor.grayColor().setStroke()
        line.stroke()
    
        println(path)
    }
    
}



// we can also extend the it by using the 
extension UIView {
    @IBInspectable var cornerRadious : CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
        }
    }
}

