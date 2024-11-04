//
//  CarViewController.swift
//  usefulAppMcCain
//
//  Created by SEAN MCCAIN on 10/31/24.
//

import UIKit

class CarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var jobs0 : [Jobs] = []
    @IBOutlet weak var recentJobsLabel: UILabel!
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        carLabel.text = "\(AppData.currentCar.make) \(AppData.currentCar.model)"
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        if AppData.currentCar.jobs.count > 0{
            
            recentJobsLabel.text = "Recent Jobs"
            if AppData.currentCar.jobs.count > 2{
                
                for i in AppData.currentCar.jobs.count-3...AppData.currentCar.jobs.count-1{
                    
                    jobs0.append(AppData.currentCar.jobs[i])
                    
                }
                
            }
            else{
                
                for job in AppData.currentCar.jobs{
                    
                    jobs0.append(job)
                    
                }
                
            }
            
        }
        else{
            
            recentJobsLabel.text = "No jobs to display"
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if AppData.currentCar.jobs.count > 0{
            
            if AppData.currentCar.jobs.count > 2{
                
                return 3
                
            }
            
            return AppData.currentCar.jobs.count
            
        }
        else{
            
            return 0
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let car = jobs0[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CarCell2
        cell.titleLabel.text = "\(car.title)"
        cell.dateLabel.text = "\(car.dateM)/\(car.dateD)/\(car.dateY)"
        cell.descriptionLabel.text = "\(car.description)"
        return cell
        
    }

}
