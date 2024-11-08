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
    @IBOutlet weak var totalCostLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        var totalCost = 0.0
        for job in AppData.currentCar.jobs{
            
            totalCost+=job.price
            
        }
        totalCostLabel.text = "$\(totalCost) Spent"
        
        if AppData.currentCar.jobs.count == 1 {
            
            jobsLabel.text = "1 Job"
            
        }
        else{
            
            jobsLabel.text = "\(AppData.currentCar.jobs.count) Jobs"
            
        }
        
        if AppData.currentCar.jobs.count > 0 {
            
            let x = AppData.currentCar.jobs[AppData.currentCar.jobs.count-1]
            recentDateLabel.text = "Last Service \(x.dateM)/\(x.dateD)/\(x.dateY)"
            
        }
        else{
            
            recentDateLabel.text = "Unavailable"
            
        }
        fuelGradeLabel.text = AppData.currentCar.fuelGrade
        odometerLabel.text = "\(AppData.currentCar.miles) Miles"
        
        if AppData.currentCar.oilMiles == 0{
            
            lastOilChangeOdometerLabel.text = "Never Changed Oil"
            
        }
        else{
            
            lastOilChangeOdometerLabel.text = "\(AppData.currentCar.oilMiles) Miles"
            
        }
        
    }

}
