//
//  AppNavigationController.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/25/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
    }
    
    // MARK: - Appearance
    
    func setupAppearance() {
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = Colors.byProperty("navigationBarBackground")
        
        self.navigationBar.titleTextAttributes = [
            NSAttributedStringKey.foregroundColor: Colors.byProperty("navigationBar")
        ]
    }

}
