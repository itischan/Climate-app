//
//  WeatherManager.swift
//  Clima
//
// Created by Chandru on 08/24/2023.

import Foundation
import CoreLocation

protocol WeatherManagerDelegate{
    func didUpdate(weatherManager:WeatherManager,weather:WeathermModel)
    func didGiveError(error:Error)
    
}
struct WeatherManager{
    
    var delegate:WeatherManagerDelegate?
    let weatherurl="https://api.openweathermap.org/data/2.5/weather?appid=d396ee348c5b5cdd4ba9993065d86899&units=metric"
    
    func fetchWeather(cityName:String){
        //concatentating the weather url with cityName entered by the user
        let weather = "\(weatherurl)&q=\(cityName)"
     
        performRequest(with:  weather)
        
    }
    func fetchWeather(latitude:CLLocationDegrees,longitude:CLLocationDegrees){
        let weatherCoor="\(weatherurl)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: weatherCoor)
        
    }
    
    
    func performRequest(with weatherUrl:String){
        //Create a url
        if  let url=URL(string: weatherUrl){
            //Create a url session
            let session=URLSession(configuration: .default)
            //Give the session a task using trailing closures where functions come after assigning values
            
            let task=session.dataTask(with: url) { data, respone, error in
                if error != nil{
                    self.delegate?.didGiveError(error: error!)
                    return
                }
                if let safeData=data{
                    if let weather=self.performJson(weatherData: safeData){
                        self.delegate?.didUpdate(weatherManager: self,weather: weather)
                    }
                                       
                }
                
            }
            //Starting the task
            task.resume()
            
        }
    }
    func performJson(weatherData:Data)->WeathermModel?{
        let decoder = JSONDecoder()
        do{
            let decodedValue=try decoder.decode(WeatherData.self, from: weatherData)
            let id=decodedValue.weather[0].id
            let temp=decodedValue.main.temp
            let name=decodedValue.name
            
            
            let weather=WeathermModel(conditionId: id, temperature: temp, cityName: name)
            return weather
            
                    }
        catch{
            delegate?.didGiveError(error: error)
            return nil
        }
        
        
    }
   
}
