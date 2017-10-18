//
//  GeoCalcTextField.swift
//  HW3
//
//  Created by user131266 on 10/17/17.
//  Copyright © 2017 eldridjo. All rights reserved.
//

import UIKit

class GeoCalcTextField: DecimalMinusTextField {

    override func awakeFromNib() {
        self.textColor = FOREGROUND_COLOR
        self.backgroundColor = UIColor.clear
        
        guard let ph = self.placeholder  else  {
            return
        }
        
        self.attributedPlaceholder =
            NSAttributedString(string: ph, attributes: [NSForegroundColorAttributeName:
                FOREGROUND_COLOR])
    }

}
