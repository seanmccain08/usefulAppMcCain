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
    
    func setPopUpButton(){
        
        //make different actions like this to change colors, put 1 function in 1 spot in children array
        let  optionClosure = {(action : UIAction) in
            print(action.title)
        }
            
            popUpButtonOutlet.menu = UIMenu(children :
                [UIAction(title: "Match System", state : .on, handler: optionClosure), UIAction(title: "Gray", handler: optionClosure), UIAction(title: "Blue", handler: optionClosure), UIAction(title: "Pink", handler: optionClosure)])
            
                popUpButtonOutlet.showsMenuAsPrimaryAction = true
                popUpButtonOutlet.changesSelectionAsPrimaryAction = true
        }
    }
    
    


