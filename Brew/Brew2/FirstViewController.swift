//
//  FirstViewController.swift
//  Brew2
//
//  Created by Amalia Alcantar on 4/25/18.
//  Copyright © 2018 Amalia Alcantar. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        btnSignUp.layer.cornerRadius = 4
                // You need to adopt a FUIAuthDelegate protocol to receive callback
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

