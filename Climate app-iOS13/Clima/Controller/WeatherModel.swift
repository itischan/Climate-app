//
//  WeatherModel.swift
//  Clima
//
// Created by Chandru on 08/24/2023


import Foundation


struct WeathermModel{
    let conditionId:Int
    let temperature:Double
    let cityName:String
    var temperatureString:String{
        return String(format: "%.1f", temperature)
        
    }
        
        
        
    
    var conditionName:String{
        switch conditionId{
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.snow"
        case 600...622:
            return "cloud.rain"
        case 700...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 800...804:
            return "cloud.bolt"
        default:
            return "cloud"}
    }
    
    
  
            
            
        
        }
     

