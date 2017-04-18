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

var notecount: Int = 0
var noteq = Queue<String>()
var prevnote: String = "C3"
var xpos = 150
var my_count: Int = 0
var count: Int = 0

class ViewController: UIViewController, TunerDelegate {
    
    let tuner       = Tuner()
    let displayView = DisplayView()
    
    
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    var tunerstart = false
    
    let btn: UIButton = UIButton(frame: CGRect(x: 950 , y: 50, width: 100, height: 50))
    let startbtn: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Update the background color. */
        
        //print(self.view.bounds.width)
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
            origin: CGPoint(x: round(self.view.bounds.width - 650)  / 2,
                            y: round(self.view.bounds.height - 500) / 1),
            size:   CGSize(width: 650, height: 150)
        )
        
        
        self.view.addSubview(displayView)
        
//        btn.backgroundColor = UIColor(red: 117/255, green: 117/277, blue: 145/255, alpha: 0.5)
//        btn.setTitle("Piano", for: .normal)
//        btn.layer.cornerRadius = 20;
//        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
//        btn.tag = 1
//        self.view.addSubview(btn)
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
        //if amplitude >
        label.text = "\(pitch.description)"
        print(amplitude)
//        print(pitch.description)
        
        processnotes(input: String(pitch.description))

        
     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func processnotes(input: String){
        
        noteq.enqueue(input)
//      var notearr = [String]()
        var currnote: String
        var finnote: String
        
        currnote = input
        
        if(prevnote == currnote){
            notecount += 1
            prevnote = currnote

        }
        else {
            
            print("\n-----")
            print(prevnote)
            finnote = prevnote
            print(notecount)
            
            if (finnote=="D2"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(662))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(646))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(644))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount==2){
                    xpos=xpos+20
                    placeeight(xcoord: xpos, ycoord: Int(646))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }

            
            if (finnote=="E2"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(656))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(640))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(638))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount==2){
                    xpos=xpos+20
                    placeeight(xcoord: xpos, ycoord: Int(640))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }

            
            if (finnote=="F2"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(650))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(634))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(632))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount==2){
                    xpos=xpos+20
                    placeeight(xcoord: xpos, ycoord: Int(634))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }

            
            if (finnote=="G2"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(644))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(628))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(626))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount==2){
                    xpos=xpos+20
                    placeeight(xcoord: xpos, ycoord: Int(628))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }

            
            if (finnote=="A2"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(638))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(622))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(620))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount==2){
                    xpos=xpos+20
                    placeeight(xcoord: xpos, ycoord: Int(622))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }

            
            if (finnote=="B2"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(632))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(616))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(614))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount==2){
                    xpos=xpos+20
                    placeeight(xcoord: xpos, ycoord: Int(616))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="C2"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(626))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(610))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(608))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount==2){
                    xpos=xpos+20
                    placeeight(xcoord: xpos, ycoord: Int(610))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="D3"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(621))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(641))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(639))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }

            
            if (finnote=="E3"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(615))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(635))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(633))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }

            
            if (finnote=="F3"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(609))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(629))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(627))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="G3"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(603))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(623))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(621))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="A3"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(597))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(617))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(615))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="B3"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(591))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(611))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(609))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }

            
            if (finnote=="C3"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(585))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(605))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(603))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }

            
            if (finnote=="C4"){
                    if (notecount>=8){
                        xpos = xpos+80
                        placesemibreve(xcoord: xpos, ycoord: Int(573))
                        xpos=xpos+80
                        my_count=my_count+8
                        checkxnew(xc: xpos)
                    }
                    else if(notecount<8 && notecount>=5){
                        xpos = xpos+40
                        placehalf(xcoord: xpos, ycoord: Int(557))
                        xpos=xpos+40
                        my_count=my_count+4
                        checkxnew(xc: xpos)
                        
                    }
                    else if(notecount<5 && notecount>2){
                        xpos=xpos+20
                        placequartet(xcoord: xpos, ycoord: Int(555))
                        xpos=xpos+20
                        my_count=my_count+2
                        
                        checkxnew(xc: xpos)
                        
                    }
                    else if(notecount==2){
                        xpos=xpos+20
                        placeeight(xcoord: xpos, ycoord: Int(557))
                        xpos=xpos+20
                        my_count=my_count+2
                        
                        checkxnew(xc: xpos)
                        
                    }
                    else{
                        
                    }
                    
                }
            
            if (finnote=="D4"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(567))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(551))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(549))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount==2){
                    xpos=xpos+20
                    placeeight(xcoord: xpos, ycoord: Int(551))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="E4"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(561))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(545))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(543))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount==2){
                    xpos=xpos+20
                    placeeight(xcoord: xpos, ycoord: Int(545))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="F4"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(555))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(539))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(537))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount==2){
                    xpos=xpos+20
                    placeeight(xcoord: xpos, ycoord: Int(539))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="G4"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(549))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(533))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(531))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount==2){
                    xpos=xpos+20
                    placeeight(xcoord: xpos, ycoord: Int(533))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="B4"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(543))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(527))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(525))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount==2){
                    xpos=xpos+20
                    placeeight(xcoord: xpos, ycoord: Int(527))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="B4"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(533))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(557))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(555))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="C5"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(531))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(551))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(549))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="D5"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(525))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(545))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(543))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="E5"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(519))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(539))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(537))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="F5"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(513))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(533))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(531))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="G5"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(507))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(527))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(525))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="A5"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(501))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(521))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(519))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="B5"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(495))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(515))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(513))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="C6"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(489))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(509))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(507))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            /*if (finnote=="D6"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(483))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(503))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(501))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }

            if (finnote=="E6"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(477))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(497))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(495))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="F6"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(471))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(491))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(489))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="G6"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(465))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(485))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(483))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="A6"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(459))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(479))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(477))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }
            
            if (finnote=="B6"){
                if (notecount>=8){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(453))
                    xpos=xpos+80
                    my_count=my_count+8
                    checkxnew(xc: xpos)
                }
                else if(notecount<8 && notecount>=5){
                    xpos = xpos+40
                    placeinvhalf(xcoord: xpos, ycoord: Int(473))
                    xpos=xpos+40
                    my_count=my_count+4
                    checkxnew(xc: xpos)
                    
                }
                else if(notecount<5 && notecount>=2){
                    xpos=xpos+20
                    placeinvquartet(xcoord: xpos, ycoord: Int(471))
                    xpos=xpos+20
                    my_count=my_count+2
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    
                }
                
            }*/


            
           /* if (currnote=="D4"){
                if (count==0){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(566))
                    xpos=xpos+80
                    my_count=my_count+8
                    count=count+1
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(count==1){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(550))
                    xpos=xpos+40
                    my_count=my_count+4
                    count=count+1
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(count==2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(548))
                    xpos=xpos+20
                    my_count=my_count+2
                    count=count+1
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    xpos = xpos+10
                    placeeight(xcoord: xpos, ycoord: Int(549))
                    xpos=xpos+10
                    my_count=my_count+1
                    count=0
                    
                    checkxnew(xc: xpos)
                    
                }

            }
            
            if (currnote=="E4"){
                if (count==0){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(560))
                    xpos=xpos+80
                    my_count=my_count+8
                    count=count+1
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(count==1){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(544))
                    xpos=xpos+40
                    my_count=my_count+4
                    count=count+1
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(count==2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(542))
                    xpos=xpos+20
                    my_count=my_count+2
                    count=count+1
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    xpos = xpos+10
                    placeeight(xcoord: xpos, ycoord: Int(543))
                    xpos=xpos+10
                    my_count=my_count+1
                    count=0
                    
                    checkxnew(xc: xpos)
                    
                }

            }
            
            if (currnote=="F4"){
                if (count==0){
                    xpos = xpos+80
                    placesemibreve(xcoord: xpos, ycoord: Int(554))
                    xpos=xpos+80
                    my_count=my_count+8
                    count=count+1
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(count==1){
                    xpos = xpos+40
                    placehalf(xcoord: xpos, ycoord: Int(538))
                    xpos=xpos+40
                    my_count=my_count+4
                    count=count+1
                    
                    checkxnew(xc: xpos)
                    
                }
                else if(count==2){
                    xpos=xpos+20
                    placequartet(xcoord: xpos, ycoord: Int(536))
                    xpos=xpos+20
                    my_count=my_count+2
                    count=count+1
                    
                    checkxnew(xc: xpos)
                    
                }
                else{
                    xpos = xpos+10
                    placeeight(xcoord: xpos, ycoord: Int(537))
                    xpos=xpos+10
                    my_count=my_count+1
                    count=0
                    
                    checkxnew(xc: xpos)
                    
                }
            }
            
            if (currnote=="G4"){
                xpos = xpos+80
                placesemibreve(xcoord: xpos, ycoord: Int(548))
                xpos=xpos+80
                my_count=my_count+8
                
                checkxnew(xc: xpos)
                
            }
            
            if (currnote=="A4"){
                xpos = xpos+80
                placesemibreve(xcoord: xpos, ycoord: Int(542))
                xpos=xpos+80
                my_count=my_count+8
                
                checkxnew(xc: xpos)
                
            }
            
            if (currnote=="B4"){
                xpos = xpos+80
                placesemibreve(xcoord: xpos, ycoord: Int(536))
                xpos=xpos+80
                my_count=my_count+8
                
                checkxnew(xc: xpos)
                
            }
            
            if (currnote=="C5"){
                xpos = xpos+80
                placesemibreve(xcoord: xpos, ycoord: Int(530))
                xpos=xpos+80
                my_count=my_count+8
                
                checkxnew(xc: xpos)
                
            }
            
            if (currnote=="A5"){
                xpos = xpos+80
                placesemibreve(xcoord: xpos, ycoord: Int(524))
                xpos=xpos+80
                my_count=my_count+8
                
                checkxnew(xc: xpos)
                
            }
            
            if (currnote=="B5"){
                xpos = xpos+80
                placesemibreve(xcoord: xpos, ycoord: Int(518))
                xpos=xpos+80
                my_count=my_count+8
                
                checkxnew(xc: xpos)
                
            }
            
            if (currnote=="C5"){
                xpos = xpos+80
                placesemibreve(xcoord: xpos, ycoord: Int(512))
                xpos=xpos+80
                my_count=my_count+8
                
                checkxnew(xc: xpos)
                
            }
            
            if (currnote=="D5"){
                xpos = xpos+80
                placesemibreve(xcoord: xpos, ycoord: Int(506))
                xpos=xpos+80
                my_count=my_count+8
                
                checkxnew(xc: xpos)
                
            }
            
            if (currnote=="E5"){
                xpos = xpos+80
                placesemibreve(xcoord: xpos, ycoord: Int(500))
                xpos=xpos+80
                my_count=my_count+8
                
                checkxnew(xc: xpos)
                
            }
            
            if (currnote=="F5"){
                xpos = xpos+80
                placesemibreve(xcoord: xpos, ycoord: Int(494))
                xpos=xpos+80
                my_count=my_count+8
                
                checkxnew(xc: xpos)
                
            }
            */
            //print(notecount)
            
            notecount = 1
            prevnote = currnote
        }
        
    }
    
    
    func placesemibreve(xcoord:Int, ycoord: Int)
    {
        let imageName = "semibreveneg(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 56)
        self.view.addSubview(imageView)
       
    }
    
    //Half note
    func placehalf(xcoord:Int, ycoord: Int)
    {
        let imageName = "half_noteneg(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 52)
        self.view.addSubview(imageView)
    }
    
    func placeinvhalf(xcoord:Int, ycoord: Int)
    {
        let imageName = "half_noteinvneg(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 52)
        self.view.addSubview(imageView)
    }
    
    //Quarter Note
    func placequartet(xcoord:Int, ycoord: Int)
    {
        let imageName = "quarter_noteneg(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 56)
        self.view.addSubview(imageView)
    }
    
    func placeinvquartet(xcoord:Int, ycoord: Int)
    {
        let imageName = "quarter_noteinvneg(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 56)
        self.view.addSubview(imageView)
    }
    
    //Eighth note
    func placeeight(xcoord:Int, ycoord: Int)
    {
        let imageName = "eighth_noteneg(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 57)
        self.view.addSubview(imageView)
    }


    func checkxnew(xc: Int){
        if(xc > 850 ){
            xpos = 0
            let imageName = "music-staffneg.jpg"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: (self.view.bounds.width-1000)/2, y: 500, width: self.view.bounds.width, height: 222)
            self.view.addSubview(imageView)
            xpos=150

        }
    }
}


