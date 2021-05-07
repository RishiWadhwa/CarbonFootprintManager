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
                
                DispatchQueue.main.async {
                    if !(self.isAppAlreadyLaunchedOnce())
                    {self.present(alert, animated: true, completion: nil)}
                }
            } else {
                let alert = UIAlertController(title: "Enabled", message: "Don't worry, this app sends only ONE message every day!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (alert) in
                    self.callGranted()
                }))
                
                DispatchQueue.main.async {
                    if !(self.isAppAlreadyLaunchedOnce())
                    {self.present(alert, animated: true, completion: nil)}
                }
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
    
    func isAppAlreadyLaunchedOnce()->Bool{
            let defaults = UserDefaults.standard

            if let isAppAlreadyLaunchedOnce = defaults.string(forKey: "isAppAlreadyLaunchedOnce"){
                print("App already launched : \(isAppAlreadyLaunchedOnce)")
                return true
            }else{
                defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
                print("App launched first time")
                return false
            }
    }
        
    
    func callGranted() {
        let content = UNMutableNotificationContent()
        content.title = "Hey there!"
        content.body = "It takes 5 seconds to check your carbon emission! Did you know, even donating a small fund to organizations worldwide can slow climate change and reduce carbon emissions. Tap here or open the app and head to 'Other Ways To Donate' in the Savings Tab to find some handpicked organizations!"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 172800, repeats: true)
        
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
