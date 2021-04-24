//
//  SavingsViewController.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/23/21.
//

import UIKit

class SavingsViewController: UIViewController {

    @IBOutlet weak var field: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        field.font = UIFont(name: "AvenirNext-Bold", size: 21)
        
        let emissions = round(saving.calcReducing()*100.0)/100.0
        let treeCounter = round(saving.calcReducing()*100.0/2000.0)/100.0
        
        
        if treeCounter < 1 {
            field.text = "STEPS TO SAVE:\nEmission Reduced: \(emissions) CO2e/year\nTrees Saved: \(treeCounter) Tree(s)"
        } else {
            field.text = "STEPS TO SAVE:\nEmission Reduced: \(emissions) CO2e/year\nTrees Saved: <1 Tree"
        }
        
    }

}
