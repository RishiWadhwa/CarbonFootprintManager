//
//  ProjectionCalc.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 8/9/21.
//

import Foundation
import UIKit

class ProjectionCalc {
    static let NUM_PEOPLE = 8000000000
    static let TONS_PER_PERSON = 12
    
    static let MAX_CARBON_TONS = 463784000000
    
    static fileprivate func tonsInWorld() -> Double {
        return Double(NUM_PEOPLE * TONS_PER_PERSON)
    }
    
    static func CalcPercentage(_ yr_model: Int) -> Double {
        let carbon_per_yr = tonsInWorld()
        
        var percent = 0.0
        
        percent = carbon_per_yr * Double(yr_model - 2021) / Double(MAX_CARBON_TONS)
        
        if percent == 1.0 {
            return 0.0
        }
        
        print(percent)
        return percent
    }
    
    static func CalculateTonnesLeft(_ percent: Double) -> Double {
        var tonnes = percent * Double(MAX_CARBON_TONS)
        tonnes = Double(MAX_CARBON_TONS) - tonnes
        
        return tonnes
    }
}
