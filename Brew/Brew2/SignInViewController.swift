//
//  SignInViewController.swift
//  Brew2
//
//  Created by Amalia Alcantar on 5/8/18.
//  Copyright © 2018 Amalia Alcantar. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUserName.clearsOnBeginEditing = true
        txtPassword.clearsOnBeginEditing = true
        txtName.clearsOnBeginEditing = true
        
        btnSignUp.layer.cornerRadius = 4
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        let request = NSMutableURLRequest(url: NSURL(string:"https://aalcanta.create.stedwards.edu/mobile/insert.php")! as URL)
        
        request.httpMethod = "POST";
        
        let postString = "a=\(txtUserName.text!)&b=\(txtPassword.text!)&c=\(txtName.text!)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task=URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            if error != nil{
                print("error=\(error!)")
                return
            }
            
            print("response = \(response!)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString!)")
            
            DispatchQueue.main.async(){
                //check if username already exists, mysql will throw an exception
                if(responseString! == "Success")
                {
                    let alertController = UIAlertController(title: "New Account", message: "Successully added", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    self.present(alertController, animated: true, completion: nil)
                }
                else
                {
                    let alertController = UIAlertController(title: "Cannot create new account", message: "Username already exists", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
                
                self.txtUserName.text = ""
                self.txtPassword.text = ""
                self.txtName.text = ""
            }
        }
        task.resume()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
