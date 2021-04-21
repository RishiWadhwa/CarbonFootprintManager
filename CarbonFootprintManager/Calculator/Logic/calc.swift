//
//  calc.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/20/21.
//

import Foundation

class calc {
    //emissions basic needs
    static var CAR_EMISSION_YEARLY = (1/26)*11398*19.6
    static var ELECTRIC_EMISSION_YEARLY = 14020/2.57
    
    //electric cost
    static var ELECTRIC_COST_YEARLY = 43.61*12
    
    //gasses emissions
    static var FUEL_OIL_YEARLY = 12460/2.57
    static var NATURAL_GAS_YEARLY = 7892/2.57
    static var PROPANE_EMISSION_YEARLY = 5766/2.57
    
    //gasses cost
    static var FUEL_OIL_COST_YEARLY = 71.82
    static var NATURAL_GAS_COST_YEARLY = 22.86*12
    static var PROPANE_COST_YEARLY = 37.16
    
    //waste emissions
    static var WASTE_EMISSIONS_YEARLY = 692
    
    //household variables
    static var number_people: Double = 0
    
    static func calc(_ numPeople: Double) {
        number_people = numPeople
    }
    
    static func calcEmissionTotal() -> Double{
        
        return 0.0
    }
    
    static func costTotal() -> Double{
        
        return 0.0
    }
}


//TODO: Emissions and cost methods
