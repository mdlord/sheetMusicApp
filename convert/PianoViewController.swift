//
//  PianoViewController.swift
//  convert
//
//  Created by Mayank Daswani on 2/20/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit
import AVFoundation

class PianoViewController: UIViewController {
    var x=1 //D
    var y=1 //E
    var z=1 //F
    var g1=1 //G
    var a1=1 //A
    var b1=1 //B
    var ch1=1 //Ch
    var dh1=1 //Dh
    var eh1=1 //Eh
    var fh1=1 //Fh
    
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
    //var player: AVAudioPlayer! = nil
    
    var count = 1
    var xpos = 75
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
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
    
    
    // note = x
    // spaces----------------------------
    // F_l = 60
    // A   = 48                 difference  = 12
    // C_h = 36
    // E_h = 24
    // D_l =
    
    // lines-----------------------------
    // E_l= 66
    // G  = 54
    // B  = 42                  difference  = 12
    // D_h= 38
    // F_h= 30
   // var lpgr = UILongPressGestureRecognizer(target: self, action: Selector("action:"))
    
   // lpgr.minimumPressDuration = 2.0;
    
   // mapView.addGestureRecognizer(lpgr)
    
    @IBAction func Cbtn(_ sender: AnyObject) {
        //let timeAtPress = NSDate()
        //let elapsed = Date().timeIntervalSince(timeAtPress as Date)
        //print(elapsed)
        //var longPressBeginTime: TimeInterval
        let sender: UILongPressGestureRecognizer =
            UILongPressGestureRecognizer(target: self, action: Selector(("longPressed:")))
            sender.minimumPressDuration = 0.2
      
            if (sender.state == UIGestureRecognizerState.ended)
            {
                //let gestureTime = NSDate.timeIntervalSinceReferenceDate - longPressBeginTime + gesture.minimumPressDuration
                print("end")
            }
            else if (sender.state == UIGestureRecognizerState.began)
            {
                print("Began")
                //longPressBeginTime = NSDate.timeIntervalSinceReferenceDate
            }
                /*if sender.state == UIGestureRecognizerState.began
        {
            let alertController = UIAlertController(title: nil, message:
                "Long-Press Gesture Detected", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }*/
    
        playMyFile(fname: "C")
        count += 1
        xpos = xpos+75
        placeviewsemibreve(xcoord: xpos, ycoord: 78)
    }
    
   
    @IBAction func Dbtn(_ sender: Any) {
        count += 1
        xpos = xpos+75
        playMyFile(fname: "D")
        if x==1{
            placeviewsemibreve(xcoord: xpos, ycoord: Int(72))
            x=x+1
        }
        else if x==2{
            placeviewhalf(xcoord: xpos, ycoord: Int(51))
            x=x+1
        }
        else if x==3{
            placeviewquartet(xcoord: xpos, ycoord: 49)
            x=x+1
        }
        else{
            placevieweight(xcoord: xpos, ycoord: 48)
        }
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

    
    
    
    
    // add a dictionary for the value of the notes to put a break after evry 4 beats
    
    // semibreve = whole note
    //minim = half note
    //quartet = one fourth note
    //quaver = one eigth note
    var countbt = [4 : "semibreve",
                   2: "minim",
                   1: "quartet",
                   0.5: "quaver"]
    
    // add a new parameter to change the staff if count% 10 == 0
    // whole note function
    
    
    //full note
    func placeviewsemibreve(xcoord:Int, ycoord: Int)
    {
        let imageName = "semibreve(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 45)
        
        if count<15{
            staffone.addSubview(imageView)
        }
        else if count>15 && count<17{
            self.xpos = 75
        }
        else if xpos>16
        {
            stafftwo.addSubview(imageView)
        }
        else {
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
        
        if count<15{
            staffone.addSubview(imageView)
        }
        else if count<30{
            count = 1
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
        
        if count<15{
            staffone.addSubview(imageView)
        }
        else if count>15 && count<17{
            self.xpos = 75
        }
        else if xpos>16
        {
            stafftwo.addSubview(imageView)
        }
        else {
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
        
        if count<15{
            staffone.addSubview(imageView)
        }
        else if count<30{
            count = 1
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
        
        if count<15{
            staffone.addSubview(imageView)
        }
        else if count<30{
            count = 1
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
        
        if count<15{
            staffone.addSubview(imageView)
        }
        else if count<30{
            count = 1
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
        
        if count<15{
            staffone.addSubview(imageView)
        }
        else if count<30{
            count = 1
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
        
        if count<15{
            staffone.addSubview(imageView)
        }
        else if count<30{
            count = 1
            stafftwo.addSubview(imageView)
        }
        else{
            print("take screenshot and remove subviews")
        }
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
    
    //func action(gestureRecognizer:UIGestureRecognizer) { println("long press") }
    
    
    
    
}
