//
//  scoreTableViewController.swift
//  JeuDeNim
//
//  Created by imac on 18/11/2016.
//  Copyright © 2016 mbritto. All rights reserved.
//

import UIKit

class scoreTableViewController: UITableViewController {
    
    let userDefaultsManager:UserDefaults = UserDefaults.standard
    var scoreTable:[Int]?
    var namesTable:[String]?
    var pickerData:[String: Int] = [String:Int]()
    var sortedKeys:[(key:String,value:Int)] = []
    
    
    @IBAction func editingAction(_ sender: UIBarButtonItem) {
        self.isEditing = !self.isEditing
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = userDefaultsManager.object(forKey: Player.PLAYERLIST_KEY) as! [String : Int]
        sortedKeys = pickerData.sorted{ $0.value > $1.value }
        namesTable = [String](pickerData.keys)
        scoreTable = [Int](pickerData.values)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sortedKeys.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let  cell: UITableViewCell
        let tuple = sortedKeys[indexPath.row]
        
        if indexPath.row%2 == 0 {
            let scoreCell = tableView.dequeueReusableCell(withIdentifier: "player-score-cell", for: indexPath) as! ScoreTableViewCell
            scoreCell.displayPlayer(_name: tuple.key, _score: tuple.value)
            cell = scoreCell
        } else {
            
            let customCell = tableView.dequeueReusableCell(withIdentifier: "player-score", for: indexPath)  //
            customCell.textLabel?.text = tuple.key
            customCell.detailTextLabel?.text = tuple.key
            cell = customCell
        }
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            sortedKeys.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let toRemove = sortedKeys[fromIndexPath.row]
        sortedKeys.remove(at: fromIndexPath.row)
        sortedKeys.insert(toRemove, at: to.row)
    }
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
