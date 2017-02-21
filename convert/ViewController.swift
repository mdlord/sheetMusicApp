//
//  ViewController.swift
//  convert
//
//  Created by Mayank Daswani on 1/27/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit
import AudioKit
import AVFoundation

class ViewController: UIViewController, TunerDelegate {
    
    let tuner       = Tuner()
    let displayView = DisplayView()
    //let knobView    = KnobView(frame: CGRect(x: 0, y: 0, width: 245, height: 245))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Update the background color. */
        self.view.backgroundColor = .black
        
        /* Setup the display view. */
        displayView.frame = CGRect(
            origin: CGPoint(x: round(self.view.bounds.width - 450)  / 2,
                            y: round(self.view.bounds.height - 300) / 1),
            size:   CGSize(width: 450, height: 170)
        )
        self.view.addSubview(displayView)
        
        /* Setup the knob view. */
//        knobView.frame = CGRect(
//            origin: CGPoint(x: round(self.view.bounds.width - 245) / 2,
//                            y: round(self.view.bounds.height - 245) / 2),
//            size:   CGSize(width: 245, height: 245)
//        )
//        self.view.addSubview(knobView)
        
        /* Start the tuner. */
        tuner.delegate = self
        tuner.startMonitoring()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    func tunerDidMeasurePitch(_ pitch: Pitch, withDistance distance: Double,
                              amplitude: Double) {
        /* Scale the amplitude to make it look more dramatic. */
        displayView.amplitude = min(1.0, amplitude * 25.0)
        displayView.frequency = pitch.frequency
        
        if amplitude < 0.01 {
            return
        }
        
       // knobView.pitch = pitch
        
        /* Calculate the difference between the nearest pitch and the second
         * nearest pitch to express the distance in a percentage. */
        let previous   = pitch - 1
        let next       = pitch + 1
        let difference = distance < 0 ?
            (pitch.frequency - previous.frequency) :
            (next.frequency  - pitch.frequency)
        
       //n knobView.distance = distance / difference / 2.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  

}

