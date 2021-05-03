//
//  HowSaveViewController.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 5/3/21.
//

import UIKit

class HowSaveViewController: UIViewController {
    
    @IBOutlet weak var field: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        field.text = "1. You can donate money to organizations built around this purpose... Go to 'Ways To Help By Donating' for more info!\n2. There are other ways to save that do not include giving money to someone or something.\n\t1. Recycle Recycle Recycle - Make sure to recycle. A little bit goes a long way...\n\t2. Install solar panels or other ways to conserve energy or make your own.\n\t3. Switch to Electric - Electric powered items are using clean, recyclable energy that is more beneficial for our community and more conservative.\n3. Ways to save Energy and reduce Carbon within your house:\n\t1. Switch to LED Bulbs (more power-conservative)!\n\t2. Unplug your devices while not in use... charging alone takes lots of carbon!\n\t3. Converse electricity and hot water! General heating takes a lot of carbon emissions to make simple tasks possible!\n\t4. Don't excess heat or ac, and keep windows closed when heat or ac is running!\n\t4. Do full loads of laundry to cut power down!\n\nSource: https://www.americanpowerandgas.com/10-ways-can-reduce-carbon-footprint-house/"
    }
    
    
}
