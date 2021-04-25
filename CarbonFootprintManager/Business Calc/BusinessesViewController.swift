//
//  BusinessesViewController.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/22/21.
//

import UIKit


var airplane: AirplaneCalc!
var truck: TruckCalc!
class BusinessesViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var truckPicker: UIPickerView!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var airplaneField: UITextField!
    @IBOutlet weak var truckField: UITextField!
    @IBOutlet weak var errLabel: UILabel!
    @IBOutlet weak var stopEditing: UIButton!
    
    var truckModel = "Grumans LLV / Standard / Don't know"
    var airplaneTrips = 0.0
    var truckTrips = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Designers.styleTextField(airplaneField)
        Designers.styleTextField(truckField)
        
        airplaneField.attributedPlaceholder = NSAttributedString(string: "Number of miles flown (AIRPLANE)...", attributes: [NSAttributedString.Key.foregroundColor:UIColor.darkGray])
        truckField.attributedPlaceholder = NSAttributedString(string: "Number of miles driven (TRUCK)...", attributes: [NSAttributedString.Key.foregroundColor:UIColor.darkGray])
        
        airplaneField.delegate = self
        truckField.delegate = self
        
        truckPicker.delegate = self
        truckPicker.dataSource = self
        
        calcButton.layer.cornerRadius = 25
        stopEditing.layer.cornerRadius = 25
        
        let myFont = UIFont(name: "AvenirNext-Bold", size: 19)
        
        truckField.font = myFont
        airplaneField.font = myFont
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return TruckCalc.TRUCK_TYPE.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let string = NSAttributedString(string: "\(TruckCalc.TRUCK_TYPE[row])", attributes: [NSAttributedString.Key.font:UIFont(name: "AvenirNext-Bold", size: 18)!, NSAttributedString.Key.foregroundColor:UIColor.black])
        
        return string
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        truckModel = TruckCalc.TRUCK_TYPE[row]
    }
    
    @IBAction func calculateEmission(_ sender: Any) {
        if truckModel == "" || airplaneField.text == "" || truckField.text == ""{
            errLabel.isHidden = false
            return
        }
        
        airplane = AirplaneCalc.init(airplaneTrips)
        truck = TruckCalc.init(truckTrips, truckModel)
        
        self.performSegue(withIdentifier: "CalcBusiness", sender: sender)
    }
    
    @IBAction func airplaneTripChange(_ sender: Any) {
        airplaneTrips = Double(Int(airplaneField.text ?? "0") ?? 0)
    }
    
    @IBAction func truckTripChange(_ sender: Any) {
        truckTrips = Double(Int(truckField.text ?? "0") ?? 0)
    }
    
    @IBAction func stopEditPress(_ sender: Any) {
        truckField.resignFirstResponder()
        airplaneField.resignFirstResponder()
    }
}
