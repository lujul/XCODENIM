//
//  Game.swift
//  JeuDeNim
//
//  Created by imac on 17/11/2016.
//  Copyright © 2016 mbritto. All rights reserved.
//

import Foundation

class Game {
    
    private let _player1:Player
    private let _player2:Player
    private var _matchesCount:Int
    private var _currentPlayer:Player
    
    var isGameOver:Bool {
        return _matchesCount <= 0
    }
    var player1:Player {
        return _player1
    }
    var player2:Player {
        return _player2
    }
    
    var winner:Player? {
        var winner:Player? = nil
        if isGameOver {
            winner = _currentPlayer
        }
        return winner
    }
    var currentPlayer:Player {
        return _currentPlayer
    }
    
    var matchesCount:Int {
        return _matchesCount
    }
    
    init(p1:Player,p2:Player,matchesCount:Int) {
        _player1 = p1
        _player2 = p2
        _matchesCount = matchesCount
        _currentPlayer = _player1
    }
    
    func removeMatches(matchesToRemove:Int) {
        _matchesCount = _matchesCount - matchesToRemove
        _matchesCount = max(_matchesCount, 0)
        if _currentPlayer === _player1 {
            _currentPlayer = _player2
        } else {
            _currentPlayer = _player1
        }
    }

    
    
}
