//
//  Router.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/22/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import Foundation

class Router {
    
    struct TheMovieDatabaseAPI {
        
        static let version: String = "3"
        static let address: String = String(format: "https://api.themoviedb.org/%@/", version)
        
        static var upcomingMovies: String { return theMovieDatabaseAPIEndpoint("movie/upcoming") }
        
        // MARK: Helpers
        
        static func theMovieDatabaseAPIEndpoint(_ endpoint: String) -> String {
            return String(format: "%@%@", address, endpoint)
        }
        
    }
    
}
