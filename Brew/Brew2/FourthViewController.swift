//
//  FourthViewController.swift
//  Brew2
//
//  Created by Amalia Alcantar on 5/7/18.
//  Copyright © 2018 Amalia Alcantar. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
   
    @IBOutlet weak var lblCell: UILabel!
    
    var cellTitle: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
       lblCell.text = UserDefaults.standard.string(forKey: "name")!
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
