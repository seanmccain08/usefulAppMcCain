//
//  AddViewController.swift
//  usefulAppMcCain
//
//  Created by SEAN MCCAIN on 10/31/24.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var makeField: UITextField!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var milesField: UITextField!
    @IBOutlet weak var fuelGradeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @IBAction func addCarButton(_ sender: UIButton) {
        
        if(makeField.text != "" && modelField.text != "" && yearField.text != "" && milesField.text != ""){
            
            errorLabel.isHidden = true
            AppData.cars.append(Car(make: makeField.text!, model: modelField.text!, year: yearField.text!, miles: Int(milesField.text!)!, fuelGrade: fuelGradeField.text!))
            makeField.text = ""
            modelField.text = ""
            yearField.text = ""
            milesField.text = ""
            fuelGradeField.text = ""
            
        }
        else{
            
            errorLabel.isHidden = false
            
        }
        
    }

}
