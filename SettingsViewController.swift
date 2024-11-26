//
//  SettingsViewController.swift
//  usefulAppMcCain
//
//  Created by MICHAEL GRUPER on 11/21/24.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var popUpButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopUpButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.backgroundColor = AppData.backGroundcolor
        
    }
    
    func setPopUpButton(){
        
        //make different actions like this to change colors, put 1 function in 1 spot in children array
        let  defaultBackround = {(action : UIAction) in
            AppData.backGroundcolor = UIColor.systemBackground
            self.view.backgroundColor = AppData.backGroundcolor
            AppData.bgColorString = "system"
            UserDefaults.standard.set(AppData.bgColorString, forKey: "bg")
        }
        let  grayBackround = {(action : UIAction) in
            
            AppData.backGroundcolor = UIColor.lightGray
            self.view.backgroundColor = AppData.backGroundcolor
            AppData.bgColorString = "gray"
            UserDefaults.standard.set(AppData.bgColorString, forKey: "bg")
        
        }
        let  blueBackround = {(action : UIAction) in
            print(action.title)
            
            AppData.backGroundcolor = UIColor(red: 0, green: 0.4, blue: 0.6, alpha: 1)
            self.view.backgroundColor = AppData.backGroundcolor
            AppData.bgColorString = "blue"
            UserDefaults.standard.set(AppData.bgColorString, forKey: "bg")
            
        }
        let  pinkBackround = {(action : UIAction) in
            
            AppData.backGroundcolor = UIColor(red: 1, green: 0.6, blue: 1, alpha: 1)
            self.view.backgroundColor = AppData.backGroundcolor
            AppData.bgColorString = "pink"
            UserDefaults.standard.set(AppData.bgColorString, forKey: "bg")
            
        }
            
            popUpButtonOutlet.menu = UIMenu(children :
                                                [UIAction(title: "Match System", state : .on, handler: defaultBackround), UIAction(title: "Gray", handler: grayBackround), UIAction(title: "Blue", handler: blueBackround), UIAction(title: "Pink", handler: pinkBackround)])
            
                popUpButtonOutlet.showsMenuAsPrimaryAction = true
                popUpButtonOutlet.changesSelectionAsPrimaryAction = true
        }
    }
    
    


