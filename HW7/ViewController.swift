//
//  ViewController.swift
//  HW3
//
//  Created by user131266 on 9/21/17.
//  Copyright © 2017 eldridjo. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: GeoCalcViewController, SettingsViewControllerDelegate {

    @IBOutlet weak var longp1: DecimalMinusTextField!
    @IBOutlet weak var longp2: DecimalMinusTextField!
    @IBOutlet weak var latp2: DecimalMinusTextField!
    @IBOutlet weak var latp1: DecimalMinusTextField!
    @IBOutlet weak var bearingField: UILabel!
    @IBOutlet weak var distanceField: UILabel!
    
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    var distanceUnits: String = "Kilometers"
    var bearingUnits: String = "Degrees"
    
    @IBAction func calcButton(_ sender: UIButton) {
        self.dismissKeyboard()
        self.calculate()
        
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        self.dismissKeyboard()
        self.longp1.text = ""
        self.longp2.text = ""
        self.latp1.text = ""
        self.latp2.text = ""
        self.distanceField.text = ""
        self.bearingField.text = ""
    }
    
    func calculate() {
        guard let lat1 = Double(latp1.text!), let long1 = Double(longp1.text!), let lat2 = Double(latp2.text!), let long2 = Double(longp2.text!) else {
            return
        }
        
        let coordinate0 = CLLocation(latitude: lat1, longitude: long1)
        let coordinate1 = CLLocation(latitude: lat2, longitude: long2)
        
        let distanceInKilometers = (((coordinate0.distance(from: coordinate1) / 1000) * 100).rounded()) / 100
        let bearing = (getBearingBetweenTwoPoints(point1: coordinate0, point2: coordinate1) * 100).rounded() / 100
        if distanceUnits == "Miles" {
            let distanceInMiles = ((distanceInKilometers * 0.621371) * 100).rounded() / 100
            self.distanceField.text = String("\(distanceInMiles) \(distanceUnits)")

        } else {
            self.distanceField.text = String("\(distanceInKilometers) \(distanceUnits)")
        }
        if bearingUnits == "Mil" {
            let bearing = ((bearing * 17.777777777778) * 100).rounded() / 100
            self.bearingField.text = String("\(bearing) \(bearingUnits)")
        } else {
            self.bearingField.text = String("\(bearing) \(bearingUnits)")
        }
        
        
        print(distanceUnits)
        print(bearingUnits)
    }
    func settingsChanged(distanceUnits: String, bearingUnits: String) {
        self.distanceUnits = distanceUnits
        self.bearingUnits = bearingUnits
        if(!(self.distanceField.text == "") && !(self.bearingField.text == "")) {
            calculate()
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        self.view.addGestureRecognizer(detectTouch)
    }
    func dismissKeyboard() {
        self.view.endEditing(true);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settingsSegue" {
            if let dest  = segue.destination.childViewControllers[0] as? SettingsViewController {
                dest.delegate = self
                dest.distanceSelection = distanceUnits
                dest.bearingSelection = bearingUnits
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Credit to 3 functions below from stackoverflow
    func degreesToRadians(degrees: Double) -> Double { return degrees * .pi / 180.0 }
    func radiansToDegrees(radians: Double) -> Double { return radians * 180.0 / .pi }
    
    func getBearingBetweenTwoPoints(point1 : CLLocation, point2 : CLLocation) -> Double {
        
        let lat1 = degreesToRadians(degrees: point1.coordinate.latitude)
        let lon1 = degreesToRadians(degrees: point1.coordinate.longitude)
        
        let lat2 = degreesToRadians(degrees: point2.coordinate.latitude)
        let lon2 = degreesToRadians(degrees: point2.coordinate.longitude)
        
        let dLon = lon2 - lon1
        
        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let radiansBearing = atan2(y, x)
        
        return radiansToDegrees(radians: radiansBearing)
    }
}

