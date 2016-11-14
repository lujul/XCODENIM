//
//  SettingsViewController.swift
//  JeuDeNim
//
//  Created by imac on 14/11/2016.
//  Copyright © 2016 mbritto. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var matchesValue: UILabel!
    @IBOutlet weak var matchesSlider: UISlider!
    let userDefaultsManager:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let matchesRecord:Int = userDefaultsManager.integer(forKey: Player.MATCHESCOUNT_KEY)
        matchesSlider.value = Float(matchesRecord)
        matchesValue.text = String (matchesRecord)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func closeSettings() {
        userDefaultsManager.set(matchesValue.text, forKey: Player.MATCHESCOUNT_KEY) //init settings
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func matchesValueChanged(_ sender: UISlider) {
        // Set the label text to the value of the slider as it changes
        let currentValue = Int(sender.value)
        
        matchesValue.text = "\(currentValue)"
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
