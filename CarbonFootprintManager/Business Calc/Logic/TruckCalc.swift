//
//  TruckCalc.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/22/21.
//

import Foundation

class TruckCalc {
    static var TRUCK_TYPE = ["Grumans Olson/Navistar/Standard", "Grummans LLV", "2000s Propane Fueled", "2010s package car", "Ultilimaster + Isuzu Reach Chassis", "Ram ProMaster"]
    static var MPG = [16.2, 17.0, 15.1, 10.3, 13.7, 14.5]
    static var EMISSION_PER_GALLON = [((2421.0/454.0)*0.99*(44.0/12.0)), ((2421.0/454.0)*0.99*(44.0/12.0)), 12.7, ((2421.0/454.0)*0.99*(44.0/12.0)), ((2778/454.0)*0.99*(44.0/12.0)), ((2421/454.0)*0.99*(44.0/12.0))]
    
    var milesDriven = 0.0
    var truckType = 0
    
    init(_ mileCount: Double, _ truck: String) {
        milesDriven = mileCount
        truckType = CarbonFootprintManager.TruckCalc.TRUCK_TYPE.firstIndex(of: truck)!
    }
    
    func calcEmissions() -> Double{
        let gallons = milesDriven / CarbonFootprintManager.TruckCalc.MPG[truckType]
        
        return gallons * CarbonFootprintManager.TruckCalc.EMISSION_PER_GALLON[truckType]
    }
}
