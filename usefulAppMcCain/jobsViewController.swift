//
//  jobsViewController.swift
//  usefulAppMcCain
//
//  Created by Sean McCain on 11/5/24.
//

import UIKit

class jobsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        view.backgroundColor = AppData.backGroundcolor
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return AppData.currentCar.jobs.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let job = AppData.currentCar.jobs[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! CarCell3
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        if editingStyle == .delete{
            
            AppData.currentCar.jobs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            ViewController.save()
            
        }
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "newJobSegue", sender: self)
        
    }
    
}
