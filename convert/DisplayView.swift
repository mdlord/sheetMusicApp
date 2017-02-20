//
//  DisplayView.swift
//  convert
//
//  Created by Mayank Daswani on 2/20/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit

class DisplayView: UIView {

    fileprivate let gradientLayer = CAGradientLayer()
    fileprivate let plotView =      PlotView()
    
    var amplitude: Double = 0.0 {
        didSet {
            plotView.amplitude = amplitude
        }
    }
    
    var frequency: Double = 0.0 {
        didSet {
            plotView.frequency = frequency
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        plotView.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
        plotView.frame = self.bounds
        self.addSubview(plotView)
        
        gradientLayer.colors     = [ UIColor.clear.cgColor,
                                     UIColor.black.cgColor,
                                     UIColor.clear.cgColor ]
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint   = CGPoint(x: 1.0, y: 0.0)
        self.layer.mask = gradientLayer
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        let maskLayer = CAShapeLayer()
        maskLayer.path      = UIBezierPath(ovalIn: self.bounds).cgPath
        gradientLayer.frame = self.bounds
        gradientLayer.mask  = maskLayer
    }


}
