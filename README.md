# CarbonFootprintManager
A project on how to manage your carbon footprint based on localized information and data.

This project will help people learn about their carbon footprint, calculate it, and minimize it very efficiently.

## Download on App Store: Carbon Manager
https://apps.apple.com/us/app/carbon-manager/id1564769352

### Current Features
1. Calculation of How much Carbon you emit through driving (non-electric vehicles) per household.
  1. Also calculates how much money you spend on gas based on average prices per state (USA) or territory (Canada).
2. Calculates how much carbon your househod emits through charging phones and main heating type.
3. Logistical calculations for large-scale businesses in the shipping and e-commerce/packaging industry such as: PitneyBowes, Walmart, FedEx, USPS, etc.
  1. These calculations take number of miles flown in airplane and driven in truck.
  2. They also allow the user to pick a specific kind of truck that they are driving/shipping packages in.
  3. The plane is assumed Boeing 747
  4. Uses carbon emissions for each vehicle the program calculates the amount of carbon release by the company in total.
4. Conversion between Metric Tonnes and pounds (for carbon uses because carbon is shown in pounds and can be converted for metric users)
5. CO2e Reductions can be calculated for each household given number of people
  1. This assumes that all people in the household recycle glass, common papers, newspapers, plastic, magazines, and some recyclable metals
6.  More information on how to slow carbon emissions that are not necessarily free but very useful, somewhat common knowledge.
7.  `Other Ways To Help` provides organizations that you can support by donating that will help reduce the carbon emissions either by planting trees or supporting rainforests or other ways.
8.  Projection Model (Coming Soon) shows a projection model given a year in the future (2021+) and shows how much of the possible carbon limit the Earth has will be filled up that remains after this year (2021).

### Version History

v1.0 Basic Emissions
- All emissions come with approximate number of trees cut or saved to give a meaning to the value given.
- All emissions are rounded to maximum 2 decimal places, and trees are rounded down to whole number.
- 5 Features Added:
  - Car Data: 
    - Logs car prices and emissions per year based on the state in the US where you live
    - Also can calculate for Canadian Provinces and some territories (NW Terr., Yukon, and Nanavut)
  - Heating Data: 
    - Calculates your house prices based on primary heating source (propane, natural gas, fuel oil, or electric)
    - Calculates emissions of charging your phone(s) per year
  - Logistics: For Businesses
    - Given: miles driven for trucking (delivery) and miles flown in airplane (assuming default boeing-747)
    - Variable: Kind of truck you are using for delivery. CHOICES - 
      - Grummans Olson/Navistar/Standard
      - Grumans LLV
      - 2000s Propane Fueled
      - 2010s Package Car
      - Ultimaster + Isuzu Reach Chassis
      - Ram ProMaster
    - Calculates: Emissions by truck and plane
  - Possible Savings:
    - Calculates possible savings if everyone recycled:
      - GLASS
      - METAL
      - NEWSPAPER
      - MAGAZINE
      - PLASTIC
  - Constants:
    -  Some basic constants used in data collection and data calculation
    -  Not all variables are listed for personal reasons.

v1.1 Saving Changes
- Updated Logo for Heating Emission
- Changes made to Savings Section
  - Savings Section now has:
    - Savings Calculator: How to Reduce CO2e
    - Savings Document: Other ways to save (long document style formatting)
    - Savings by Donating Money List of Orgs: List of Orgs that take money and use it save the world (non-profits)!
  - Clean, smooth layout
- Constants are removed from app 
  - Where to find Constants:
    - CarbonFootprintManager/main/Constants/ConstantsViewController.swift
      - View Controller with the original UITextView on the Constants (deprecated - now removed)
    - CarbonFootprintManager/main/Calculator/Logic/calc.swift
      - Emission Constants
    - CarbonFootprintManager/main/Calculator/Logic/avoidSpending.swift
      - Saving Constants
    - CarbonFootprintManager/main/Business Calc/Logic/AirplaneCalc.swift
      - Business Airplane Constants
    - CarbonFootprintManager/main/Business Calc/Logic/TruckCalc.swift
      - Business Truck Constants

v1.1.1 Bug Fixes
- Reported Bug(s):
  - Resizing Bug
  - Glitches in size on smaller phones (XS, iPhone 8 or lower, etc)
- Fixed!
  -  Do Report more of these bugs! Thank you!
