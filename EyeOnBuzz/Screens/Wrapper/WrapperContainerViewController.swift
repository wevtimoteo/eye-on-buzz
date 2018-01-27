//
//  WrapperContainerViewController.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/25/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import UIKit

class WrapperContainerViewController: UIViewController {

    var navigationBar: AppNavigationController!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Views
    
    func addSubviews() {
        self.navigationBar = AppNavigationController()
        self.addChildViewController(navigationBar)
        self.view.addSubview(navigationBar.view)
    }
    
}
