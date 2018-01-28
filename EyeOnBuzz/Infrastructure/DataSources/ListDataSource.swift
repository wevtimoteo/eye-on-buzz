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
    
    func atIndex(_ index: Int) -> Any {
        return self.list[index]
    }
    
    func count() -> Int {
        return self.list.count
    }

    func processPaginationInfo(_ responseBody: Dictionary<String, Any>) {
        self.page = responseBody[TMDBSession.Body.Pagination.page] as! Int
        self.total = responseBody[TMDBSession.Body.Pagination.total] as! Int
        self.totalPages = responseBody[TMDBSession.Body.Pagination.totalPages] as! Int
    }
    
}
