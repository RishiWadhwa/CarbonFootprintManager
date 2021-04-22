//
//  CarCalcViewController.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/21/21.
//

import UIKit

class CarCalcViewController: UIViewController {

    @IBOutlet weak var emissionLabel: UILabel!
    @IBOutlet weak var treeLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    var cost_of_car = calc.cost_car_yearly
    var emissions = calc.CAR_EMISSION_YEARLY
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cost_int = Int(cost_of_car*100.0)
        cost_of_car = Double(cost_int) / 100.0
        
        costLabel.text = "Cost of Gas:\n$\(cost_of_car) per year"
        
        
        let emissionInt = Int(emissions*100.0)
        emissions = Double(emissionInt)/100.0
        
        emissionLabel.text = "Emissions per year:\n\(emissions) CO2e lbs/year"
        
        var treeCount = emissionInt/100
        treeCount = treeCount / 2000
        treeLabel.text = "This means per year, you are destroying about \(treeCount) trees by driving."
    }

}
