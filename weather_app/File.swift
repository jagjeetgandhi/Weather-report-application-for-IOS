//
//  File.swift
//  weather_app
//
//  Created by jagjeet on 05/05/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import Foundation
struct weathermodel {
    var name:String
    var id:Int
    var temp:Double
    
    var citytemp:String {
        return String(format: "%.1f",temp)
        
    }
    
    var conditionname:String {
           switch id {
           case 200...232:
               return "cloud.bolt"
           case 300...321:
               return "drizzle"
           case 500...531:
               return "cloud.rain"
           case 600...622:
               return "cloud.snow"
           case 700...781:
               return "cloud.fog"
           case 800:
               return "sun.max"
           case 801...804:
               return "cloud.bolt"
               
           default:
               return "cloud.fill"
           }
            
       }
}
