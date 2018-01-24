//
//  TMDBSession.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/24/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import Foundation
import Alamofire

// theMovieDatabaseSession
class TMDBSession {
    
    let httpClient = HTTPClient.init()
    let notificationCenter = NotificationCenter.default
    
    struct Body {
        struct Pagination {
            static let page = "page"
            static let total  = "total_results"
            static let totalPages = "total_pages"
        }
    }
    
    // MARK: HTTP Verbs
    
    func get(url: URLConvertible, parameters: Parameters?, success: @escaping (Int, Any, Any) -> Void, failure: @escaping (Int, Any) -> Void) {
        httpClient.get(url: url, parameters: parameters).responseJSON { response in
            self.handleResponse(response: response, success: success, failure: failure)
        }
    }
    
    // MARK: Helpers
    
    func handleResponse(response: DataResponse<Any>, success: (Int, [String : AnyObject], Any) -> Void, failure: (Int, Any) -> Void) -> Void {
        let statusCode: Int! = response.response?.statusCode
        
        switch response.result {
        case .success(_):
            if response.result.value != nil {
                let headers = response.response?.allHeaderFields
                
                success(statusCode, headers as! [String : AnyObject], response.result.value as? [String : AnyObject] ?? "")
            } else {
                failure(statusCode, response)
            }
        case .failure(_):
            if let statusCode = response.response?.statusCode {
                if statusCode == 401 {
                    notificationCenter.post(name: .invalidAPIKey, object: nil)
                }
                
                failure(statusCode, response)
            } else {
                // Network issues
                failure(400, response)
            }
        }
    }

}
