//
//  BusiCalcViewController.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/22/21.
//

import UIKit

class BusiCalcViewController: UIViewController {
    
    @IBOutlet weak var truckEmission: UILabel!
    @IBOutlet weak var planeEmission: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let truckTree = Int(round(truck.calcEmissions()/2000.0))
        
        if truckTree == 0 {
            truckEmission.text = "TRUCKS\nEmission: \(Double(Int(round(truck.calcEmissions()*100)))/100.0) CO2e lbs\nApprox. Trees Cut: <1 Tree"
        } else {
            truckEmission.text = "TRUCKS\nEmission: \(Double(Int(round(truck.calcEmissions()*100)))/100.0) CO2e lbs\nApprox. Trees Cut: \(truckTree) Tree(s)"
        }
        
        let planeTree = Int(round(airplane.totalEmission()/2000.0))
        if planeTree == 0 {
            planeEmission.text = "AIRPLANE\nEmission: \(Double(Int(round(airplane.totalEmission()*100)))/100.0) CO2e lbs\nApprox. Trees Cut: <1 Tree"
        } else {
            planeEmission.text = "AIRPLANE\nEmission: \(Double(Int(round(airplane.totalEmission()*100)))/100.0) CO2e lbs\nApprox. Trees Cut: \(planeTree) Tree(s)"
        }
    }
}
