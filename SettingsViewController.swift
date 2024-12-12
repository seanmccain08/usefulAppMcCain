//
//  SettingsViewController.swift
//  usefulAppMcCain
//
//  Created by MICHAEL GRUPER on 11/21/24.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var popUpButtonOutlet: UIButton!
    
    @IBOutlet weak var label0: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopUpButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.backgroundColor = AppData.backGroundcolor
        label0.textColor = AppData.textColor
        if(AppData.bgColorString == "blue"){
            
            popUpButtonOutlet.setTitleColor(UIColor.yellow, for: .normal)
            
        }
    }
    
    func setPopUpButton(){
        
        //make different actions like this to change colors, put 1 function in 1 spot in children array
        let  systemBG = {(action : UIAction) in

            AppData.backGroundcolor = UIColor.systemBackground
            AppData.textColor = UIColor.label
            self.view.backgroundColor = AppData.backGroundcolor
            AppData.bgColorString = "system"
            UserDefaults.standard.set(AppData.bgColorString, forKey: "bg")
            self.label0.textColor = AppData.textColor
            self.popUpButtonOutlet.setTitleColor(UIColor.systemBlue, for: .normal)
            
        }
        let  grayBackround = {(action : UIAction) in
            
            AppData.backGroundcolor = UIColor.lightGray
            AppData.textColor = UIColor.black
            self.view.backgroundColor = AppData.backGroundcolor
            AppData.bgColorString = "gray"
            UserDefaults.standard.set(AppData.bgColorString, forKey: "bg")
            self.label0.textColor = AppData.textColor
            self.popUpButtonOutlet.setTitleColor(UIColor.systemBlue, for: .normal)
        
        }
        let  blueBackground = {(action : UIAction) in
            print(action.title)
            
            AppData.backGroundcolor = UIColor(red: 0, green: 0.4, blue: 0.6, alpha: 1)
            self.view.backgroundColor = AppData.backGroundcolor
            AppData.textColor = UIColor.white
            AppData.bgColorString = "blue"
            UserDefaults.standard.set(AppData.bgColorString, forKey: "bg")
            self.label0.textColor = AppData.textColor
            self.popUpButtonOutlet.setTitleColor(UIColor.yellow, for: .normal)
            
        }
        let  pinkBackround = {(action : UIAction) in
            
            AppData.backGroundcolor = UIColor(red: 1, green: 0.6, blue: 1, alpha: 1)
            self.view.backgroundColor = AppData.backGroundcolor
            AppData.textColor = UIColor.black
            AppData.bgColorString = "pink"
            UserDefaults.standard.set(AppData.bgColorString, forKey: "bg")
            self.label0.textColor = AppData.textColor
            self.popUpButtonOutlet.setTitleColor(UIColor.systemBlue, for: .normal)
            
        }
            
        popUpButtonOutlet.menu = UIMenu(children : [UIAction(title: "Match System", state : .on, handler: systemBG), UIAction(title: "Gray", handler: grayBackround), UIAction(title: "Blue", handler: blueBackground), UIAction(title: "Pink", handler: pinkBackround)])
            
                popUpButtonOutlet.showsMenuAsPrimaryAction = true
                popUpButtonOutlet.changesSelectionAsPrimaryAction = true
        }
    }
    
    


