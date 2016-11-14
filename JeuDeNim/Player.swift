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
    var score:Int = 0
    
    func win()  {
        score += 10
    }
}
