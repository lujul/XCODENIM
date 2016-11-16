//
//  Player.swift
//  JeuDeNim
//
//  Created by Maxime Britto on 10/11/2016.
//  Copyright © 2016 mbritto. All rights reserved.
//

import Foundation
class Player {
    public static let SCORE_KEY:String = "Score"
    public static let MATCHESCOUNT_KEY:String = "gameMatchesCount"
    public static let PLAYER1_KEY:String = "player1"
    public static let PLAYER2_KEY:String = "player2"
    public static let PLAYERLIST_KEY:String = "playerList"


    private var _name:String
    private var _position:Int = 1 //default first
    var _score:Int = 0
    
    
    init( name:String){
        self._name = name
    }

    func win()  {
        _score += 10
    }
    
    var position:Int {
        get {
            return _position
        }
        set {
            self._position = newValue
        }
        
    }
    var name:String {
        get {
            return _name
        }
        set {
            self._name = newValue
        }
    }
    var score:Int {
        get {
            return _score
        }
    }

}
