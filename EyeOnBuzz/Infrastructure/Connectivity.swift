//
//  Connectivity.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 2/4/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import Alamofire

class Connectivity {
    
    class func isNetworkUnreachable() -> Bool {
        return !NetworkReachabilityManager()!.isReachable
    }
    
}
