//
//  ViewController.swift
//  usefulAppMcCain
//
//  Created by SEAN MCCAIN on 10/30/24.
//

import UIKit

class Jobs : Codable{
    
    var title : String
    var description : String
    var dateM : Int
    var dateD : Int
    var dateY : Int
    var odometer: Int
    var isOilChange : Bool
    var price : Double
    
    init(title: String, description: String, dateM: Int, dateD: Int, dateY: Int, odometer: Int, isOilChange: Bool, price : Double) {
        self.title = title
        self.description = description
        self.dateM = dateM
        self.dateD = dateD
        self.dateY = dateY
        self.odometer = odometer
        self.isOilChange = isOilChange
        self.price = price
    }
    
}

class Car : Codable {
    
    var make : String
    var model : String
    var year : String
    var jobs : [Jobs]
    var miles : Int
    var fuelGrade : String
    var oilMiles : Int
    
    init(make: String, model: String, year: String, miles: Int, fuelGrade: String) {
        self.make = make
        self.model = model
        self.year = year
        self.jobs = []
        self.miles = miles
        self.fuelGrade = fuelGrade
        self.oilMiles = 0
    }
    
}

public class AppData {
    
    static var cars = [Car(make: "Cadillac", model: "CTS", year: "2004", miles: 131907, fuelGrade: "Premium")]
    static var currentCar = cars[0]
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return AppData.cars.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CarCell
        //Labels
        cell.carLabel.text = "\(AppData.cars[indexPath.row].year) \(AppData.cars[indexPath.row].make) \(AppData.cars[indexPath.row].model)"
        cell.jobsLabel.text = "\(AppData.cars[indexPath.row].jobs.count) Jobs"
        cell.odometerLabel.text = "\(AppData.cars[indexPath.row].miles) Miles"
        var totalCost = 0.0
        for job in AppData.cars[indexPath.row].jobs {
            
            totalCost+=job.price
            
        }
        cell.costLabel.text = "$\(totalCost) Spent"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        AppData.currentCar = AppData.cars[indexPath.row]
        self.performSegue(withIdentifier: "segueOne", sender: self)
        
    }
    
}

