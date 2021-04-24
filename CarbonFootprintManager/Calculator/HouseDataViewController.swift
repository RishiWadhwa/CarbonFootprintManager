//
//  HouseDataViewController.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/22/21.
//

import UIKit

var house: calc!

class HouseDataViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pplLabel: UILabel!
    @IBOutlet weak var pplStep: UIStepper!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneStep: UIStepper!
    
    @IBOutlet weak var heatingType: UIPickerView!
    
    @IBOutlet weak var errLabel: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    
    var ppl = 1.0
    var phones = 1.0
    
    let heatingTypes = ["Choose a heating type", "Electric", "Propane", "Fuel Oil", "Natural Gas"]
    var heating = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heatingType.delegate = self
        heatingType.dataSource = self
        
        let myFont = UIFont(name: "AvenirNext-Bold", size: 21)
        
        pplLabel.font = myFont
        phoneLabel.font = myFont

        calcButton.layer.cornerRadius = 25
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return heatingTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return heatingTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        heating = row-1
    }
    
    @IBAction func pplChanged(_ sender: Any) {
        ppl = pplStep.value
        
        pplLabel.text = "Number of People in Household: \(Int(ppl))"
    }
    
    @IBAction func phoneChanged(_ sender: Any) {
        phones = phoneStep.value
        
        phoneLabel.text = "Number of Phones in Household: \(Int(phones))"
    }
    
    
    @IBAction func calcPress(_ sender: Any) {
        if (heating == -1 || ppl < 1.0) {
            errLabel.isHidden = false
            
            return
        }
        
        house = calc.init(ppl, heating, phones)
        
        self.performSegue(withIdentifier: "calcHouseEmissions", sender: sender)
    }
}
