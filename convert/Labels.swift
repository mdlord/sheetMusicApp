//
//  Labels.swift
//  convert
//
//  Created by Mayank Daswani on 2/22/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit

class Labelsdisp: UIView {

//    fileprivate let thinLayer   = CAShapeLayer()
//    fileprivate let thickLayer  = CAShapeLayer()
//    fileprivate let arrowLayer  = CAShapeLayer()
//    fileprivate let stableLayer = CALayer()
//    fileprivate let turnLayer   = CALayer()
    

    
    //fileprivate let labels      = (0 ... 1).map { _ in CATextLayer() }
    //fileprivate var timer: Timer?
    
//    var distance: Double = 0 {
//        didSet {
//            let angle = CGFloat(distance * M_PI)
//            //turnLayer.setAffineTransform(CGAffineTransform(rotationAngle: -angle))
//            
//            for label in labels {
//                label.setAffineTransform(CGAffineTransform(rotationAngle: angle))
//            }
//        }
//    }
    
    var pitch: Pitch? = nil {
        didSet {
            let labelss = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 21))
            labelss.center = CGPoint(x: 160, y: 285)
            labelss.textAlignment = .center
            labelss.textColor = .white

            if pitch != nil {
//                updated = 1
//                UIView.animate(withDuration: 0.2, delay: 0.0,
//                               usingSpringWithDamping: 1.0,
//                               initialSpringVelocity: 0.0,
//                               options: .curveLinear, animations: {
//                                self.alpha = 1.0
//                }, completion: nil)
//                
                                //labelss.fontSize = 17.0
                labelss.text = (pitch!).description
                //print((pitch! + 2 - 2).description)
                
//                for (i, label) in labels.enumerated() {
//                    label.string = (pitch! + i - 2).description
//                    print((pitch! + 2 - 2).description)
//                    label.string = (pitch! + i - 2).description
//                }
//            }else {
//                //lebelss.text = "--"
//                for label in labels {
//                    label.string = ""
//                }
//            }
        }
    }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
      
        
        let labelss = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        labelss.center = CGPoint(x: 160, y: 285)
        labelss.textAlignment = .center
        labelss.text = "I'am a test label"
        //self.view.addSubview(labelss)
        
//        for (i, label) in labels.enumerated() {
//            label.frame               = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 40.0)
//            label.alignmentMode       = kCAAlignmentCenter
//            label.contentsScale       = UIScreen.main.scale
//            label.foregroundColor     = UIColor.white.cgColor
//            label.font                = UIFont.systemFont(ofSize: 17, weight: UIFontWeightUltraLight)
//            label.fontSize            = 17.0
//            
//            if i == 1 {
//                label.font            = UIFont.systemFont(ofSize: 36, weight: UIFontWeightUltraLight)
//                label.fontSize       *= 2.0
//            }
        
           // turnLayer.addSublayer(label)
        //}
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
    override var frame: CGRect {
        didSet {
            
            let labelss = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            labelss.center = CGPoint(x: 160, y: 285)
            labelss.textAlignment = .center
            labelss.text = "I'am a test label"
            
            
//            for (i, label) in labels.enumerated() {
//                let offset: CGFloat = 30.0 + (i == 2 ? 50.0 : 0.0)
//                
//                let half = CGSize(width: self.bounds.width / 2.0 + offset, height: self.bounds.height / 2.0 + offset)
//                let center = CGPoint(x: half.width - half.width * sin(CGFloat(i - 5) / 6 * 2 * 3.14) - offset,
//                                     y: half.height + half.height * cos(CGFloat(i - 5) / 6 * 2 * 3.14) - offset)
//                label.frame.origin.x = center.x - label.frame.size.width / 2.0
//                label.frame.origin.y = center.y - label.frame.size.height / 2.0
//            }
        }
    }
//
    override func didMoveToWindow() {
        super.didMoveToWindow()
        

    }
//
//    fileprivate var updated = 0
//    
}
