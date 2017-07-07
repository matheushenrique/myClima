//
//  Forecast.swift
//  myClima
//
//  Created by Matheus Pereiradarocha on 7/6/17.
//  Copyright © 2017 Matheus Pereiradarocha. All rights reserved.
//

import UIKit
import Alamofire

class Forecast{
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String{
        if _date == nil{
            _date = ""
        }
        return _date
    }
    var weatherType: String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    var highTemp: String{
        if _highTemp == nil{
            _highTemp = ""
        }
        return _highTemp
    }
    var lowTemp: String{
        if _lowTemp == nil{
            _lowTemp = ""
        }
        return _lowTemp
    }
    init(weatherDict: Dictionary<String, AnyObject>){
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject>{
            if let high = temp["max"] as? Double{
                let celsiusTemp = high - 273.15
                self._highTemp = String(format:"%.2f", celsiusTemp)
            }
            if let low = temp["min"] as? Double{
                let celsiusTemp = low - 273.15
                self._lowTemp = String(format:"%.2f", celsiusTemp)
            }
        }
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>]{
            if let weather = weather[0]["main"] as? String {
                self._weatherType = weather
            }
        }
        if let date = weatherDict["dt"] as? Double{
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
    //    {
    //    "cod": "200",
    //    "message": 0,
    //    "city": {
    //    "geoname_id": 1907296,
    //    "name": "Tawarano",
    //    "lat": 35.0164,
    //    "lon": 139.0077,
    //    "country": "JP",
    //    "iso2": "JP",
    //    "type": "",
    //    "population": 0
    //    },
    //    "cnt": 10,
    //    "list": [
    //    {
    //    "dt": 1485741600,
    //    "temp": {
    //    "day": 285.51,
    //    "min": 285.51,
    //    "max": 285.51,
    //    "night": 285.51,
    //    "eve": 285.51,
    //    "morn": 285.51
    //    },
    //    "pressure": 1013.75,
    //    "humidity": 100,
    //    "weather": [
    //    {
    //    "id": 800,
    //    "main": "Clear",
    //    "description": "sky is clear",
    //    "icon": "01n"
    //    }
    //    ],
    //    "speed": 5.52,
    //    "deg": 311,
    //    "clouds": 0
    //    },
    //    {
    //    "dt": 1485828000,
    //    "temp": {
    //    "day": 282.27,
    //    "min": 282.27,
    //    "max": 284.66,
    //    "night": 284.66,
    //    "eve": 282.78,
    //    "morn": 282.56
    //    },
    //    "pressure": 1023.68,
    //    "humidity": 100,
    //    "weather": [
    //    {
    //    "id": 800,
    //    "main": "Clear",
    //    "description": "sky is clear",
    //    "icon": "01d"
    //    }
    //    ],
    //    "speed": 5.46,
    //    "deg": 66,
    //    "clouds": 0
    //    },
    //    {
    //    "dt": 1485914400,
    //    "temp": {
    //    "day": 284.83,
    //    "min": 283.21,
    //    "max": 285.7,
    //    "night": 284.16,
    //    "eve": 285.49,
    //    "morn": 283.21
    //    },
    //    "pressure": 1017.39,
    //    "humidity": 100,
    //    "weather": [
    //    {
    //    "id": 800,
    //    "main": "Clear",
    //    "description": "sky is clear",
    //    "icon": "02d"
    //    }
    //    ],
    //    "speed": 13.76,
    //    "deg": 260,
    //    "clouds": 8
    //    },
    //    {
    //    "dt": 1486000800,
    //    "temp": {
    //    "day": 283.71,
    //    "min": 281.86,
    //    "max": 285.13,
    //    "night": 283.81,
    //    "eve": 284.76,
    //    "morn": 281.86
    //    },
    //    "pressure": 1017.36,
    //    "humidity": 100,
    //    "weather": [
    //    {
    //    "id": 800,
    //    "main": "Clear",
    //    "description": "sky is clear",
    //    "icon": "01d"
    //    }
    //    ],
    //    "speed": 8.95,
    //    "deg": 288,
    //    "clouds": 0
    //    },
    //    {
    //    "dt": 1486087200,
    //    "temp": {
    //    "day": 280,
    //    "min": 275.68,
    //    "max": 283.75,
    //    "night": 278.79,
    //    "eve": 283.75,
    //    "morn": 275.68
    //    },
    //    "pressure": 996.2,
    //    "humidity": 0,
    //    "weather": [
    //    {
    //    "id": 500,
    //    "main": "Rain",
    //    "description": "light rain",
    //    "icon": "10d"
    //    }
    //    ],
    //    "speed": 5.92,
    //    "deg": 295,
    //    "clouds": 0
    //    },
    //    {
    //    "dt": 1486173600,
    //    "temp": {
    //    "day": 279.4,
    //    "min": 276.69,
    //    "max": 283.22,
    //    "night": 277.58,
    //    "eve": 283.22,
    //    "morn": 276.69
    //    },
    //    "pressure": 998.07,
    //    "humidity": 0,
    //    "weather": [
    //    {
    //    "id": 800,
    //    "main": "Clear",
    //    "description": "sky is clear",
    //    "icon": "01d"
    //    }
    //    ],
    //    "speed": 3.71,
    //    "deg": 314,
    //    "clouds": 0
    //    },
    //    {
    //    "dt": 1486260000,
    //    "temp": {
    //    "day": 280.88,
    //    "min": 276.28,
    //    "max": 284.66,
    //    "night": 281.2,
    //    "eve": 284.66,
    //    "morn": 276.28
    //    },
    //    "pressure": 997.4,
    //    "humidity": 0,
    //    "weather": [
    //    {
    //    "id": 500,
    //    "main": "Rain",
    //    "description": "light rain",
    //    "icon": "10d"
    //    }
    //    ],
    //    "speed": 2.1,
    //    "deg": 337,
    //    "clouds": 66,
    //    "rain": 0.28
    //    },
    //    {
    //    "dt": 1486346400,
    //    "temp": {
    //    "day": 281.58,
    //    "min": 278.74,
    //    "max": 283.76,
    //    "night": 278.74,
    //    "eve": 283.76,
    //    "morn": 279.15
    //    },
    //    "pressure": 991.11,
    //    "humidity": 0,
    //    "weather": [
    //    {
    //    "id": 501,
    //    "main": "Rain",
    //    "description": "moderate rain",
    //    "icon": "10d"
    //    }
    //    ],
    //    "speed": 2.69,
    //    "deg": 2,
    //    "clouds": 4,
    //    "rain": 3.72
    //    },
    //    {
    //    "dt": 1486432800,
    //    "temp": {
    //    "day": 277.62,
    //    "min": 275.86,
    //    "max": 281.14,
    //    "night": 276.45,
    //    "eve": 281.14,
    //    "morn": 275.86
    //    },
    //    "pressure": 993.37,
    //    "humidity": 0,
    //    "weather": [
    //    {
    //    "id": 800,
    //    "main": "Clear",
    //    "description": "sky is clear",
    //    "icon": "01d"
    //    }
    //    ],
    //    "speed": 2.05,
    //    "deg": 353,
    //    "clouds": 47,
    //    "rain": 0.52,
    //    "snow": 0.03
    //    },
    //    {
    //    "dt": 1486519200,
    //    "temp": {
    //    "day": 279.26,
    //    "min": 275.51,
    //    "max": 281.61,
    //    "night": 276.55,
    //    "eve": 281.61,
    //    "morn": 275.51
    //    },
    //    "pressure": 991.72,
    //    "humidity": 0,
    //    "weather": [
    //    {
    //    "id": 500,
    //    "main": "Rain",
    //    "description": "light rain",
    //    "icon": "10d"
    //    }
    //    ],
    //    "speed": 3.47,
    //    "deg": 326,
    //    "clouds": 2,
    //    "rain": 0.35
    //    }
    //    ]
    //    }

}
extension Date{
    func dayOfTheWeek() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
