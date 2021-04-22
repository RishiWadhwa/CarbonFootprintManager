//
//  ConstantsViewController.swift
//  CarbonFootprintManager
//
//  Created by Rishi Wadhwa on 4/21/21.
//

import UIKit

class ConstantsViewController: UIViewController {

    @IBOutlet weak var constants: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emission_car_year = Double(round(calc.CAR_EMISSION_YEARLY*100)/100)
        let emission_propane_year = Double(round(calc.PROPANE_EMISSION_YEARLY*100)/100)
        let emission_natural_year = Double(round(calc.NATURAL_GAS_YEARLY*100)/100)
        let emission_fuel_year = Double(round(calc.FUEL_OIL_YEARLY*100)/100)
        let emission_elec_year = Double(round(calc.ELECTRIC_EMISSION_YEARLY*100)/100)
        let emission_waste_year = calc.WASTE_EMISSIONS_YEARLY*100
        
        let savings_glass_year = Double(round(avoidSpending.GLASS_SAVINGS*100)/100)
        let savings_paper_year = Double(round(avoidSpending.NEWSPAPER_SAVINGS*100)/100)
        let savings_magazine_year = Double(round(avoidSpending.MAGAZINE_SAVINGS*100)/100)
        let savings_metal_year = Double(round(avoidSpending.METAL_SAVINGS*100)/100)
        let savings_plastic_year = Double(round(avoidSpending.PLASTIC_SAVINGS*100)/100)
        
        constants.text = "All constants are in CO2e lbs/year/ person\n\n\nEMISSIONS\n- Car Emission: \(emission_car_year)\n- Propane Emission: \(emission_propane_year)\n- Natural Gas Emission: \(emission_natural_year)\n- Fuel Oil Emission: \(emission_fuel_year)\n- Electrical Emission: \(emission_elec_year)\n- Emission from NOT Recycling: \(emission_waste_year)\n\nSAVINGS\n- Recycling Glass: \(savings_glass_year)\n- Recycling Newspaper: \(savings_paper_year)\n- Recycling Magazine: \(savings_magazine_year)\nRecycling Metal: \(savings_metal_year)\n- Recycling Plastic: \(savings_plastic_year)\n\nGas Prices per State (I took the average of all gas prices per state): https://gasprices.aaa.com/state-gas-price-averages/"
    }

}
