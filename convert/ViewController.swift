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
import Buckets

var arrcount:Int = 0

class ViewController: UIViewController, TunerDelegate {
    
    let tuner       = Tuner()
    let displayView = DisplayView()
    
    
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    var tunerstart = false
    
    let btn: UIButton = UIButton(frame: CGRect(x: 100   , y: 400, width: 100, height: 50))
    let startbtn: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Update the background color. */
        self.view.backgroundColor = .black
        title = "Tuner".uppercased()

        
        startbtn.frame = CGRect(
            origin: CGPoint(x: round(self.view.bounds.width - 200)  / 2,
                            y: round(self.view.bounds.height - 350) / 1),
            size:   CGSize(width: 200, height: 50)
        )

        //UIButton(frame: CGRect(x: self.view.bounds.width/2, y: (self.view.height - 300), width: 200, height: 50))
        
        
        /* Setup the display view. */
        displayView.frame = CGRect(
            origin: CGPoint(x: round(self.view.bounds.width - 450)  / 2,
                            y: round(self.view.bounds.height - 500) / 1),
            size:   CGSize(width: 450, height: 170)
        )
        
        
        self.view.addSubview(displayView)
        
        btn.backgroundColor = UIColor(red: 117/255, green: 117/277, blue: 145/255, alpha: 0.5)
        btn.setTitle("Piano", for: .normal)
        btn.layer.cornerRadius = 20;
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.tag = 1
        self.view.addSubview(btn)
        
        //startbtn.centre = CGPoint(x: round(self.view.bounds.width)/2,
        //                          y: round(self.view.bounds.width-350))
        startbtn.backgroundColor = UIColor(red: 166/255, green: 36/255, blue: 43/255, alpha: 0.5)
        startbtn.setTitle("Start", for: .normal)
        startbtn.layer.cornerRadius = 20
        startbtn.addTarget(self, action: #selector(startbuttonAction), for: .touchUpInside)
        //startbtn.tag = 1
        self.view.addSubview(startbtn)
        
        
        label.center = CGPoint(x: round(self.view.bounds.width)  / 2,
                               y: round(self.view.bounds.width-550)  / 2)
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue", size: CGFloat(75))
        label.text = "--"
        self.view.addSubview(label)
        
        //staff view
        let imageName = "music-staffneg.jpg"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: (self.view.bounds.width-1000)/2, y: 500, width: self.view.bounds.width, height: 222)
        self.view.addSubview(imageView)
        

 
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let position = touch.location(in: self.view)
//            print(position.x)
//            print(position.y)
        }
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
//        label.text = "\(pitch.description)"
        makequeue(input: String(pitch.description))
     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}



func makequeue(input: String){

    var noteq = Queue<String>()
    var notecnt: Int
    var notearr = [String]()

    noteq.enqueue(input)
    
    print(noteq.count)
    //print(noteq.dequeue())
    
    if noteq.count == 12{
        for index in 1...12{
            notearr.append(noteq.dequeue())
        }
    }
    processarr(arrinput: notearr)
}

func processarr(arrinput: [String]){
    print("Hi")
    arrcount += 1
    print(arrcount)
}




