//
//  PlayerTwoViewController.swift
//  JeuDeNim
//
//  Created by imac on 16/11/2016.
//  Copyright © 2016 mbritto. All rights reserved.
//

import UIKit

class PlayerTwoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var picker: UIPickerView!
     var pickerData: [String: Int] = [String:Int]()
    let userDefaultsManager:UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData = userDefaultsManager.object(forKey: Player.PLAYERLIST_KEY) as! [String : Int]
        self.picker.reloadAllComponents()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(Array(pickerData.keys)[row]) : \(Array(pickerData.values)[row]) "
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        print("le nom selectionne \(Array(pickerData.keys)[row])")
        userDefaultsManager.set(Array(pickerData.keys)[row], forKey: Player.PLAYER2_KEY)
    }
    
    @IBAction func closeButton() {
        dismiss(animated: true, completion: nil)

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
