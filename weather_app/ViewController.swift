//
//  ViewController.swift
//  weather_app
//
//  Created by jagjeet on 24/03/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,UITextFieldDelegate,weatherforecastDelegate,CLLocationManagerDelegate {
    var passingurl:URL?
    
  var forecast = weatherforecast()
     let locationManager = CLLocationManager()
    
    @IBOutlet weak var templabel:UILabel!
    
    @IBOutlet weak var weather:UIImageView!
    
    @IBOutlet weak var searchfield:UITextField!
    @IBOutlet weak var cityname:UILabel!
    @IBOutlet weak var locationbutton:UIButton!
    @IBAction  func getlocation(_ sender:UIButton) {
        locationManager.requestLocation()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        forecast.delegate = self
        searchfield.delegate=self
        locationbutton.layer.cornerRadius = 15
        searchfield.placeholder = "Search City"
       
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        
        
    }
    @IBAction func find(_ sender:UIButton) {
        self.textFieldShouldReturn(searchfield)
        searchfield.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let city = textField.text{
            
        passingurl=forecast.cityweather(cityname:city)
            forecast.searching(urlstring: passingurl!)
               searchfield.endEditing(true)
             
        }
        return true
    }
    func shouldUpdateUI(wobj:weathermodel) {
        DispatchQueue.main.async {
            self.templabel.text = wobj.citytemp
            self.weather.image = UIImage(systemName: wobj.conditionname)
            self.cityname.text = wobj.name
            print(wobj.citytemp)
            print(wobj.name)
            print(wobj.id)
           
          self.searchfield.text = ""
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        locationManager.stopUpdatingLocation()
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let long = location.coordinate.longitude
            print(lat)
            print(long)
            let cityurl =  forecast.createURL(lat,long)
            forecast.searching(urlstring: cityurl)
            searchfield.endEditing(true)
        }
       
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
       
    }

}
