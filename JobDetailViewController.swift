//
//  JobDetailViewController.swift
//  usefulAppMcCain
//
//  Created by SEAN MCCAIN on 11/6/24.
//

import UIKit

class JobDetailViewController: UIViewController {

    var currentJob = Jobs(title: "", description: "", dateM: 1, dateD: 1, dateY: 1, odometer: 1, isOilChange: false, price: 0.0)
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var odometerReadingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currentJob = AppData.currentCar.jobs[AppData.number]
        titleLabel.text = currentJob.title
        dateLabel.text = "\(currentJob.dateM)/\(currentJob.dateD)/\(currentJob.dateY)"
        odometerReadingLabel.text = "Odometer Reading: \(currentJob.odometer) Miles"
        descriptionLabel.text = currentJob.description
        priceLabel.text = "Price: $\(currentJob.price)"
        
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
