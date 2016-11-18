//
//  ScoreTableViewCell.swift
//  JeuDeNim
//
//  Created by imac on 18/11/2016.
//  Copyright © 2016 mbritto. All rights reserved.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var ui_scoreSwitch: UISwitch!
    @IBOutlet weak var ui_playerNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    public func displayPlayer(_name:String, _score:Int) {
        ui_scoreSwitch.isOn = _score >= 0
        
        ui_playerNameLabel.text = _name
    }
    
}
