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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @IBAction func addCarButton(_ sender: UIButton) {
        
        if(makeField.text != "" && modelField.text != "" && yearField.text != ""){
            
            errorLabel.isHidden = true
            AppData.cars.append(Car(make: makeField.text!, model: modelField.text!, year: yearField.text!))
            makeField.text = ""
            modelField.text = ""
            yearField.text = ""
            
        }
        else{
            
            errorLabel.isHidden = false
            
        }
        
    }

}
