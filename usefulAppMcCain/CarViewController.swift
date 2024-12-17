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
    
    @IBOutlet weak var checkEngineButton: UIButton!
    @IBOutlet weak var tirePressureButton: UIButton!
    @IBOutlet weak var batteryWarningButton: UIButton!
    @IBOutlet weak var brakeWarningButton: UIButton!
    @IBOutlet weak var ABSWarningButton: UIButton!
    @IBOutlet weak var oilWarningButton: UIButton!
    @IBOutlet weak var airbagWarningButton: UIButton!
    @IBOutlet weak var tcWarningButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        carLabel.text = "\(AppData.currentCar.make) \(AppData.currentCar.model)"
        tableView.delegate = self
        tableView.dataSource = self
        
        if(AppData.currentCar.checkEngineWarning){
            checkEngineButton.backgroundColor = UIColor.systemOrange
        }
        else{
            checkEngineButton.backgroundColor = UIColor.systemBlue
        }
        
        if(AppData.currentCar.tirePressureWarning){
            tirePressureButton.backgroundColor = UIColor.systemRed
        }
        else{
            tirePressureButton.backgroundColor = UIColor.systemBlue
        }
        
        if(AppData.currentCar.batteryWarning){
            batteryWarningButton.backgroundColor = UIColor.systemRed
        }
        else{
            batteryWarningButton.backgroundColor = UIColor.systemBlue
        }
        
        if(AppData.currentCar.brakeWarning){
            brakeWarningButton.backgroundColor = UIColor.systemRed
        }
        else{
            brakeWarningButton.backgroundColor = UIColor.systemBlue
        }
        
        if(AppData.currentCar.ABSWarning){
            ABSWarningButton.backgroundColor = UIColor.systemRed
        }
        else{
            ABSWarningButton.backgroundColor = UIColor.systemBlue
        }
        
        if(AppData.currentCar.oilWarning){
            oilWarningButton.backgroundColor = UIColor.systemRed
        }
        else{
            oilWarningButton.backgroundColor = UIColor.systemBlue
        }
        
        if(AppData.currentCar.airbagWarning){
            airbagWarningButton.backgroundColor = UIColor.systemRed
        }
        else{
            airbagWarningButton.backgroundColor = UIColor.systemBlue
        }
        
        if(AppData.currentCar.tcWarning){
            tcWarningButton.backgroundColor = UIColor.systemRed
        }
        else{
            tcWarningButton.backgroundColor = UIColor.systemBlue
        }
        
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
        
        tableView.reloadData()
      
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

    @IBAction func checkEngineWarningAction(_ sender: UIButton) {
        
        if(AppData.currentCar.checkEngineWarning){
            
            AppData.currentCar.checkEngineWarning = false
            checkEngineButton.backgroundColor = UIColor.systemBlue
            
        }
        else{
            
            AppData.currentCar.checkEngineWarning = true
            checkEngineButton.backgroundColor = UIColor.systemOrange
            
        }
        
        ViewController.save()
        
    }
    @IBAction func tirePressureAction(_ sender: UIButton) {
        
        if(AppData.currentCar.tirePressureWarning){
            
            AppData.currentCar.tirePressureWarning = false
            tirePressureButton.backgroundColor = UIColor.systemBlue
            
        }
        else{
            
            AppData.currentCar.tirePressureWarning = true
            tirePressureButton.backgroundColor = UIColor.systemRed
            
        }
        
        ViewController.save()
        
    }
    @IBAction func batteryAction(_ sender: UIButton) {
        
        if(AppData.currentCar.batteryWarning){
            
            AppData.currentCar.batteryWarning = false
            batteryWarningButton.backgroundColor = UIColor.systemBlue
            
        }
        else{
            
            AppData.currentCar.batteryWarning = true
            batteryWarningButton.backgroundColor = UIColor.systemRed
            
        }
        
        ViewController.save()
        
    }
    @IBAction func brakeWarningAction(_ sender: UIButton) {
        
        if(AppData.currentCar.brakeWarning){
            
            AppData.currentCar.brakeWarning = false
            brakeWarningButton.backgroundColor = UIColor.systemBlue
            
        }
        else{
            
            AppData.currentCar.brakeWarning = true
            brakeWarningButton.backgroundColor = UIColor.systemRed
            
        }
        
        ViewController.save()
        
    }
    @IBAction func ABSAction(_ sender: UIButton) {
        
        if(AppData.currentCar.ABSWarning){
            
            AppData.currentCar.ABSWarning = false
            ABSWarningButton.backgroundColor = UIColor.systemBlue
            
        }
        else{
            
            AppData.currentCar.ABSWarning = true
            ABSWarningButton.backgroundColor = UIColor.systemRed
            
        }
        
        ViewController.save()
        
    }
    @IBAction func oilAction(_ sender: UIButton) {
        
        if(AppData.currentCar.oilWarning){
            
            AppData.currentCar.oilWarning = false
            oilWarningButton.backgroundColor = UIColor.systemBlue
            
        }
        else{
            
            AppData.currentCar.oilWarning = true
            oilWarningButton.backgroundColor = UIColor.systemRed
            
        }
        
        ViewController.save()
        
    }
    @IBAction func airbagAction(_ sender: UIButton) {
        
        if(AppData.currentCar.airbagWarning){
            
            AppData.currentCar.airbagWarning = false
            airbagWarningButton.backgroundColor = UIColor.systemBlue
            
        }
        else{
            
            AppData.currentCar.airbagWarning = true
            airbagWarningButton.backgroundColor = UIColor.systemRed
            
        }
        
        ViewController.save()
        
    }
    @IBAction func tractionControlAction(_ sender: UIButton) {
        
        if(AppData.currentCar.tcWarning){
            
            AppData.currentCar.tcWarning = false
            tcWarningButton.backgroundColor = UIColor.systemBlue
            
        }
        else{
            
            AppData.currentCar.tcWarning = true
            tcWarningButton.backgroundColor = UIColor.systemRed
            
        }
        
        ViewController.save()
        
    }
    
}
