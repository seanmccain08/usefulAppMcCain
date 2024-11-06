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
        cell.descriptionLabel.text = "\(job.description)"
        return cell
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        self.performSegue(withIdentifier: "newJobSegue", sender: self)
        
    }
    
}
