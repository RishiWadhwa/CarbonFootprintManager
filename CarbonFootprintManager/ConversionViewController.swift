//
//  ConversionViewController.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 5/6/21.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    final let RATE = 2205.0
    
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var isTakingLBS = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button.layer.cornerRadius = 25
        
        field.delegate = self
        
        field.addDoneCancelToolbar(onDone: (target: self, action: #selector(self.tapDone)), onCancel: (target: self, action: #selector(self.tapCancel)))
        
        Designers.styleTextField(field)
        
        field.attributedPlaceholder = NSAttributedString(string: "Enter LBS...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
    }
    
    @objc func tapDone() {
        print("Done!")
        
        field.resignFirstResponder()
        
        if isTakingLBS {
            convert2Tonnes()
        } else {
            convert2Lbs()
        }
    }
    
    @objc func tapCancel() {
        print("Cancelled!")
        
        field.resignFirstResponder()
    }
    
    func flip() {
        
    }
    
    @IBAction func reverseConversion(_ sender: Any) {
        isTakingLBS = !isTakingLBS
        
        field.text = ""
        
        if (isTakingLBS) {
            label.text = "Metric Tonnes"
            field.attributedPlaceholder = NSAttributedString(string: "Enter LBS...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        } else {
            label.text = "US Pounds"
            field.attributedPlaceholder = NSAttributedString(string: "Enter Metric Tonnes...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        }
    }
    
    func convert2Tonnes() {
        var amount = (Double(field.text ?? "0.0") ?? 0.0)! / RATE
        amount = Double(round(amount*100))
        amount = amount / 100
        
        if field.text == "" {
            field.text = "0.0"
        }
        
        label.text = "\(amount) CO2e tonnes"
    }
    
    func convert2Lbs() {
        var amount = (Double(field.text ?? "0.0") ?? 0.0)! * RATE
        amount = Double(round(amount*100))
        amount = amount / 100
        
        if field.text == "" {
            field.text = "0.0"
        }
        
        label.text = "\(amount) CO2e lbs"
    }

}


extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))

        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()

        self.inputAccessoryView = toolbar
    }
    
    // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
}
