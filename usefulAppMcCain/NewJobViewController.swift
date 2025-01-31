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
    @IBOutlet weak var label0: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleField.delegate = self
        odometerField.delegate = self
        descriptionField.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.backgroundColor = AppData.backGroundcolor
        label0.textColor = AppData.textColor
        titleField.textColor = AppData.textColor
        odometerField.textColor = AppData.textColor
        priceField.textColor = AppData.textColor
        descriptionField.textColor = AppData.textColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleField.resignFirstResponder()
        odometerField.resignFirstResponder()
        descriptionField.resignFirstResponder()

        return true
    }

    @IBAction func addButton(_ sender: Any) {
        
        let calendar = Calendar.current
        let month = calendar.dateComponents([.month], from: datePicker.date).month
        let day = calendar.dateComponents([.day], from: datePicker.date).day
        let year = calendar.dateComponents([.year], from: datePicker.date).year
        
        if oilSwitch.isOn{
            
            if(priceField.text != ""){
                
                var odo = AppData.currentCar.miles
                if(odometerField.text != ""){
                    
                    odo = (Int)(odometerField.text!)!
                    
                }
                var t = "Oil Change"
                if(titleField.text != ""){
                    
                    t = titleField.text!
                    
                }
                AppData.currentCar.oilMiles = odo
                
                AppData.currentCar.jobs.append(Jobs(title: t, description: descriptionField.text!, dateM: month!, dateD: day!, dateY: year!, odometer: odo, isOilChange: true, price: Double(priceField.text!)!))
                
                
            }
            
        }
        
        if titleField.text != "" && odometerField.text != "" && priceField.text != ""{
            
            let calendar = Calendar.current
            let month = calendar.dateComponents([.month], from: datePicker.date).month
            let day = calendar.dateComponents([.day], from: datePicker.date).day
            let year = calendar.dateComponents([.year], from: datePicker.date).year
            
            AppData.currentCar.jobs.append(Jobs(title: titleField.text!, description: descriptionField.text!, dateM: month!, dateD: day!, dateY: year!, odometer: Int(odometerField.text!)!, isOilChange: oilSwitch.isOn, price: Double(priceField.text!)!))
            
            AppData.currentCar.miles = Int(odometerField.text!)!
            
            titleField.text = ""
            odometerField.text = ""
            descriptionField.text = ""
            priceField.text = ""
            
            ViewController.save()
            
        }
        
    }
    
}
