//
//  SavingsDataViewController.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/23/21.
//

import UIKit

var saving: avoidSpending!

class SavingsDataViewController: UIViewController {

    @IBOutlet weak var pplLabel: UILabel!
    @IBOutlet weak var pplStepper: UIStepper!
    
    @IBOutlet weak var calcButton: UIButton!
    
    var ppl = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calcButton.layer.cornerRadius = 25
        pplLabel.font = UIFont(name: "AvenirNext-Bold", size: 21)
    }
    
    @IBAction func pplChange(_ sender: Any) {
        ppl = pplStepper.value
        
        pplLabel.text = "Number of People in Household: \(Int(ppl))"
    }
    
    @IBAction func calcPress(_ sender: Any) {
        saving = avoidSpending.init(ppl)
    }

}
