//
//  FuelGradeEditorViewController.swift
//  usefulAppMcCain
//
//  Created by SEAN MCCAIN on 11/4/24.
//

import UIKit

class FuelGradeEditorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var fuels = ["87+ Octane (Standard)", "89+ Octane (Mid-Grade)", "91+ Octane (Premium)", "93+ Octane (Premium)", "Diesel", "E-85"]
    
    var currentFuelGrade = "87+ Octane (Standard)"
    
    @IBOutlet weak var odometerField: UITextField!
    @IBOutlet weak var oilMilesField: UITextField!
    @IBOutlet weak var label0: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.backgroundColor = AppData.backGroundcolor
        label0.textColor = AppData.textColor
        label1.textColor = AppData.textColor
        odometerField.textColor = AppData.textColor
        oilMilesField.textColor = AppData.textColor
    }
    
    @IBAction func updateInfo(_ sender: Any) {
        
        AppData.currentCar.fuelGrade = currentFuelGrade
        
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0{
            
            return fuels.count
            
        }
        return 0
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0{
            
            return fuels[row]
            
        }
        
        return ""
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0{
            
            currentFuelGrade = fuels[row]
            
        }
        
    }
    
}
