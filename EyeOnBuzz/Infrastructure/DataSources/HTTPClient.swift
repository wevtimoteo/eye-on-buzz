//
//  HTTPClient.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/22/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import Foundation
import Alamofire

class HTTPClient {
    
    func get(url: URLConvertible, parameters: Parameters?) -> DataRequest {
        return request(url: url, method: .get, parameters: parameters, encoding: URLEncoding.default)
    }
    private
    
    func request(url: URLConvertible, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding = JSONEncoding.default) -> DataRequest {
        return Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: self.headers())
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
    }
    
    func headers() -> HTTPHeaders {
        return [
            "Accept": "application/json"
        ]
    }
    
}
