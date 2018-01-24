//
//  ListDataSource.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/24/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import Foundation

class ListDataSource {
    let session = TMDBSession.init()
    let targetTable: DataSourceTarget
    
    var list: Array<Any> = []
    
    var page: Int = 0
    var total: Int = 0
    var totalPages: Int = 0
    
    init(targetTable: DataSourceTarget) {
        self.targetTable = targetTable
    }
    
    func processPaginationInfo(_ responseBody: Dictionary<String, Any>) {
        self.page = Int(responseBody[TMDBSession.Body.Pagination.page] as! String)!
        self.total = Int(responseBody[TMDBSession.Body.Pagination.total] as! String)!
        self.totalPages = Int(responseBody[TMDBSession.Body.Pagination.totalPages] as! String)!
    }
}
