//
//  calc.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/20/21.
//

import Foundation

class calc {
    //states and their gas prices
    static let STATES_BY_NAME: [String] = ["Alaska", "Alabama", "Arkansas", "Arizona", "California", "Colorado", "Connecticut", "District of Columbia", "Delaware", "Florida", "Georgia", "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana", "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina", "North Dakota", "Nebraska", "New Hampshire", "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Virginia", "Vermont", "Washington", "Wisconsin", "West Virginia", "Wyoming"]
    static var COST_OF_GAS: [Double] = [3.23425, 2.93825, 2.973256, 3.275, 4.1195, 3.223, 3.159, 3.0135, 2.27325, 3.106, 3.008, 4.035, 3.0085, 3.289, 3.35925, 3.1395, 2.9665, 3.00825, 2.873, 3.01125, 3.11025, 3.07375, 3.09625, 2.9985, 2.90625, 2.847, 3.04925, 2.942, 3.007, 2.983, 2.98475, 3.16225, 3.152, 3.551, 3.1735, 3.057, 2.90425, 3.36225, 3.3105, 3.061, 2.8915, 3.04225, 2.997, 2.87775, 3.3275, 3.01025, 3.041, 3.5225, 3.0505, 3.04225, 3.16375]

    
    //emissions basic needs
    static var CAR_EMISSION_YEARLY = (1/26)*11398*19.6
    static var ELECTRIC_EMISSION_YEARLY = 14020/2.57
    
    //car cost
    static var CAR_GALLON_YEARLY = 276.0
    var cost_car_yearly = 0.0
    
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
    
    static var PHONE_EMISSION_YEARLY = 315.0*2.205 + 22.0*2.205
    
    //household variables
    var number_people: Double = 0
    var main_used = 0 // 0 - unset, 1 - electric, 2 - fuel oil, 3 - natural gas, 4 - propane
    var drivers_house: Double = 0
    
    var num_phones = 0.0
    
    init(_ numPeople: Double, _ drivers: Double, _ state: String) {
        number_people = numPeople
        drivers_house = drivers
        
        let index = CarbonFootprintManager.calc.STATES_BY_NAME.firstIndex(of: state)
        
        cost_car_yearly = (CarbonFootprintManager.calc.COST_OF_GAS[index!] as Double) * CarbonFootprintManager.calc.CAR_GALLON_YEARLY
    }
    
    init(_ numPeople: Double, _ mainHeating: Int, _ numPhones: Double) {
        main_used = mainHeating
        number_people = numPeople
        num_phones = numPhones
    }
    
     func calcEmissionTotal() -> Double{
        var emission_yearly: Double = CarbonFootprintManager.calc.CAR_EMISSION_YEARLY * drivers_house
        
        switch main_used {
        case 1:
            emission_yearly += CarbonFootprintManager.calc.ELECTRIC_EMISSION_YEARLY
        case 2:
            emission_yearly += CarbonFootprintManager.calc.FUEL_OIL_YEARLY
        case 3:
            emission_yearly += CarbonFootprintManager.calc.NATURAL_GAS_YEARLY
        case 4:
            emission_yearly += CarbonFootprintManager.calc.PROPANE_EMISSION_YEARLY
        default:
            emission_yearly = 0.0
        }
        
        return emission_yearly
    }
    
    func costHeat() -> Double{
        var cost_yearly: Double = Double(CarbonFootprintManager.calc.WASTE_EMISSIONS_YEARLY) * number_people + CarbonFootprintManager.calc.PHONE_EMISSION_YEARLY * num_phones
        
        switch main_used {
        case 1:
            cost_yearly += CarbonFootprintManager.calc.ELECTRIC_COST_YEARLY * number_people
        case 2:
            cost_yearly += CarbonFootprintManager.calc.FUEL_OIL_COST_YEARLY * number_people
        case 3:
            cost_yearly += CarbonFootprintManager.calc.NATURAL_GAS_COST_YEARLY * number_people
        case 4:
            cost_yearly += CarbonFootprintManager.calc.PROPANE_COST_YEARLY * number_people
        default:
            cost_yearly = 0.0
        }
        
        cost_yearly = Double(round(cost_yearly * 100.0)/100.0)
        
        return cost_yearly
    }
}
