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
    @IBOutlet weak var label0: UILabel!
    @IBOutlet weak var label1: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.backgroundColor = AppData.backGroundcolor
        label0.textColor = AppData.textColor
        label1.textColor = AppData.textColor
        fuelGradeOutlet.textColor = AppData.textColor
        odometerField.textColor = AppData.textColor
        oilMilesField.textColor = AppData.textColor
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
