//
//  LoadingIndicator.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/28/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import NVActivityIndicatorView

class LoadingIndicator {
    
    static let activityData = ActivityData()
    
    class func start() {
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(self.activityData)
    }
    
    class func stop() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }

}
