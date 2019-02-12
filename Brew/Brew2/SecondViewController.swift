//
//  SecondViewController.swift
//  Brew
//
//  Created by COSC3325 on 4/23/18.
//  Copyright © 2018 cosc 3331. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import Foundation

class SecondViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate,  UITableViewDelegate, UITableViewDataSource{
    var cellTitle = ""
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let mainData = coffeNames[indexPath.row] as? [String:Any]
        cell.textLabel?.text = mainData?["coffeeName"] as? String
        cellTitle = (cell.textLabel?.text)!
        return cell
    }
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tblCoffee: UITableView!
    
    var locations: NSArray = []
    var coffeNames:NSArray = []

    
    var locationManager = CLLocationManager()
    
    func loadCoffeeAddress()
    {
        let queryItems = [URLQueryItem(name: "username", value: UserDefaults.standard.string(forKey: "username"))]
        
        var components = URLComponents()
        components.host = "aalcanta.create.stedwards.edu"
        components.path = "/mobile/selectLocation.php"
        components.scheme = "https"
        components.queryItems = queryItems
        
        if let data = try? Data(contentsOf: components.url! ) {
            locations = try! JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
            print(String(data: data, encoding: .utf8))
            
        }
        else {
            print("ERROR COULD NOT GET CONTENTS OF \(components.url)")
        }
    }
    func loadCoffeeNames()
    {
        let queryItems = [URLQueryItem(name: "username", value: UserDefaults.standard.string(forKey: "username"))]
        
        var components = URLComponents()
        components.host = "aalcanta.create.stedwards.edu"
        components.path = "/mobile/selectAllCoffeeShops.php"
        components.scheme = "https"
        components.queryItems = queryItems
    
        if let data = try? Data(contentsOf: components.url! ) {
            coffeNames = try! JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
            print(String(data: data, encoding: .utf8))
            tblCoffee.reloadData()
        }
        else {
            print("ERROR COULD NOT GET CONTENTS OF \(components.url)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //make austin a point on the map
        loadCoffeeAddress()
        loadCoffeeNames()
        
        
        let city = MKPointAnnotation()
        city.coordinate = CLLocationCoordinate2DMake(30.2671,-97.743)
        city.title = "Austin, Texas"
        city.subtitle = "Howdy"
        //set austin as the original view
        let myRegion = MKCoordinateRegionMakeWithDistance(city.coordinate, 500, 600)
        mapView.setRegion(myRegion, animated: true)
        
        
    }
    
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadCoffeeNames()
        loadCoffeeAddress()
        for number in 0..<(locations.count)
        {
            print(locations)
            let location = MKPointAnnotation()
            var geocoder = CLGeocoder()
            let mainData = locations[number] as? [String:Any]
            geocoder.geocodeAddressString((mainData?["coffeeAddress"] as? String)!) {
                placemarks, error in
                let placemark = placemarks?.first
                let lat = placemark?.location?.coordinate.latitude
                let lon = placemark?.location?.coordinate.longitude
                location.coordinate = CLLocationCoordinate2DMake(lat!, lon!)
                let nameData = self.coffeNames[number] as? [String:Any]
                location.title = nameData?["coffeeName"] as! String
                self.mapView.addAnnotation(location)
            }
    }
    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        func tableView(tableView: UITableView, didSelectRowAt indexPath : IndexPath)
    {
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        cellTitle = (currentCell.textLabel?.text)!
        print("cell title: \(cellTitle)")
        UserDefaults.standard.set(cellTitle, forKey: "name")
        
        }
    
    
    
}


}
