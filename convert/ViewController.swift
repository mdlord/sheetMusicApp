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
            let position = touch.location(in: self.staffone)
            print(position.x)
            print(position.y)
        }
    }
    
    
    
    @IBAction func Cbtn(_ sender: Any) {
        count += 1
//        findypos()
        print(count)
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
        placeview(xcoord: 200, ycoord: 100)
    }
    @IBAction func Fbtn(_ sender: Any) {
        count += 1
//        findypos()
        print(count)
        
        placeview(xcoord: 300, ycoord: 100)
    }
    @IBAction func Gbtn(_ sender: Any) {
        count += 1
//        findypos()
        print(count)
        
        placeview(xcoord: 400, ycoord: 100)
    }
    @IBAction func Abtn(_ sender: Any) {
        count += 1
//        findypos()
        print(count)
        placeview(xcoord: 500, ycoord: 100)
    }
    @IBAction func Bbtn(_ sender: Any) {
        count += 1
//        findypos()
        print(count)
        placeview(xcoord: 600, ycoord: 100)
    }
    
    func placeview(xcoord:Int, ycoord: Int)
    {
        let imageName = "semibreve(25).png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFill
        
        
        imageView.frame = CGRect(x: xcoord, y: ycoord, width: 25, height: 45)
        view.addSubview(imageView)
    }
    
    func findypos()
    {
        
    }
    
    func findxpos()
    {
    
    }

}

