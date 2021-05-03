//
//  MainSaveViewController.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 5/3/21.
//

import UIKit

class MainSaveViewController: UIViewController {

    @IBOutlet weak var calculator: UIButton!
    @IBOutlet weak var howTo: UIButton!
    @IBOutlet weak var donateLocation: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calculator.layer.cornerRadius = 25
        howTo.layer.cornerRadius = 25
        donateLocation.layer.cornerRadius = 25
    }
}
