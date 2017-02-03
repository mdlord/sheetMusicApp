//
//  ViewController.swift
//  convert
//
//  Created by Mayank Daswani on 1/27/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        C.backgroundColor = .clear
        C.layer.cornerRadius = 1
        C.layer.borderWidth = 1
        C.layer.borderColor = UIColor.black.cgColor
        
        D.backgroundColor = .clear
        D.layer.cornerRadius = 1
        D.layer.borderWidth = 1
        D.layer.borderColor = UIColor.black.cgColor
        
        E.backgroundColor = .clear
        E.layer.cornerRadius = 1
        E.layer.borderWidth = 1
        E.layer.borderColor = UIColor.black.cgColor
        
        F.backgroundColor = .clear
        F.layer.cornerRadius = 1
        F.layer.borderWidth = 1
        F.layer.borderColor = UIColor.black.cgColor
        
        G.backgroundColor = .clear
        G.layer.cornerRadius = 1
        G.layer.borderWidth = 1
        G.layer.borderColor = UIColor.black.cgColor
        
        A.backgroundColor = .clear
        A.layer.cornerRadius = 1
        A.layer.borderWidth = 1
        A.layer.borderColor = UIColor.black.cgColor
        
        B.backgroundColor = .clear
        B.layer.cornerRadius = 1
        B.layer.borderWidth = 1
        B.layer.borderColor = UIColor.black.cgColor
        
        C_h.backgroundColor = .clear
        C_h.layer.cornerRadius = 1
        C_h.layer.borderWidth = 1
        C_h.layer.borderColor = UIColor.black.cgColor
        
 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            let position = touch.location(in: self)
//            print(position.x)
//            print(position.y)
//        }
//    }
    
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
    // A   = 48                 difference  = 12.5
    // C_h = 36
    // E_h = 24
    // D_l =
    
// lines-----------------------------
    // E_l= 66
    // G  = 54
    // B  = 42                  difference  = 12.5
    // D_h= 38
    // F_h= 30
    


    
    
    @IBAction func Cbtn(_ sender: Any) {
        
        count += 1

        placeview(xcoord: count*75, ycoord: 78)
    }
    @IBAction func Dbtn(_ sender: Any) {
        count += 1

        placeview(xcoord: count*75, ycoord: 72)
    }
    @IBAction func Ebtn(_ sender: Any) {
        count += 1

        placeview(xcoord: count*75, ycoord: Int(66))
    }
    @IBAction func Fbtn(_ sender: Any) {
        count += 1

        placeview(xcoord: count*75, ycoord: Int(60))
    }
    @IBAction func Gbtn(_ sender: Any) {
        count += 1

        placeview(xcoord: count*75, ycoord: 54)
    }
    @IBAction func Abtn(_ sender: Any) {
        count += 1

        placeview(xcoord: count*75, ycoord: 48)
    }
    @IBAction func Bbtn(_ sender: Any) {
        count += 1

        placeview(xcoord: count*75, ycoord: 42)
    }
    @IBAction func C_hbtn(_ sender: Any) {
        count += 1
        
        placeview(xcoord: count*75, ycoord: 36)
    }
    
    
    // add a new parameter to change the staff if count% 10 == 0
    // fix the y coordinates and change the uiview controllers
    func placeview(xcoord:Int, ycoord: Int)
    {
        let imageName = "semibreve(25).png"
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
    


}

