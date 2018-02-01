//
//  CommonLabel.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/31/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import UIKit

class CommonLabel: UILabel {

    override func awakeFromNib() {
        self.textColor = Colors.byProperty("commonLabel")
    }
    
}
