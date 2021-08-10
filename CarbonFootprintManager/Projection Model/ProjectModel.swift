//
//  ProjectModel.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 8/9/21.
//

import Foundation
import UIKit

class ProjectModel: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var modelInitiateButton: UIButton!
    @IBOutlet weak var modelInitiateField: UITextField!
    
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelInitiateField.delegate = self
        Designers.styleTextField(modelInitiateField)
        
        modelInitiateField.addDoneCancelToolbar()
        
        modelInitiateButton.layer.cornerRadius = 25
        
        // circular project model
        let circularPath = UIBezierPath(arcCenter: view.center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi, clockwise: true)
        shapeLayer.lineCap = .round
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.fillColor = CGColor(red: (50.0/255.0), green: (93.00/255.0), blue: (20.0/255.0), alpha: 1.0)
        shapeLayer.strokeColor = CGColor(red: (247.0/255.0), green: (55.0/255.0), blue: (24.0/255.0), alpha: 1.0)
        
        shapeLayer.lineWidth = 10
        
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
        modelInitiateButton.addTarget(self, action: #selector(initiateModel), for: .touchUpInside)
        
        // track layer
        let tracklayer = CAShapeLayer()
        tracklayer.path = circularPath.cgPath
        
        tracklayer.fillColor = UIColor.clear.cgColor
        tracklayer.strokeColor = UIColor.init(red: 0, green: 105, blue: 148, alpha: 1.0).cgColor
        tracklayer.lineWidth = 10
        
        view.layer.addSublayer(shapeLayer)
    }
    
    @objc func initiateModel() {
        guard let modelYears = Int(modelInitiateField.text!) else {
            let alert = UIAlertController(title: "Illegal Model Year Count", message: "Please enter a NUMBER into the text field before tapping 'project'!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        if modelYears < 2021 {
            let alert = UIAlertController(title: "Illegal Model Year Count", message: "Please enter a number ABOVE 2021 into the text field before tapping 'project'!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Got it!", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        let percent = ProjectionCalc.CalcPercentage(modelYears) / 100.0
        
        animateModel(percent: percent)
    }
    
    func animateModel(percent: Double) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = percent
        
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "animationBasic")
    }
}
