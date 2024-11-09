//
//  FuelGradeEditorViewController.swift
//  usefulAppMcCain
//
//  Created by SEAN MCCAIN on 11/4/24.
//

import UIKit

class FuelGradeEditorViewController: UIViewController {

    @IBOutlet weak var fuelGradeOutlet: UITextField!
    @IBOutlet weak var odometerField: UITextField!
    @IBOutlet weak var oilMilesField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateInfo(_ sender: Any) {
        
        if fuelGradeOutlet.text != ""{
            
            AppData.currentCar.fuelGrade = fuelGradeOutlet.text!
            fuelGradeOutlet.text = ""
            
        }
        if odometerField.text != ""{
            
            AppData.currentCar.miles = Int(odometerField.text!)!
            odometerField.text = ""
            
        }
        if oilMilesField.text != ""{
            
            AppData.currentCar.oilMiles = Int(oilMilesField.text!)!
            oilMilesField.text = ""
            
        }
        ViewController.save()
        
    }

}
