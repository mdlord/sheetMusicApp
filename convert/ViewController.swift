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
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //placeview()

        // Do any additional setup after loading the view, typically from a nib.
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
            let position = touch.location(in: self.stafftwo)
            print(position.x)
            print(position.y)
        }
    }
    // note = x
// spaces----------------------------
    // F_l = 66
    // A   = 52                 difference  = 12.5
    // C_h = 38
    // E_h = 24
    
// lines-----------------------------
    // E_l= 72
    // G  = 58
    // B  = 46                   difference  = 12.5
    // D  = 32
    // F_h= 18
    

    
    
    @IBAction func Cbtn(_ sender: Any) {
        count += 1
//        findypos()
        print(count)
//        findypos(y: <#T##Int#>)
        placeview(xcoord: 100, ycoord: 100)
    }
    @IBAction func Dbtn(_ sender: Any) {
        count += 1
//        findypos()
        print(count)
        placeview(xcoord: 100, ycoord: 100)
    }
    @IBAction func Ebtn(_ sender: Any) {
        count += 1
//        findypos()
        print(count)
        placeview(xcoord: 200, ycoord: Int(72))
    }
    @IBAction func Fbtn(_ sender: Any) {
        count += 1
//        findypos()
        print(count)
        
        placeview(xcoord: 300, ycoord: Int(66))
    }
    @IBAction func Gbtn(_ sender: Any) {
        count += 1
//        findypos()
        print(count)
        
        placeview(xcoord: 400, ycoord: 58)
    }
    @IBAction func Abtn(_ sender: Any) {
        count += 1
//        findypos()
        print(count)
        placeview(xcoord: 500, ycoord: 52)
    }
    @IBAction func Bbtn(_ sender: Any) {
        count += 1
//        findypos()
        print(count)
        placeview(xcoord: 600, ycoord: 46)
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
        view.addSubview(imageView)
    }
    
    func changestaff()->Bool{
        if count%10 == 0{
            return true
        }
        else{
            return false
        }
    }
//    
//    func findypos(y: Int)-> Int
//    {
//        // difference between two staffs 205
//        if changestaff() == true
//        {
//            return y
//        }
//    }
//    
    func findxpos()
    {
    
    }

}

