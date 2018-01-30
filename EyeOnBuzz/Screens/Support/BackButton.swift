//
//  BackButton.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/29/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import UIKit

class BackButton: UIBarButtonItem {
    
    class func build(title: String = "") -> BackButton {
        let backButton: BackButton = BackButton(title: title, style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        backButton.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: Colors.byProperty("backButton")], for: UIControlState.normal)
        
        return backButton
    }
    
}
