//
//  CurrentWeather.swift
//  myClima
//
//  Created by Matheus Pereiradarocha on 7/5/17.
//  Copyright © 2017 Matheus Pereiradarocha. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String{
        get{
            if _cityName == nil{
                _cityName = ""
            }
            return _cityName
        }set{
            _cityName = newValue
        }
    }
    var weatherType: String{
        get{
            if _weatherType == nil{
                _weatherType = ""
            }
            return _weatherType
        }set{
            _weatherType = newValue
        }
    }
    var currentTemp: Double{
        get{
            if _currentTemp == nil{
                _currentTemp = 0.0
            }
            return _currentTemp
        }set{
            _currentTemp = newValue
        }
    }
    var date: String{
        get{
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            let currentDate = dateFormatter.string(from: Date())
            self._date = "Today, \(currentDate)"
            //            shouldn't this be done in a view?
            return _date
        }set{
            _date = newValue
        }
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete){
        // alamofire where to download from
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        //        print(CURRENT_WEATHER_URL)
        //what the JSON returns
        //            {
        //                "coord": {
        //                    "lon": 139,
        //                    "lat": 35
        //                },
        //                "weather": [
        //                {
        //                "id": 801,
        //                "main": "Clouds",
        //                "description": "few clouds",
        //                "icon": "02n"
        //                }
        //                ],
        //                "base": "stations",
        //                "main": {
        //                    "temp": 296.006,
        //                    "pressure": 1017.47,
        //                    "humidity": 100,
        //                    "temp_min": 296.006,
        //                    "temp_max": 296.006,
        //                    "sea_level": 1026.6,
        //                    "grnd_level": 1017.47
        //                },
        //                "wind": {
        //                    "speed": 0.18,
        //                    "deg": 356.501
        //                },
        //                "clouds": {
        //                    "all": 20
        //                },
        //                "dt": 1499378186,
        //                "sys": {
        //                    "message": 0.0019,
        //                    "country": "JP",
        //                    "sunrise": 1499283384,
        //                    "sunset": 1499335269
        //                },
        //                "id": 1851632,
        //                "name": "Shuzenji",
        //                "cod": 200
        //        }
                print(currentWeatherURL)
        Alamofire.request(currentWeatherURL).responseJSON{ response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let name = dict["name"] as? String{
                    self._cityName = name.capitalized
                    print (self._cityName)
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]{
                    if let main = weather[0]["main"] as? String{
                       self._weatherType = main.capitalized
                        print (self._weatherType)
                    }
                    
                }
                if let main = dict["main"] as? Dictionary<String, AnyObject>{
                    if let temp = main["temp"] as? Double{
                        let celsiusTemp = temp - 273.15
                        self._currentTemp = celsiusTemp
                        print (self._currentTemp)
                    }
                }
            }
            print(response)
            completed()
        }        
    }
}
