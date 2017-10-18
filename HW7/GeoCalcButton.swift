//
//  GeoCalcButton.swift
//  HW3
//
//  Created by user131266 on 10/17/17.
//  Copyright © 2017 eldridjo. All rights reserved.
//

import UIKit

class GeoCalcButton: UIButton {

    override func awakeFromNib() {
        self.backgroundColor = FOREGROUND_COLOR
        self.tintColor = BACKGROUND_COLOR
        self.layer.cornerRadius = 5.0
    }

}
