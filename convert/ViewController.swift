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
        
        let btn: UIButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        btn.backgroundColor = UIColor.red
        btn.setTitle("Piano", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.tag = 1
        self.view.addSubview(btn)
        
        let labelss = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 21))
        labelss.center = CGPoint(x: 160, y: 285)
        labelss.textAlignment = .center
        labelss.textColor = .white

        
        
        /* Start the tuner. */
        tuner.delegate = self
        tuner.startMonitoring()
        
        
    }
    
    func buttonAction(sender: UIButton!) {
        var btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            print("Piano")
            self.performSegue(withIdentifier: "PianoSegue", sender: self)
        }
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    func tunerDidMeasurePitch(_ pitch: Pitch, withDistance distance: Double,
                              amplitude: Double) {
        /* Scale the amplitude to make it look more dramatic. */
        displayView.amplitude = min(1.0, amplitude * 25.0)
        displayView.frequency = pitch.frequency
        
        if amplitude < 0.02 {
            return
        }
        
//        knobView.pitch = pitch
        
        print(pitch.description)
        
        
        /* Calculate the difference between the nearest pitch and the second
         * nearest pitch to express the distance in a percentage. */
//        let previous   = pitch - 1
//        let next       = pitch + 1
//        let difference = distance < 0 ?
//            (pitch.frequency - previous.frequency) :
//            (next.frequency  - pitch.frequency)
//        
       //n knobView.distance = distance / difference / 2.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  

}

