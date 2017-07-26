//
//  Location.swift
//  myClima
//
//  Created by Matheus Pereiradarocha on 7/25/17.
//  Copyright © 2017 Matheus Pereiradarocha. All rights reserved.
//

import Foundation

class Location{
    static var sharedInstance = Location()
    private init (){}
    
    var latitude : Double!
    var longitude: Double!
}
