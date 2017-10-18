//
//  SettingsViewController.swift
//  HW3
//
//  Created by user131266 on 9/23/17.
//  Copyright © 2017 eldridjo. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func settingsChanged(distanceUnits: String, bearingUnits: String)
}

class SettingsViewController: GeoCalcViewController {
    var pickerData: [String] = [String]()
    var distancePickerData: [String] = [String]()
    var bearingPickerData: [String] = [String]()
    var distanceSelection: String = "Kilometers"
    var bearingSelection: String = "Degrees"
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var bearingLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    var delegate: SettingsViewControllerDelegate?
    var isDistancePicker:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        self.distancePickerData = ["Kilometers", "Miles"]
        self.bearingPickerData = ["Degrees", "Mil"]
        
        self.picker.delegate = self
        self.picker.dataSource = self
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissPicker))
        let distanceTouch = UITapGestureRecognizer(target: self, action:#selector(self.showPickerForDistance))
        let bearingTouch = UITapGestureRecognizer(target: self, action:#selector(self.showPickerForBearing))
        self.distanceLabel.text = distanceSelection
        self.distanceLabel.addGestureRecognizer(distanceTouch)
        self.distanceLabel.isUserInteractionEnabled = true
        
        self.bearingLabel.text = bearingSelection
        self.bearingLabel.addGestureRecognizer(bearingTouch)
        self.bearingLabel.isUserInteractionEnabled = true
        
        self.view.addGestureRecognizer(detectTouch)
    }

    func dismissPicker() {
        self.picker.isHidden = true
    }
    func showPickerForDistance() {
        isDistancePicker = true
        self.picker.reloadAllComponents()
        self.picker.isHidden = false
    }
    func showPickerForBearing() {
        isDistancePicker = false
        self.picker.reloadAllComponents()
        self.picker.isHidden = false
    }
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        if let d = self.delegate {
            d.settingsChanged(distanceUnits: distanceSelection, bearingUnits: bearingSelection)
        }
        self.dismiss(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let d = self.delegate {
            d.settingsChanged(distanceUnits: distanceSelection, bearingUnits: bearingSelection)
        }
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SettingsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // The number of columns of data
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if isDistancePicker {
            return distancePickerData.count
        } else {
            return bearingPickerData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent
        component: Int) -> String? {
        if isDistancePicker {
            return distancePickerData[row]
        } else {
            return bearingPickerData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent
        component: Int){
        if isDistancePicker {
            self.distanceLabel.text = self.distancePickerData[row]
            self.distanceSelection = self.distancePickerData[row]
        } else {
            self.bearingLabel.text = self.bearingPickerData[row]
            self.bearingSelection = self.bearingPickerData[row]

        }
    }
}
