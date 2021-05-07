//
//  Designers.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/24/21.
//

import Foundation
import UIKit

class Designers {
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = #colorLiteral(red: 0.4078431373, green: 0.5725490196, blue: 0.6274509804, alpha: 1)
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        textfield.backgroundColor = .clear
        
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
}
