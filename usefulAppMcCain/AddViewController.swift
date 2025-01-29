//
//  AddViewController.swift
//  usefulAppMcCain
//
//  Created by SEAN MCCAIN on 10/31/24.
// freaky
//  goofty goober
import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var label0: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var makeField: UITextField!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var milesField: UITextField!
    @IBOutlet weak var moneyInvestedField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var fuels = ["87+ Octane (Standard)", "89+ Octane (Mid-Grade)", "91+ Octane (Premium)", "93+ Octane (Premium)", "Diesel", "E-85"]
    
    var currentFuelGrade = "87+ Octane (Standard)"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.backgroundColor = AppData.backGroundcolor
        label0.textColor = AppData.textColor
        yearField.textColor = AppData.textColor
        makeField.textColor = AppData.textColor
        modelField.textColor = AppData.textColor
        milesField.textColor = AppData.textColor
        moneyInvestedField.textColor = AppData.textColor
    }
    
    @IBAction func addCarButton(_ sender: UIButton) {
        
        yearField.resignFirstResponder()
        makeField.resignFirstResponder()
        modelField.resignFirstResponder()
        milesField.resignFirstResponder()
        moneyInvestedField.resignFirstResponder()
        
        if(makeField.text != "" && modelField.text != "" && yearField.text != "" && milesField.text != "" && moneyInvestedField.text != ""){
            
            AppData.cars.append(Car(make: makeField.text!, model: modelField.text!, year: yearField.text!, miles: Int(milesField.text!)!, fuelGrade: currentFuelGrade, moneySpent: Double(moneyInvestedField.text!)!))
            makeField.text = ""
            modelField.text = ""
            yearField.text = ""
            milesField.text = ""
            moneyInvestedField.text = ""
            errorLabel.text = "Car Added!"
            errorLabel.textColor = UIColor.systemGreen
            ViewController.save()
            
        }
        else{
            
            errorLabel.text = "Invalid Entry"
            errorLabel.textColor = UIColor.systemRed
            
        }
        
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
