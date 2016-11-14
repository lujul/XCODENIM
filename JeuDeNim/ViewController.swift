//
//  ViewController.swift
//  JeuDeNim
//
//  Created by Maxime Britto on 10/11/2016.
//  Copyright © 2016 mbritto. All rights reserved.
// TEST COMMIT
//

import UIKit

class ViewController: UIViewController {
    
    let userDefaultsManager:UserDefaults = UserDefaults.standard
    var _matchesCount:Int!
    var _currentPlayer:String = "Joueur 1"
    
    @IBOutlet weak var ui_newGameButton: UIButton!
    @IBOutlet weak var ui_pick3MatchesButton: UIButton!
    @IBOutlet weak var ui_pick2MatchesButton: UIButton!
    @IBOutlet weak var ui_pick1MatchButton: UIButton!
    @IBOutlet weak var ui_currentPlayerLabel: UILabel!
    @IBOutlet weak var ui_matchesCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSettings()
        _matchesCount = userDefaultsManager.integer(forKey: Player.MATCHESCOUNT_KEY)
        beginNewGame()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        _matchesCount = userDefaultsManager.integer(forKey: Player.MATCHESCOUNT_KEY)
        ui_matchesCountLabel.text = String(_matchesCount!)
        beginNewGame()
        
    }
    private func initSettings() {
        userDefaultsManager.register(defaults: [Player.MATCHESCOUNT_KEY : 20])//init settings
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.(..)
        let userDefaultsManager:UserDefaults = UserDefaults.standard
        let score:Int = userDefaultsManager.integer(forKey: Player.SCORE_KEY)
        ui_currentPlayerLabel.text = "Score : \(score)"
    }
    
    private func updateDisplay() {
        ui_matchesCountLabel.text = "\(_matchesCount!)"
        if _matchesCount! <= 0 {
            ui_currentPlayerLabel.text = "\(_currentPlayer) a gagné"
            ui_newGameButton.isHidden = false
        } else {
            ui_currentPlayerLabel.text = _currentPlayer
            ui_newGameButton.isHidden = true
        }
        
        ui_pick3MatchesButton.isHidden = _matchesCount < 3
        ui_pick2MatchesButton.isHidden = _matchesCount < 2
        ui_pick1MatchButton.isHidden = _matchesCount < 1
    }
    
    @IBAction func pickMatches(_ button: UIButton) {
        let matchesToRemove:Int = button.tag
        _matchesCount = _matchesCount - matchesToRemove
        _matchesCount = max(_matchesCount, 0)
        if _currentPlayer == "Joueur 1" {
            _currentPlayer = "Joueur 2"
        } else {
            _currentPlayer = "Joueur 1"
        }
        
        updateDisplay()
    }
    
    @IBAction func beginNewGame() {
        _currentPlayer = "Joueur 1"
        
        updateDisplay()
    }
}






