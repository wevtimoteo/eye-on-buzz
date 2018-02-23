//
//  FieldLabel.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 2/1/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import UIKit

class FieldLabel: UILabel {
    
    override func awakeFromNib() {
        self.textColor = Colors.byProperty("fieldLabel")
    }
    
}
