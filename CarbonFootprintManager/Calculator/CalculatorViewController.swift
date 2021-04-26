//
//  CalculatorViewController.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/20/21.
//

import UIKit
import UserNotifications

var carCost: calc!
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
    
    var currentState = "Alaska"
    
    var pplInt = 0
    var carInt = 0
    
    let center = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        center.requestAuthorization(options: [.alert,.sound, .badge]) { (bool, err) in
            if !bool {
                let alert = UIAlertController(title: "Disabled", message: "You can change this in settings anytime!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            } else {
                let alert = UIAlertController(title: "Enabled", message: "Don't worry, this app sends a message every 3 days!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.callGranted()
            }
        }
        
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
    
    func callGranted() {
        let content = UNMutableNotificationContent()
        content.title = "Hey there!"
        content.body = "It takes 5 seconds to check your carbon emission! (You can turn these off anytime!)"
        
        var dateComponents = DateComponents()
        dateComponents.hour = 8
        dateComponents.minute = 55
        
        //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 259200, repeats: true)
        
        let uidString = UUID().uuidString
        let req = UNNotificationRequest(identifier: uidString, content: content, trigger: trigger)
        
        center.add(req) { (err) in
            guard let error = err else {
                return
            }
            
            print(error.localizedDescription)
        }
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
        return calc.STATES_BY_NAME.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let string = NSAttributedString(string: "\(calc.STATES_BY_NAME[row])", attributes: [NSAttributedString.Key.font:UIFont(name: "AvenirNext-Bold", size: 18)!, NSAttributedString.Key.foregroundColor:UIColor.black])
        
        return string
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
        if (currentState == "" || ppl <= 0 || cars <= 0) {
            errLabel.isHidden = false
            
            return
        }
        
        carCost = calc.init(ppl, cars, currentState)
        self.performSegue(withIdentifier: "CalcCar", sender: sender)
    }
    
}
