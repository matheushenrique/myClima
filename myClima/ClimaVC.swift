//
//  ClimaVC
//  myClima
//
//  Created by Matheus Pereiradarocha on 7/1/17.
//  Copyright © 2017 Matheus Pereiradarocha. All rights reserved.
//

import UIKit
import Alamofire
class ClimaVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var cidadeLbl: UILabel!
    @IBOutlet weak var climaAtualLbl: UILabel!
    @IBOutlet weak var climaAtualImg: UIImageView!
    @IBOutlet weak var tbView: UITableView!
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tbView.delegate = self
        tbView.dataSource = self
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            // setup UI to load downloaded data
            self.downloadForecastData {
                self.updateMainUI()
            }
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tbView.dequeueReusableCell(withIdentifier: "climaCell", for: indexPath) as? WeatherCell{
            let forecast = forecasts[indexPath.row]
            cell.configCell(forecast: forecast)
            return cell
        }else{
            return WeatherCell()
        }
        
    }
    func updateMainUI(){
        //        print("aqui")
        print(currentWeather.weatherType)
        dateLbl.text = currentWeather.date
        //        self.tempLabel.text = String(format: "%.0f", celsiusTemp)
        tempLbl.text = "\(currentWeather.currentTemp)"
        climaAtualLbl.text = currentWeather.weatherType
        cidadeLbl.text = currentWeather.cityName
        // TODO: verificar como pegar o nome do tempo em portugues, com o nome em ingle associado para poder continuar usando a namenclatura a seguir, ja que as imagens foram nomeadas desse jeito
        climaAtualImg.image = UIImage(named: currentWeather.weatherType)
    }
    //FIND A WAY TO PUT THIS IN OHTER MODEL FILE
    func downloadForecastData(completed: @escaping DownloadComplete){
        // downloading forecast weather data for table view
        let forecastURL = URL(string: FORECAST_WEATHER_URL)!
        //        print(CURRENT_WEATHER_URL)
        print(forecastURL)
        Alamofire.request(forecastURL).responseJSON{ response in
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject>{
                if let list = dict["list"] as? [Dictionary<String, AnyObject>]{
                    for obj in list{
                        let forecast = Forecast(weatherDict: obj)
                        //TODO: FIND OUT WHERE TO APPEND THIS TO THE ARRAY OBJECT IN THE CONTROLLER
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                    // remover o primeiro valor para em vez de colocar a data, colocar "Tomorrow"
                    self.forecasts.remove(at: 0)
                    // é preciso fazer um reload dos dados da tabela apos o download
                    self.tbView.reloadData()
                    
                }
            }
            print(response)
            completed()
        }
    }

}

