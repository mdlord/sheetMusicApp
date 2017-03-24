//
//  PianoViewController.swift
//  convert
//
//  Created by Mayank Daswani on 2/20/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit
import AVFoundation

var longPressed = false
var selectedRow = 0

class PianoViewController: UIViewController {
    
    var x=1     //D
    var y=1     //E
    var z=1     //F
    var g1=1    //G
    var a1=1    //A
    var b1=1    //B
    var ch1=1   //Ch
    var dh1=1   //Dh
    var eh1=1   //Eh
    var fh1=1   //Fh
    
   
    @IBOutlet weak var staffone: UIImageView!
    @IBOutlet weak var stafftwo: UIImageView!
    
    
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var E: UIButton!
    @IBOutlet weak var F: UIButton!
    @IBOutlet weak var G: UIButton!
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var C_h: UIButton!
    @IBOutlet weak var D_h: UIButton!
    @IBOutlet weak var E_h: UIButton!
    @IBOutlet weak var F_h: UIButton!
    
    @IBOutlet weak var Csh: UIButton!
    @IBOutlet weak var Dsh: UIButton!
    @IBOutlet weak var Fsh: UIButton!
    @IBOutlet weak var Gsh: UIButton!
    @IBOutlet weak var Ash: UIButton!
    @IBOutlet weak var Csh_h: UIButton!
    @IBOutlet weak var Dsh_h: UIButton!
    @IBOutlet weak var Fsh_h: UIButton!
    
    var audioPlayer: AVAudioPlayer! = nil
    
    var count = 1
    var xpos = 150
    var xy=1

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        placeview4one(xcoord: 120, ycoord:38)
        placeview4one(xcoord: 120, ycoord: 62)
        
        placeview4one(xcoord: 120, ycoord:124)
        placeview4one(xcoord: 120, ycoord: 148)
        
        placeview4two(xcoord: 120, ycoord:38)
        placeview4two(xcoord: 120, ycoord: 62)
        
        placeview4two(xcoord: 120, ycoord:124)
        placeview4two(xcoord: 120, ycoord: 148)
    
        let longTapges = UILongPressGestureRecognizer(target: self,  action: #selector(PianoViewController.LongPress))
        D.addGestureRecognizer(longTapges)
 
        
    }
    
    var longPressBeginTime: TimeInterval = 0.0
    var my_count: Int=0
    
