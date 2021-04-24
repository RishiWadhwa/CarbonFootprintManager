//
//  avoidSpending.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/20/21.
//

import Foundation

class avoidSpending {
    //num people in household
    var numPPL: Double = 0
    
    //waste savings by recycling
    static var METAL_SAVINGS = 89.38
    static var PLASTIC_SAVINGS = 35.56
    static var GLASS_SAVINGS = 25.39
    static var MAGAZINE_SAVINGS = 27.46
    static var NEWSPAPER_SAVINGS = 113.14
    
    init(_ numPeople: Double) {
        numPPL = numPeople
    }
    
    func calcReducing() -> Double{
        let savingsPerPerson = CarbonFootprintManager.avoidSpending.METAL_SAVINGS + CarbonFootprintManager.avoidSpending.PLASTIC_SAVINGS + CarbonFootprintManager.avoidSpending.GLASS_SAVINGS + CarbonFootprintManager.avoidSpending.MAGAZINE_SAVINGS + CarbonFootprintManager.avoidSpending.NEWSPAPER_SAVINGS
        
        let totalSavings = savingsPerPerson * numPPL
        
        return totalSavings
    }
}
