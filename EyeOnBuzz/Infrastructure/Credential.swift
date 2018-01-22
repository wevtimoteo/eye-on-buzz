//
//  Setting.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/22/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import Foundation

class Credential {
    
    static let _configurationFile: String = "Credentials"
    static let _configurationFileExtension: String = "plist"
    
    static var environment: String {
        let mainBundle: Bundle = Bundle.main
        
        return mainBundle.infoDictionary!["Environment"] as! String
    }
    
    static var configurations: Dictionary<String, String> {
        let mainBundle: Bundle = Bundle.main
        
        if let configurationURL = mainBundle.url(forResource: _configurationFile, withExtension: _configurationFileExtension),
            let data = try? Data(contentsOf: configurationURL) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] {
                return result![self.environment] as! Dictionary<String, String>
            }
        }
        
        return [String: String]()
    }
    
    class func theMovieDatabaseAPIKey() -> String {
        return self.configurations["THEMOVIEDB_API_KEY"]!
    }
    
}

