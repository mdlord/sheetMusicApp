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

    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    var tunerstart = false
    
    let btn: UIButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
    let startbtn: UIButton = UIButton(frame: CGRect(x: 800, y: 700, width: 200, height: 50))
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Update the background color. */
        self.view.backgroundColor = .black
        title = "Tuner".uppercased()
        
        /* Setup the display view. */
        displayView.frame = CGRect(
            origin: CGPoint(x: round(self.view.bounds.width - 450)  / 2,
                            y: round(self.view.bounds.height - 300) / 1),
            size:   CGSize(width: 450, height: 170)
        )
        
        
        self.view.addSubview(displayView)
        
        btn.backgroundColor = UIColor(red: 117/255, green: 117/277, blue: 145/255, alpha: 0.5)
        btn.setTitle("Piano", for: .normal)
        btn.layer.cornerRadius = 20;
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.tag = 1
        self.view.addSubview(btn)
        
        
        startbtn.backgroundColor = UIColor(red: 166/255, green: 36/255, blue: 43/255, alpha: 0.5)
        startbtn.setTitle("Start", for: .normal)
        startbtn.layer.cornerRadius = 20
        startbtn.addTarget(self, action: #selector(startbuttonAction), for: .touchUpInside)
        //startbtn.tag = 1
        self.view.addSubview(startbtn)
        
        
        label.center = CGPoint(x: round(self.view.bounds.width)  / 2,
                               y: round(self.view.bounds.width-350)  / 2)
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue", size: CGFloat(50))
        label.text = "--"
        self.view.addSubview(label)
        
      
        
    }
    
    
    //-------------------------------------------------------
    func startbuttonAction(_sender: UIButton) {
      
        tuner.delegate = self
        if tunerstart == false{
            tuner.startMonitoring()
            tunerstart = true
            startbtn.setTitle("Stop", for: .normal)
            startbtn.backgroundColor = UIColor(red: 166/255, green: 36/255, blue: 43/255, alpha: 0.5)
            
        }
        else{
            tunerstart = false
            tuner.stopMonitoring()
            startbtn.setTitle("Start", for: .normal)
            startbtn.backgroundColor = UIColor(red: 86/255, green: 159/255, blue: 73/255, alpha: 0.5)
            label.text = "--"
            
        }
        
    }

    //------------------------------------------------
    
    func buttonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
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
        

        label.text = "\(pitch.description)"
        
        for i in 1...3{
        print((pitch+i-2).description)
        }
        
        
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

