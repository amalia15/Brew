//
//  ThirdViewController.swift
//  Brew2
//
//  Created by Amalia Alcantar on 5/6/18.
//  Copyright © 2018 Amalia Alcantar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ThirdViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
//----VARIABLES--------------------------//
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
  
    
    
    @IBOutlet weak var lblCozy: UIButton!
    var isCozy = false
    @IBOutlet weak var lblModern: UIButton!
    var isModern = false
    
    @IBOutlet weak var btnRead: UIButton!
    var isRead = false
    @IBOutlet weak var btnWork: UIButton!
    var isWork = false
    @IBOutlet weak var btnSocialize: UIButton!
    var isSocial = false
    
    @IBOutlet weak var btnCoffee: UIButton!
    var isCoffee = false
    @IBOutlet weak var btnWiFi: UIButton!
    var isWiFi = false
    @IBOutlet weak var btnFood: UIButton!
    var isFood = false
    
    
    
    
    var name = ""
    var location = ""
    var style = ""
    var activity = ""
    var quality = ""
    let pink = UIColor(displayP3Red: 254/255, green:225/255, blue: 201/255, alpha: 1.0)
    let brown = UIColor(displayP3Red: 150/255, green:105/255, blue: 47/255, alpha: 1.0)
//-----------END OF VARIABLES--------------------//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.clearsOnBeginEditing = true
        txtAddress.clearsOnBeginEditing = true
        txtDescription.clearsOnInsertion = true
        
        
        lblCozy.layer.borderColor = UIColor(displayP3Red: 150/255, green:105/255, blue: 47/255, alpha: 1.0).cgColor
        lblCozy.layer.borderWidth = 2.0
        lblCozy.layer.cornerRadius = 4
        
        lblModern.layer.borderColor = UIColor(displayP3Red: 150/255, green:105/255, blue: 47/255, alpha: 1.0).cgColor
        lblModern.layer.borderWidth = 2.0
        lblModern.layer.cornerRadius = 4
        
        btnRead.layer.borderColor = UIColor(displayP3Red: 150/255, green:105/255, blue: 47/255, alpha: 1.0).cgColor
        btnRead.layer.borderWidth = 2.0
        btnRead.layer.cornerRadius = 4
        
        btnWork.layer.borderColor = UIColor(displayP3Red: 150/255, green:105/255, blue: 47/255, alpha: 1.0).cgColor
        btnWork.layer.borderWidth = 2.0
        btnWork.layer.cornerRadius = 4
        
        btnSocialize.layer.borderColor = UIColor(displayP3Red: 150/255, green:105/255, blue: 47/255, alpha: 1.0).cgColor
        btnSocialize.layer.borderWidth = 2.0
        btnSocialize.layer.cornerRadius = 4
        
        btnCoffee.layer.borderColor = UIColor(displayP3Red: 150/255, green:105/255, blue: 47/255, alpha: 1.0).cgColor
        btnCoffee.layer.borderWidth = 2.0
        btnCoffee.layer.cornerRadius = 4
        
        btnWiFi.layer.borderColor = UIColor(displayP3Red: 150/255, green:105/255, blue: 47/255, alpha: 1.0).cgColor
        btnWiFi.layer.borderWidth = 2.0
        btnWiFi.layer.cornerRadius = 4
        
        btnFood.layer.borderColor = UIColor(displayP3Red: 150/255, green:105/255, blue: 47/255, alpha: 1.0).cgColor
        btnFood.layer.borderWidth = 2.0
        btnFood.layer.cornerRadius = 4
        
       
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCozy(_ sender: UIButton) {
        
        if(isCozy == false)
        {
            isCozy = true
            isModern = false
            lblModern.backgroundColor = brown
            lblModern.setTitleColor(pink, for: .normal)
            style = "cozy"
        }
        else
        {
            isCozy = false
            style = ""
            
        }
        print("after: \(isCozy)")
        let color =  isCozy ? .clear : UIColor(displayP3Red: 150/255, green:105/255, blue: 47/255, alpha: 1.0)
        let fontColor = isCozy ? UIColor(displayP3Red: 150/255, green:105/255, blue: 47/255, alpha: 1.0) : UIColor(displayP3Red: 254/255, green:225/255, blue: 201/255, alpha: 1.0)
        lblCozy.backgroundColor = color
        lblCozy.setTitleColor(fontColor, for: .normal)
        
        
    }
    @IBAction func btnModern(_ sender: Any) {
        
        if(isModern == false)
        {
            isModern = true
            isCozy = false
            lblCozy.backgroundColor = brown
            lblCozy.setTitleColor(pink, for: .normal)
            style = "modern"
        }
        else
        {
            isModern = false
            style = ""
        }
        
        let color =  isModern ? .clear : brown
        let fontColor = isModern ? brown : pink
        lblModern.backgroundColor = color
        lblModern.setTitleColor(fontColor, for: .normal)
        
        
    }
    
    @IBAction func btnRead(_ sender: UIButton) {
        if(isRead == false)
        {
            isRead = true
            isWork = false
            isSocial = false
            
            btnWork.backgroundColor = brown
            btnWork.setTitleColor(pink, for: .normal)
            btnSocialize.backgroundColor = brown
            btnSocialize.setTitleColor(pink, for: .normal)
            
            activity = "read"
        }
        else
        {
            isRead = false
            activity = ""
        }
        let color =  isRead ? .clear : brown
        let fontColor = isRead ? brown : pink
        btnRead.backgroundColor = color
        btnRead.setTitleColor(fontColor, for: .normal)
    }
    
    @IBAction func btnWork(_ sender: UIButton) {
        if(isWork == false)
        {
            isWork = true
            isRead = false
            isSocial = false
            
            btnRead.backgroundColor = brown
            btnRead.setTitleColor(pink, for: .normal)
            btnSocialize.backgroundColor = brown
            btnSocialize.setTitleColor(pink, for: .normal)
            
            activity = "work"
            
        }
        else
        {
            isWork = false
            activity = ""
        }
        
        let color =  isWork ? .clear : brown
        let fontColor = isWork ? brown : pink
        btnWork.backgroundColor = color
        btnWork.setTitleColor(fontColor, for: .normal)
    }
    
    @IBAction func btnSocialize(_ sender: UIButton) {
        if(isSocial == false)
        {
            isSocial = true
            isRead = false
            isWork = false
            
            btnRead.backgroundColor = brown
            btnRead.setTitleColor(pink, for: .normal)
            btnWork.backgroundColor = brown
            btnWork.setTitleColor(pink, for: .normal)
            
            activity = "socialize"
        }
        else
        {
            isSocial = false
            activity = ""
            
        }
        let color =  isSocial ? .clear : brown
        let fontColor = isSocial ? brown : pink
        btnSocialize.backgroundColor = color
        btnSocialize.setTitleColor(fontColor, for: .normal)
    }
    
    @IBAction func btnCoffee(_ sender: UIButton) {
        if(isCoffee == false)
        {
            isCoffee = true
            isWiFi = false
            isFood = false
            
            btnWiFi.backgroundColor = brown
            btnWiFi.setTitleColor(pink, for: .normal)
            btnFood.backgroundColor = brown
            btnFood.setTitleColor(pink, for: .normal)
            
            quality = "coffee"
        }
        else
        {
            isCoffee = false
            quality = ""
        }
        let color =  isCoffee ? .clear : brown
        let fontColor = isCoffee ? brown : pink
        btnCoffee.backgroundColor = color
        btnCoffee.setTitleColor(fontColor, for: .normal)
    }
    
    @IBAction func btnWiFi(_ sender: UIButton) {
        if(isWiFi == false)
        {
            isWiFi = true
            isCoffee = false
            isFood = false
            
            btnCoffee.backgroundColor = brown
            btnCoffee.setTitleColor(pink, for: .normal)
            btnFood.backgroundColor = brown
            btnFood.setTitleColor(pink, for: .normal)
            
            quality = "WiFi"
        }
        else
        {
            isWiFi = false
            quality = ""
        }
        let color =  isWiFi ? .clear : brown
        let fontColor = isWiFi ? brown : pink
        btnWiFi.backgroundColor = color
        btnWiFi.setTitleColor(fontColor, for: .normal)
    }
    
    @IBAction func btnFood(_ sender: UIButton) {
        if(isFood == false)
        {
            isFood = true
            isCoffee = false
            isWiFi = false
            
            btnCoffee.backgroundColor = brown
            btnCoffee.setTitleColor(pink, for: .normal)
            btnWiFi.backgroundColor = brown
            btnWiFi.setTitleColor(pink, for: .normal)
            
            quality = "food"
            
        }
        else
        {
            isFood = false
            quality = ""
        }
        let color =  isFood ? .clear : brown
        let fontColor = isFood ? brown : pink
        btnFood.backgroundColor = color
        btnFood.setTitleColor(fontColor, for: .normal)
    }
    
        

    
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSumbit(_ sender: UIButton) {
        name = txtName.text!
        location = txtAddress.text!
        
        if(name != "" && location != "" && activity != "" && quality != "" && style != "")
        {
            getLatLong(address: txtAddress.text!)
            
            let request = NSMutableURLRequest(url: NSURL(string:"https://aalcanta.create.stedwards.edu/mobile/insertCoffee.php")! as URL)
            
            request.httpMethod = "POST";
            
            let postString = "a=\(txtName.text!)&b=\(location)&c=\(txtDescription.text!)&d=\(style)&e=\(activity)&f=\(quality)&h=\(UserDefaults.standard.object(forKey: "username")!)"
            
            request.httpBody = postString.data(using: String.Encoding.utf8)
            
            let task=URLSession.shared.dataTask(with: request as URLRequest){
                data, response, error in
                if error != nil{
                    return
                }
                
                let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("responseString = \(responseString!)")
                
                DispatchQueue.main.async(){
                    //check if username already exists, mysql will throw an exception
                    if(responseString! == "Success")
                    {
                        let alertController = UIAlertController(title: "Success", message: "New coffee shop added!", preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                    else
                    {
                        let alertController = UIAlertController(title: "Oops something failed", message: "Try again later.", preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
                
            }
            
            task.resume()
            reset()
        }
        else {
            if(name == "")
            {
                let alertController = UIAlertController(title: "Cannot create new shop account.", message: "Missing shop name", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
            if(txtAddress.text! == "")
            {
                
                let alertController = UIAlertController(title: "Cannot create new shop account.", message: "Missing location name", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
            if(activity == ""  || quality == "" || style == "")
            {
                let alertController = UIAlertController(title: "Cannot create new shop account.", message: "Missing attributes", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }

            
        }
        
        
        
    }
            
    func reset()
    {
        txtName.text = ""
        txtAddress.text = ""
        txtDescription.text = ""
        location = ""
        style = ""
        activity = ""
        quality = ""
        
        lblCozy.backgroundColor = brown
        lblCozy.setTitleColor(pink, for: .normal)
        lblModern.backgroundColor = brown
        lblModern.setTitleColor(pink, for: .normal)
        
        btnCoffee.backgroundColor = brown
        btnCoffee.setTitleColor(pink, for: .normal)
        btnFood.backgroundColor = brown
        btnFood.setTitleColor(pink, for: .normal)
        btnWiFi.backgroundColor = brown
        btnWiFi.setTitleColor(pink, for: .normal)
        
        btnRead.backgroundColor = brown
        btnRead.setTitleColor(pink, for: .normal)
        btnWork.backgroundColor = brown
        btnWork.setTitleColor(pink, for: .normal)
        btnSocialize.backgroundColor = brown
        btnSocialize.setTitleColor(pink, for: .normal)
        
    }
    
    func getCoordinate( addressString : String,
                        completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location!
                    
                    completionHandler(location.coordinate, nil)
                    return
                }
            }
            
            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
        }
    }
    
    func getLatLong(address: String)
    {
        var geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) {
            placemarks, error in
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            
            print("Lat: \(lat), Lon: \(lon)")
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
     
 
    
}

