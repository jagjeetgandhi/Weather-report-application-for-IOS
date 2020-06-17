//
//  weatherdata.swift
//  weather_app
//
//  Created by jagjeet on 29/04/20.
//  Copyright © 2020 jagjeet. All rights reserved.
//

import Foundation
struct orignaldata:Decodable {
    var name:String
    var main:Main
    var weather:[weather]
  
 
    
}
struct Main:Decodable {
         var temp:Double
       var feels_like:Double
}
struct weather:Decodable {
    var  id:Int
    var description:String
}
