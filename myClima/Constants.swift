//
//  Constants.swift
//  myClima
//
//  Created by Matheus Pereiradarocha on 7/5/17.
//  Copyright © 2017 Matheus Pereiradarocha. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE  = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let APP_KEY = "146ac34224ce35572b7b2fbd78b8f259"

//it will tell the function when we are finished with download
typealias DownloadComplete = () -> ()
//HARD CODING
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(APP_KEY)"

let BASE_FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let QNT_DAYS = "&cnt="
//api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10
let FORECAST_WEATHER_URL = "\(BASE_FORECAST_URL)\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(QNT_DAYS)10\(APP_ID)\(APP_KEY)"
