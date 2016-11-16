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
    var _currentPlayerPosition:Int = 1
    var _playerOne:Player = Player(name:"Joueur1")
    var _playerTwo:Player = Player(name:"Joueur2")
    var playerList: [String: Int] = [String:Int]()
    
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
        playerList = userDefaultsManager.object(forKey: Player.PLAYERLIST_KEY) as! [String : Int]
        initPlayer ()
        self.navigationItem.title = "Jeu de NIM"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        _matchesCount = userDefaultsManager.integer(forKey: Player.MATCHESCOUNT_KEY)
        ui_matchesCountLabel.text = String(_matchesCount!)
        beginNewGame()
        playerList = userDefaultsManager.object(forKey: Player.PLAYERLIST_KEY) as! [String : Int]
        initPlayer ()
        
    }
    private func initPlayer () {
        let playerOne:String? = userDefaultsManager.object(forKey: Player.PLAYER1_KEY) as? String
        let playerTwo:String? = userDefaultsManager.object(forKey: Player.PLAYER2_KEY) as? String
        if playerOne != nil {
            _playerOne.name = playerOne!
        }
        if playerTwo != nil {
            _playerTwo.name = playerTwo!
        }
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
    
    private func savePlayerList() {
        userDefaultsManager.set(playerList, forKey: Player.PLAYERLIST_KEY)
    }
    
    func updateDisplay() {
        ui_matchesCountLabel.text = "\(_matchesCount!)"
        if _matchesCount! <= 0 {
            
            let playerOnePosition:Int = _playerOne.position
            
            switch playerOnePosition {
            case 1:
                ui_currentPlayerLabel.text = "\(_playerOne.name) a gagné"
                _playerOne.win()
                print("Score \(_playerOne.name) : \(_playerOne.score)")
                playerList[_playerOne.name] = _playerOne.score
                savePlayerList()
            case 2:
                ui_currentPlayerLabel.text = "\(_playerTwo.name) a gagné"
                _playerTwo.win()
                print("Score \(_playerTwo.name) : \(_playerTwo.score)")
                playerList[_playerTwo.name] = _playerTwo.score
                savePlayerList()
                
            default:
                ui_currentPlayerLabel.text = "es ce bien raisonnable ?"
                
            }
            ui_newGameButton.isHidden = false
        } else {
            if _playerOne.position == 1 {
                ui_currentPlayerLabel.text = _playerOne.name
                
            }
            if _playerOne.position == 2 {
                ui_currentPlayerLabel.text = _playerTwo.name
                
            }
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
        if _playerOne.position == 1 {
            _playerOne.position = 2
            _playerTwo.position = 1
        } else {
            _playerOne.position = 1
            _playerTwo.position = 2
        }
        updateDisplay()
        //        ui_currentPlayerLabel.text = "Chargement"
        //        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ViewController.updateDisplay), userInfo: nil, repeats: false)
        
    }
    
    @IBAction func beginNewGame() {
        _playerOne.position = 1
        _playerTwo.position = 2
        ui_newGameButton.isHidden = true
        _matchesCount = userDefaultsManager.integer(forKey: Player.MATCHESCOUNT_KEY)
        
        updateDisplay()
    }
}






