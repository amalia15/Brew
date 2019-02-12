//
//  InitialViewController.swift
//  Brew2
//
//  Created by Amalia Alcantar on 5/7/18.
//  Copyright © 2018 Amalia Alcantar. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btn: UIImageView!
    @IBOutlet weak var btnLogIn: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsername.clearsOnBeginEditing = true
        txtPassword.clearsOnBeginEditing = true
        
        btnLogIn.layer.cornerRadius = 4
        btnSignUp.layer.cornerRadius = 4
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        UserDefaults.standard.set(txtUsername.text!, forKey: "username")
        let request = NSMutableURLRequest(url: NSURL(string:"https://aalcanta.create.stedwards.edu/mobile/signUp.php")! as URL)
        
        request.httpMethod = "POST";
        
        let postString = "a=\(txtUsername.text!)&b=\(txtPassword.text!)"
        
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
                    print("success")
                    self.performSegue(withIdentifier: "success", sender: self)
                }
                else
                {
                    let alertController = UIAlertController(title: "Error", message: "Incorrect username or password", preferredStyle: UIAlertControllerStyle.alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
                
                
            }
        }
        task.resume()
        txtPassword.text = ""
        txtUsername.text = ""
    
    
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
