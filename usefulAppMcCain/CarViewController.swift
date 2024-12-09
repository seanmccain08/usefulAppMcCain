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
    @IBOutlet weak var odometerLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        carLabel.text = "\(AppData.currentCar.make) \(AppData.currentCar.model)"
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        odometerLabel.textColor = AppData.textColor
        totalCostLabel.textColor = AppData.textColor
        carLabel.textColor = AppData.textColor
        recentJobsLabel.textColor = AppData.textColor
        
        view.backgroundColor = AppData.backGroundcolor
        odometerLabel.text = "Odometer:\n\(AppData.currentCar.miles) Miles"
        var totalCost = 0.0
        for job in AppData.currentCar.jobs{
            
            totalCost+=job.price
            
        }
        totalCost+=AppData.currentCar.moneySpent
        totalCost*=100
        totalCost.round()
        totalCost/=100
        totalCostLabel.text = "Total Cost:\n$\(totalCost)"
        if AppData.currentCar.jobs.count > 0{
            
            jobs0 = []
            recentJobsLabel.text = "Recent Jobs"
            if AppData.currentCar.jobs.count > 2{
                
                if AppData.currentCar.jobs.count > 2 {
                    jobs0 = Array(AppData.currentCar.jobs.suffix(3))
                }
                else {
                    jobs0 = AppData.currentCar.jobs
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
        
        if let savedImage = loadImages(prefix: "image", count: 1) {
            
            carImage.image = savedImage[0]
            
        }
        
        if(carImage.image == nil){
            
            carImage.isHidden = true
            
        }
        
        tableView.reloadData()
      
    }
    
    func loadImages(prefix: String, count: Int) -> [UIImage]? {
        var images: [UIImage] = []
        
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        for index in 0..<count {
            let fileName = "\(prefix)_\(index).png"
            let fileURL = directory.appendingPathComponent(fileName)
            
            if FileManager.default.fileExists(atPath: fileURL.path) {
                do {
                    let data = try Data(contentsOf: fileURL)
                    if let image = UIImage(data: data) {
                        images.append(image)
                        print("Loaded image \(index) from \(fileURL)")
                    }
                } catch {
                    print("Error loading image \(index): \(error)")
                }
            } else {
                print("File \(fileName) does not exist")
            }
        }
        return images.isEmpty ? nil : images
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return jobs0.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CarCell2
        let job = jobs0[indexPath.row]
        cell.titleLabel.text = "\(job.title)"
        cell.dateLabel.text = "\(job.dateM)/\(job.dateD)/\(job.dateY)"
        cell.costLabel.text = "$\(job.price)"
        cell.odometerLabel.text = "\(job.odometer) Miles"
        cell.descriptionLabel.text = "\(job.description)\n"
        cell.titleLabel.textColor = AppData.textColor
        cell.dateLabel.textColor = AppData.textColor
        cell.costLabel.textColor = AppData.textColor
        cell.odometerLabel.textColor = AppData.textColor
        cell.descriptionLabel.textColor = AppData.textColor
        return cell
        
    }

}
