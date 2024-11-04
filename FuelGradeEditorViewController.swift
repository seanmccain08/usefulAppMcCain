//
//  FuelGradeEditorViewController.swift
//  usefulAppMcCain
//
//  Created by SEAN MCCAIN on 11/4/24.
//

import UIKit

class FuelGradeEditorViewController: UIViewController {

    @IBOutlet weak var fuelGradeOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateFuelGrade(_ sender: Any) {
        
        if fuelGradeOutlet.text != ""{
            
            AppData.currentCar.fuelGrade = fuelGradeOutlet.text!
            
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
