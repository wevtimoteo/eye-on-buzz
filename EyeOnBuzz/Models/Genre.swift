//
//  Genre.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/28/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

class Genre {
    
    let identifier: Int
    let name: String
    
    init(_ genreInfo: Dictionary<String, Any>) {
        self.identifier = genreInfo["id"] as! Int
        self.name = genreInfo["name"] as! String
    }
    
}
