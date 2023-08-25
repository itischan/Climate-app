//
//  ViewController.swift
//  Clima
//
//  Created by  Chandru on 08/24/2023



import UIKit
import AVFoundation
import CoreLocation
class WeatherViewController: UIViewController {
var weatherManager=WeatherManager()
    let locationManager=CLLocationManager()
  
    @IBOutlet var searchCity: UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate=self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        searchCity.delegate=self
        weatherManager.delegate=self
   
    }

    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    
}
//MARK - UITextFieldDelegate
extension WeatherViewController:UITextFieldDelegate{
    @IBAction func searchPressed(_ sender: Any) {
       
        searchCity.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     
        searchCity.endEditing(true)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder="Enter a valid value"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city=searchCity.text{
            weatherManager.fetchWeather(cityName: city)
        }
        searchCity.text=""
    }
    
}
//MARK - WeatherManagerDelegate
extension WeatherViewController:WeatherManagerDelegate{
    
     func didUpdate(weatherManager:WeatherManager,weather:WeathermModel){
         DispatchQueue.main.async {
             self.temperatureLabel.text=weather.temperatureString
             self.cityLabel.text=weather.cityName
             self.conditionImageView.image=UIImage(systemName:weather.conditionName )
         }
     
         
     }
     func didGiveError(error: Error) {
         print(error)
     }
    
}
//MARK -CLLocationManagerDelegate
extension WeatherViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location=locations.last{
            locationManager.stopUpdatingLocation()
            let lat=location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
           
           
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
