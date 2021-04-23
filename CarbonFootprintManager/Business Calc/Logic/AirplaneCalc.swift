//
//  AirplaneCalc.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/22/21.
//

import Foundation

class AirplaneCalc {
    static var EMISSIONS_PER_GALLON = 20.0
    static var MPG = 0.2
    
    var miles: Double = 0
    
    init(_ milesTraveled: Double) {
        miles = milesTraveled
    }
    
    func totalEmission() -> Double {
        return miles / CarbonFootprintManager.AirplaneCalc.MPG * CarbonFootprintManager.AirplaneCalc.EMISSIONS_PER_GALLON
    }
}
