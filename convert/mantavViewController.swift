//
//  mantavViewController.swift
//  convert
//
//  Created by Mayank Daswani on 2/21/17.
//  Copyright © 2017 Mayank Daswani. All rights reserved.
//

import UIKit

class mantavViewController: UIViewController {
    var timeAtPress = NSDate()

    @IBOutlet weak var mntbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func manbutton(_ sender: Any) {
        let elapsed = Date().timeIntervalSince(timeAtPress as Date)
        
        print(elapsed)
        

        print("monkey")
    }

}
