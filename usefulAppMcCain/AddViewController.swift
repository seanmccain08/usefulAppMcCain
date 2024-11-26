//
//  AddViewController.swift
//  usefulAppMcCain
//
//  Created by SEAN MCCAIN on 10/31/24.
// freaky
//  goofty goober
import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var makeField: UITextField!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var milesField: UITextField!
    @IBOutlet weak var fuelGradeField: UITextField!
    @IBOutlet weak var moneyInvestedField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.backgroundColor = AppData.backGroundcolor
    }
    
    @IBAction func addCarButton(_ sender: UIButton) {
        
        if(makeField.text != "" && modelField.text != "" && yearField.text != "" && milesField.text != "" && moneyInvestedField.text != "" && fuelGradeField.text != ""){
            
            AppData.cars.append(Car(make: makeField.text!, model: modelField.text!, year: yearField.text!, miles: Int(milesField.text!)!, fuelGrade: fuelGradeField.text!, moneySpent: Double(moneyInvestedField.text!)!))
            makeField.text = ""
            modelField.text = ""
            yearField.text = ""
            milesField.text = ""
            fuelGradeField.text = ""
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

}
