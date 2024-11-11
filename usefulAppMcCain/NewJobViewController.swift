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
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var priceField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleField.delegate = self
        odometerField.delegate = self
        descriptionField.delegate = self
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleField.resignFirstResponder()
        odometerField.resignFirstResponder()
        descriptionField.resignFirstResponder()

        return true
    }

    @IBAction func addButton(_ sender: Any) {
        
        if titleField.text != "" && odometerField.text != "" && descriptionField.text != "" && priceField.text != ""{
            
            let calendar = Calendar.current
            let month = calendar.dateComponents([.month], from: datePicker.date).month
            let day = calendar.dateComponents([.day], from: datePicker.date).day
            let year = calendar.dateComponents([.year], from: datePicker.date).year
            
            AppData.currentCar.jobs.append(Jobs(title: titleField.text!, description: descriptionField.text!, dateM: month!, dateD: day!, dateY: year!, odometer: Int(odometerField.text!)!, isOilChange: oilSwitch.isOn, price: Double(priceField.text!)!))
            
            if oilSwitch.isOn{
                
                AppData.currentCar.oilMiles = Int(odometerField.text!)!
                
            }
            
            AppData.currentCar.miles = Int(odometerField.text!)!
            
            titleField.text = ""
            odometerField.text = ""
            descriptionField.text = ""
            priceField.text = ""
            
            ViewController.save()
            
        }
        
    }
    
}
