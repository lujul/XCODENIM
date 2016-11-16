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
        if( playerOneLabel.text != ".." && playerTwoLabel.text != "..") {
            startButton.isHidden = false
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
    
    @IBAction func newPlayerEnterButton() {
        var returnValue:[String:Int]? = userDefaultsManager.object(forKey:Player.PLAYERLIST_KEY) as? [String:Int]
        if returnValue != nil && newPlayerTextEdit.text != nil  {
            returnValue![newPlayerTextEdit.text!] = 0
            print( "nouveau joueur \(newPlayerTextEdit.text)")
            userDefaultsManager.set(returnValue!, forKey: Player.PLAYERLIST_KEY)
        } else {
            
        }
        newPlayerTextEdit.resignFirstResponder() //
        
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
