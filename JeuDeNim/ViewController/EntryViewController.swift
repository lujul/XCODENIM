//
//  EntryViewController.swift
//  JeuDeNim
//
//  Created by imac on 15/11/2016.
//  Copyright © 2016 mbritto. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    let userDefaultsManager:UserDefaults = UserDefaults.standard
    
    @IBOutlet weak var newPlayerTextEdit: UITextField!
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initManager ()
        updateScreen ()
        newPlayerTextEdit.delegate = self   //set delegate to textfile
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        updateScreen()
    }
    
    
    func updateScreen (){
        
        startButton.isHidden = true
        let playerOne:String? = userDefaultsManager.object(forKey: Player.PLAYER1_KEY) as? String
        let playerTwo:String? = userDefaultsManager.object(forKey: Player.PLAYER2_KEY) as? String
        if(playerOne != nil && playerOne != "none") {
            playerOneLabel.text = playerOne
        }
        if(playerTwo != nil && playerTwo != "none") {
            playerTwoLabel.text = playerTwo
        }
        if( playerOneLabel.text != ".." && playerTwoLabel.text != ".." && playerOneLabel.text !=  playerTwoLabel.text ) {
            startButton.isHidden = false
            
        } else {
            let alert = UIAlertController(title: "Alert", message: "Les deux joueurs doivent être differents", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) in print("you have pressed the Cancel button")
            }))
            // Present the controller
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func initManager () {
        userDefaultsManager.register(defaults: [Player.PLAYER1_KEY : "none"])
        userDefaultsManager.register(defaults: [Player.PLAYER2_KEY : "none"])
        userDefaultsManager.register(defaults: [Player.PLAYERLIST_KEY : [String:Int]()] )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func savePlayer () {
        var returnValue:[String:Int]? = userDefaultsManager.object(forKey:Player.PLAYERLIST_KEY) as? [String:Int]
        if returnValue != nil && newPlayerTextEdit.text != nil  {
            returnValue![newPlayerTextEdit.text!] = 0
            print( "nouveau joueur \(newPlayerTextEdit.text)")
            userDefaultsManager.set(returnValue!, forKey: Player.PLAYERLIST_KEY)
        } else {
            
        }
        newPlayerTextEdit.resignFirstResponder() //
    }
    
    
    @IBAction func newPlayerEnterButton() {
        newPlayerTextEdit.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        savePlayer()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        newPlayerTextEdit.resignFirstResponder()
        return true
    }
    
    
    /*
     textfield delegate test     */
    func textField(_ textFieldToChange: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // limit to xx characters
        let characterCountLimit = 20
        
        // We need to figure out how many characters would be in the string after the change happens
        let startingLength = textFieldToChange.text?.characters.count ?? 0
        let lengthToAdd = string.characters.count
        let lengthToReplace = range.length
        
        let newLength = startingLength + lengthToAdd - lengthToReplace
        
        return newLength <= characterCountLimit
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
