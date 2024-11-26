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
        let  defaultBackround = {(action : UIAction) in
            print(action.title)
        }
        let  grayBackround = {(action : UIAction) in
            print(action.title)
        }
        let  blueBackround = {(action : UIAction) in
            print(action.title)
        }
        let  pinkBackround = {(action : UIAction) in
            print(action.title)
        }
            
            popUpButtonOutlet.menu = UIMenu(children :
                                                [UIAction(title: "Match System", state : .on, handler: defaultBackround), UIAction(title: "Gray", handler: grayBackround), UIAction(title: "Blue", handler: blueBackround), UIAction(title: "Pink", handler: pinkBackround)])
            
                popUpButtonOutlet.showsMenuAsPrimaryAction = true
                popUpButtonOutlet.changesSelectionAsPrimaryAction = true
        }
    }
    
    


