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
    var _game:Game?
    var game:Game? {
        get {
            return _game
        }
        set {
            self._game = newValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let matchesRecord:Int = userDefaultsManager.integer(forKey: Player.MATCHESCOUNT_KEY)
        matchesSlider.value = Float(matchesRecord)
        matchesValue.text = String (matchesRecord)
        
        if let gameInProgress = game {
            print("le game, avec \(gameInProgress.player1.name) ET \(gameInProgress.player2.name) !!")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
          userDefaultsManager.set(matchesValue.text, forKey: Player.MATCHESCOUNT_KEY) //init settings
     
      
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