    func LongPress(sender: UILongPressGestureRecognizer){
       
    
        if sender.state == .began
        {
            print("Began")
            longPressBeginTime = NSDate.timeIntervalSinceReferenceDate
            print(longPressBeginTime)
            
        }
        else if sender.state == .ended{
            print("Ended")
            
            let gestureTime = NSDate.timeIntervalSinceReferenceDate -
            longPressBeginTime
            print("Gesture time = \(gestureTime)")
            
          //  while(my_count<9){
            
            if gestureTime>=2{
                count += 1
                xpos = xpos+80
                playMyFile(fname: "D")
                placeviewsemibreve(xcoord: xpos, ycoord: Int(72))
                xpos=xpos+80
                my_count=my_count+8
            }
            
            else if gestureTime>=1 && gestureTime<2{
                count += 1
                xpos = xpos+40
                playMyFile(fname: "D")
                placeviewhalf(xcoord: xpos, ycoord: Int(51))
                xpos=xpos+40
                my_count=my_count+4
            }
            
            else if gestureTime>=0.5 && gestureTime<1{
                count += 1
                xpos = xpos+20
                playMyFile(fname: "D")
                placeviewquartet(xcoord: xpos, ycoord: Int(49))
                xpos=xpos+20
                my_count=my_count+2
            }
            
            else if gestureTime<0.5 {
                count += 1
                xpos = xpos+13
                playMyFile(fname: "D")
                placevieweight(xcoord: xpos, ycoord: Int(48))
                xpos=xpos+13
                my_count=my_count+1
                
            }
            
          }
        if my_count >= 8{
            placeviewline(xcoord: xpos+10, ycoord: 40)
            xpos=xpos+10
            my_count=0
            

        }
        
        
       //}
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let position = touch.location(in: self.staffone)
            print(position.x)
            print(position.y)
        }
    }
    
    
   
    
    @IBAction func Cbtn(_ sender: AnyObject) {
       
        
    
        playMyFile(fname: "C")
        count += 1
        xpos = xpos+75
        placeviewsemibreve(xcoord: xpos, ycoord: 78)
    }
    
   
   
    @IBAction func Ebtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "E")
        if y==1{
        placeviewsemibreve(xcoord: xpos, ycoord: Int(66))
        y=y+1
        }
        else if y==2{
        placeviewhalf(xcoord: xpos, ycoord: Int(45))
            y=y+1
        }
        else if y==3{
            placeviewquartet(xcoord: xpos, ycoord: 43)
            y=y+1
        }
        else{
            placevieweight(xcoord: xpos, ycoord: 42)
        }
    }
    @IBAction func Fbtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "F")
        //placeviewsemibreve(xcoord: xpos, ycoord: Int(60))
        if z==1{
            placeviewsemibreve(xcoord: xpos, ycoord: Int(60))
            z=z+1
        }
        else if z==2{
            placeviewhalf(xcoord: xpos, ycoord: Int(39))
            z=z+1
        }
        else if z==3{
            placeviewquartet(xcoord: xpos, ycoord: 37)
            z=z+1
        }
        else{
            placevieweight(xcoord: xpos, ycoord: 36)
        }

        
    }
    @IBAction func Gbtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "G")
        if g1==1{
            placeviewsemibreve(xcoord: xpos, ycoord: Int(54))
            g1=g1+1
        }
        else if g1==2{
            placeviewhalf(xcoord: xpos, ycoord: Int(33))
            g1=g1+1
        }
        else if g1==3{
            placeviewquartet(xcoord: xpos, ycoord: 31)
            g1=g1+1
        }
        else{
            placevieweight(xcoord: xpos, ycoord: 30)
        }
    }
    @IBAction func Abtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "A")
        if a1==1{
            placeviewsemibreve(xcoord: xpos, ycoord: Int(48))
            a1=a1+1
        }
        else if a1==2{
            placeviewhalf(xcoord: xpos, ycoord: Int(27))
            a1=a1+1
        }
        else if a1==3{
            placeviewquartet(xcoord: xpos, ycoord: 25)
            a1=a1+1
        }
        else{
            placevieweight(xcoord: xpos, ycoord: 24)
        }
    }
    @IBAction func Bbtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "B")
        if b1==1{
            placeviewsemibreve(xcoord: xpos, ycoord: Int(42))
            b1=b1+1
        }
        else if b1==2{
            placeviewhalf(xcoord: xpos, ycoord: Int(21))
            b1=b1+1
        }
        else if a1==3{
            placeviewquartet(xcoord: xpos, ycoord: 19)
            b1=b1+1
        }
        else{
            placevieweight(xcoord: xpos, ycoord: 18)
        }
    }
    @IBAction func C_hbtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "C4")
        if ch1==1{
            placeviewsemibreve(xcoord: xpos, ycoord: Int(36))
            ch1=ch1+1
        }
        else if ch1==2{
            placeviewinverthalf(xcoord: xpos, ycoord: Int(51))
            ch1=ch1+1
        }
        else if ch1==3{
            placeviewinvertquartet(xcoord: xpos, ycoord: 49)
            ch1=ch1+1
        }
        else{
            placevieweight(xcoord: xpos, ycoord: 18)
        }
    }
    
    
    @IBAction func D_hbtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "D4")
        if dh1==1{
            placeviewsemibreve(xcoord: xpos, ycoord: Int(30))
            dh1=dh1+1
        }
        else if dh1==2{
            placeviewinverthalf(xcoord: xpos, ycoord: Int(45))
            dh1=dh1+1
        }
        else if dh1==3{
            placeviewinvertquartet(xcoord: xpos, ycoord: 43)
            dh1=dh1+1
        }
        else{
            placevieweight(xcoord: xpos, ycoord: 18)
        }
    }

    @IBAction func E_hbtn(_ sender: AnyObject) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "E4")
        if eh1==1{
            placeviewsemibreve(xcoord: xpos, ycoord: Int(24))
            eh1=eh1+1
        }
        else if eh1==2{
            placeviewinverthalf(xcoord: xpos, ycoord: Int(39))
            eh1=eh1+1
        }
        else if eh1==3{
            placeviewinvertquartet(xcoord: xpos, ycoord: 37)
            eh1=eh1+1
        }
        else{
            placevieweight(xcoord: xpos, ycoord: 18)
        }
    }
    
    @IBAction func F_hbtn(_ sender: AnyObject) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "F4")
        if fh1==1{
            placeviewsemibreve(xcoord: xpos, ycoord: Int(18))
            fh1=fh1+1
        }
        else if fh1==2{
            placeviewinverthalf(xcoord: xpos, ycoord: Int(33))
            fh1=fh1+1
        }
        else if fh1==3{
            placeviewinvertquartet(xcoord: xpos, ycoord: 31)
            fh1=fh1+1
        }
        else{
            placevieweight(xcoord: xpos, ycoord: 18)
        }
    }
 
    
    // place a sharp sign before these notes
    @IBAction func Csh_btn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        placeviewsemibreve(xcoord: xpos, ycoord: 78)
        xpos = xpos-20
        playMyFile(fname: "C#")
        placeviewsharp(xcoord: xpos, ycoord: 90)
        xpos=xpos+20
    }
    @IBAction func Dsh_btn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        placeviewsemibreve(xcoord: xpos, ycoord: 72)
        xpos = xpos-20
        playMyFile(fname: "D#")
        placeviewsharp(xcoord: xpos, ycoord: 84)
        xpos=xpos+20
    }
    @IBAction func Fsh_btn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        placeviewsemibreve(xcoord: xpos, ycoord: Int(60))
        xpos = xpos-20
        playMyFile(fname: "F#")
        placeviewsharp(xcoord: xpos, ycoord: 72)
        xpos=xpos+20
    }
    @IBAction func Gsh_btn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        placeviewsemibreve(xcoord: xpos, ycoord: 54)
        xpos = xpos-20
        playMyFile(fname: "G#")
        placeviewsharp(xcoord: xpos, ycoord: 66)
        xpos=xpos+20
    }
    
    @IBAction func Ash_btn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        placeviewsemibreve(xcoord: xpos, ycoord: 48)
        xpos = xpos-20
        playMyFile(fname: "A#")
        placeviewsharp(xcoord: xpos, ycoord: 60)
        xpos=xpos+20
    }
    
    @IBAction func Csh_h_btn(_ sender: AnyObject) {
        count += 1
        xpos = xpos+75
        placeviewsemibreve(xcoord: xpos, ycoord: 36)
        xpos = xpos-20
        playMyFile(fname: "C4#")
        placeviewsharp(xcoord: xpos, ycoord: 48)
        xpos=xpos+20
    }
   
    
    @IBAction func Dsh_h_btn(_ sender: AnyObject) {
        count += 1
        xpos = xpos+75
        placeviewsemibreve(xcoord: xpos, ycoord: 30)
        xpos = xpos-20
        playMyFile(fname: "D4#")
        placeviewsharp(xcoord: xpos, ycoord: 42)
        xpos = xpos+20
    }

    
    @IBAction func Fsh_h_btn(_ sender: AnyObject) {
        count += 1
        xpos = xpos+75
        placeviewsemibreve(xcoord: xpos, ycoord: 18)
        xpos = xpos - 20
        playMyFile(fname: "F4#")
        placeviewsharp(xcoord: xpos, ycoord: 30)
        xpos=xpos+20
    }

    
    
    
  
    //full note
    func placeviewsemibreve(xcoord:Int, ycoord: Int)
    {
        let imageName = "semibreve(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 45)
        
        if (xpos<500 && xy==1) {
            staffone.addSubview(imageView)
        }
        else if xpos>=500 {
            xy=2
            xpos=150
        }
        else if xy==2{
            stafftwo.addSubview(imageView)
        }
        else{
            print("take screenshot and remove subviews")
        }
    }
    
    //Flat symbol
    func placeviewflat(xcoord:Int, ycoord: Int)
    {
        let imageName = "flat_note(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 45)
        
        if (xpos<500 && xy==1) {
            staffone.addSubview(imageView)
        }
        else if xpos>=500 {
            xy=2
            xpos=150
        }
        else if xy==2{
            stafftwo.addSubview(imageView)
        }
        else{
            print("take screenshot and remove subviews")
        }
    }
    
    //Sharp symbol
    func placeviewsharp(xcoord:Int, ycoord: Int)
    {
        let imageName = "sharp25.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 20, height: 20)
        
        if (xpos<500 && xy==1) {
            staffone.addSubview(imageView)
        }
        else if xpos>=500 {
            xy=2
            xpos=150
        }
        else if xy==2{
            stafftwo.addSubview(imageView)
        }
        else{
            print("take screenshot and remove subviews")
        }
    }
    
    
    
    
    
    
    
    
    // write mods for quarter note
    // write function for half note(find pic too)
    // write function for one eigth note(find pic too)
    //
    //quarternote
    
    func placeviewquartet(xcoord:Int, ycoord: Int)
    {
        let imageName = "quarter_note(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 56)
        
        if (xpos<500 && xy==1) {
            staffone.addSubview(imageView)
        }
        else if xpos>=500 {
            xy=2
            xpos=150
        }
        else if xy==2{
            stafftwo.addSubview(imageView)
        }
        else{
            print("take screenshot and remove subviews")
        }
    }
   
    //Eighth note
    func placevieweight(xcoord:Int, ycoord: Int)
    {
        let imageName = "eighth_note(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 57)
        
        if (xpos<500 && xy==1) {
            staffone.addSubview(imageView)
        }
        else if xpos>=500 {
            xy=2
            xpos=150
        }
        else if xy==2{
            stafftwo.addSubview(imageView)
        }
        else{
            print("take screenshot and remove subviews")
        }
    }
    //Half note
    func placeviewhalf(xcoord:Int, ycoord: Int)
    {
        let imageName = "half_note(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 52)
        
        if (xpos<500 && xy==1) {
            staffone.addSubview(imageView)
        }
        else if xpos>=500 {
            xy=2
            xpos=150
        }
        else if xy==2{
            stafftwo.addSubview(imageView)
        }
        else{
            print("take screenshot and remove subviews")
        }
    }
    
    func placeviewinverthalf(xcoord:Int, ycoord: Int)
    {
        let imageName = "half_note_inv(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 52)
        
        if (xpos<500 && xy==1) {
            staffone.addSubview(imageView)
        }
        else if xpos>=500 {
            xy=2
            xpos=150
        }
        else if xy==2{
            stafftwo.addSubview(imageView)
        }
        else{
            print("take screenshot and remove subviews")
        }
    }
    
    func placeviewinvertquartet(xcoord:Int, ycoord: Int)
    {
        let imageName = "quarter_note_inv(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 56)
        
        if (xpos<500 && xy==1) {
            staffone.addSubview(imageView)
        }
        else if xpos>=500 {
            xy=2
            xpos=150
        }
        else if xy==2{
            stafftwo.addSubview(imageView)
        }
        else{
            print("take screenshot and remove subviews")
        }
    }
    
    func placeview4one(xcoord:Int, ycoord:Int){
        let imageName = "4.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 30)
    
            staffone.addSubview(imageView)
        
    }
    
    func placeview4two(xcoord:Int, ycoord: Int)
    {
        let imageName = "4.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 30)
        
            stafftwo.addSubview(imageView)
      
    }
    
    func placeviewline(xcoord:Int, ycoord: Int)
    {
        let imageName = "line.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 20, height: 52)
        
        staffone.addSubview(imageView)
        
    }
    
    
    //Play the file
    func playMyFile(fname: String) {
        
        let path = Bundle.main.path(forResource: String(fname), ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: path!)
        
        do {
            try audioPlayer =  AVAudioPlayer(contentsOf: fileURL as URL)
        } catch {
            print("error")
        }
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
}
