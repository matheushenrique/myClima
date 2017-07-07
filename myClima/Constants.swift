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
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)35\(LONGITUDE)139\(APP_ID)\(APP_KEY)"