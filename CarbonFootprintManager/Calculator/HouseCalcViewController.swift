//
//  HouseCalcViewController.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/22/21.
//

import UIKit

class HouseCalcViewController: UIViewController {

    @IBOutlet weak var field: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let emission = house.costHeat()
        let trees = Int(round(emission*100/2000.0))/100
        
        if trees > 0 {
            field.text = "Emissions:\n\(emission) CO2e lbs/year\nTrees Cut: \(trees) Trees"
        } else {
            field.text = "Emissions: \(emission) CO2e lbs/year/person\nTrees Cut: <1 Trees"
        }
    }
}
