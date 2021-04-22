//
//  CalculatorViewController.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/20/21.
//

import UIKit

class CalculatorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var errLabel: UILabel!
    @IBOutlet weak var pplLabel: UILabel!
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var calcButton: UIButton!
    
    @IBOutlet weak var locPicker: UIPickerView!
    
    @IBOutlet weak var carStepper: UIStepper!
    @IBOutlet weak var pplStepper: UIStepper!
    
    var ppl: Double = 0
    var cars: Double = 0
    
    var currentState = ""
    
    var pplInt = 0
    var carInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pplLabel.font = UIFont(name: "AvenirNext-Bold", size: 18)        
        carLabel.font = UIFont(name: "AvenirNext-Bold", size: 18)
        
        locPicker.delegate = self
        locPicker.dataSource = self
                
        carStepper.value = 1
        cars = 1.0
        pplStepper.value = 1
        ppl = 1.0
        
        updatePpl()
        updateCar()
        
        errLabel.isHidden = true
        
        styleButton()
    }
    
    func styleButton() {
        calcButton.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.3568627451, blue: 0.4117647059, alpha: 1)
        calcButton.setTitleColor(.white, for: .normal)
        calcButton.layer.cornerRadius = 25
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 51
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return calc.STATES_BY_NAME[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentState = calc.STATES_BY_NAME[pickerView.selectedRow(inComponent: component)]
    }
    
    func updatePpl() {
        pplInt = Int(ppl)
        pplLabel.text = "Number of People in Household: \(pplInt)"
    }
    
    func updateCar() {
        carInt = Int(cars)
        carLabel.text = "Number of Non-Electric Cars In Household: \(carInt)"
    }
    
    @IBAction func carStepperPressed(_ sender: Any) {
        cars = carStepper.value
        updateCar()
    }
    
    @IBAction func pplStepperPressed(_ sender: Any) {
        ppl = pplStepper.value
        updatePpl()
    }
    
    @IBAction func calcVal(_ sender: Any) {
        if (currentState == "") {
            errLabel.isHidden = false
            
            return
        }
        
        calc.calc(ppl, cars, currentState)
        self.performSegue(withIdentifier: "CalcCar", sender: sender)
    }
    
}
