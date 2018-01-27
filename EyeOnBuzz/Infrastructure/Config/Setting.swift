//
//  Setting.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/27/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import Foundation

class Setting {
    
    static let _configurationFileName = "Settings"
    static let _configurationFileExtension = "plist"
    
    static var configurations: Dictionary<String, String> {
        let mainBundle: Bundle = Bundle.main
        
        if let configurationURL = mainBundle.url(forResource: _configurationFileName, withExtension: _configurationFileExtension),
            let data = try? Data(contentsOf: configurationURL) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String: Any] {
                return result! as! Dictionary<String, String>
            }
        }
        
        return [String: String]()
    }
    
    // MARK: - Helpers
    
    class func theMovieDatabaseAPIPrefixURL() -> String {
        return self.configurations["THEMOVIEDB_API_PREFIX_URL"]!
    }
    
    class func theMovieDatabaseImagePrefixURL() -> String {
        return self.configurations["THEMOVIEDB_IMAGE_PREFIX_URL"]!
    }
}
