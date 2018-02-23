//
//  DataSourceTarget.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/24/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

struct DataSource {
    
    enum RefreshSource {
        case dontCare
        case genreList
    }
    
    enum RefreshStatus {
        case success
        case failure
    }
    
}

protocol DataSourceTarget {
    
    func dataRefreshed(source: DataSource.RefreshSource, status: DataSource.RefreshStatus)
    
}
