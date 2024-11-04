//
//  StatisticsViewController.swift
//  usefulAppMcCain
//
//  Created by SEAN MCCAIN on 11/4/24.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet weak var jobsLabel: UILabel!
    @IBOutlet weak var recentDateLabel: UILabel!
    @IBOutlet weak var fuelGradeLabel: UILabel!
    @IBOutlet weak var odometerLabel: UILabel!
    @IBOutlet weak var lastOilChangeOdometerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        jobsLabel.text = "\(AppData.currentCar.jobs.count) Jobs"
        
        if AppData.currentCar.jobs.count > 0 {
            
            let x = AppData.currentCar.jobs[AppData.currentCar.jobs.count-1]
            recentDateLabel.text = "\(x.dateM)/\(x.dateD)/\(x.dateY)"
            
        }
        else{
            
            recentDateLabel.text = "Unavailable"
            
        }
        fuelGradeLabel.text = AppData.currentCar.fuelGrade
        odometerLabel.text = "\(AppData.currentCar.miles)"
        lastOilChangeOdometerLabel.text = "Not functional yet"
        
    }

}
