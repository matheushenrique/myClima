//
//  WeatherCell.swift
//  myClima
//
//  Created by Matheus Pereiradarocha on 7/6/17.
//  Copyright © 2017 Matheus Pereiradarocha. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var lowTemp: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    
    func configCell(forecast: Forecast){
        lowTemp.text = forecast.lowTemp
        highTemp.text = forecast.highTemp
        dayLbl.text = forecast.date
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }


}
