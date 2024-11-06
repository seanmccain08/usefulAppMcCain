//
//  NewJobViewController.swift
//  usefulAppMcCain
//
//  Created by Sean McCain on 11/5/24.
//

import UIKit

class NewJobViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var oilSwitch: UISwitch!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var odometerField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var monthField: UITextField!
    @IBOutlet weak var dayField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleField.delegate = self
        odometerField.delegate = self
        descriptionField.delegate = self
        monthField.delegate = self
        dayField.delegate = self
        yearField.delegate = self
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleField.resignFirstResponder()
        odometerField.resignFirstResponder()
        descriptionField.resignFirstResponder()
        monthField.resignFirstResponder()
        dayField.resignFirstResponder()
        yearField.resignFirstResponder()
        return true
    }

    @IBAction func addButton(_ sender: Any) {
        
        if titleField.text != "" && odometerField.text != "" && descriptionField.text != "" && monthField.text != "" && dayField.text != "" && yearField.text != ""{
            
            AppData.currentCar.jobs.append(Jobs(title: titleField.text!, description: descriptionField.text!, dateM: Int(monthField.text!)!, dateD: Int(dayField.text!)!, dateY: Int(yearField.text!)!, odometer: Int(odometerField.text!)!, isOilChange: oilSwitch.isOn))
            
            titleField.text = ""
            odometerField.text = ""
            descriptionField.text = ""
            monthField.text = ""
            dayField.text = ""
            yearField.text = ""
            
        }
        
    }
    
}
