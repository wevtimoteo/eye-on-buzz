//
//  Colors.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/25/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import Foundation
import UIKit

class Colors {
    
    static func byProperty(_ propertyName: String) -> UIColor {
        // TODO: Check if color exist before
        return Skin.colors[propertyName]!
    }
    
    enum Skin {
        struct ColorPalette {
            static let balticSea = UIColor.init(red: 26/255, green: 25/255, blue: 28/255, alpha:1.0)
            static let grape = UIColor.init(red: 64/255, green: 28/255, blue: 96/255, alpha:1.0)
            static let feijoa = UIColor.init(red: 138/255, green: 211/255, blue: 123/255, alpha:1.0)
            static let ming = UIColor.init(red: 64/255, green: 121/255, blue: 140/255, alpha:1.0)
            static let mystic = UIColor.init(red: 222/255, green: 230/255, blue: 237/255, alpha:1.0)
            static let clear = UIColor.clear
        }
        
        static let colors = [
            // Background
            "tableBackground": ColorPalette.clear,
            "tableViewBackground": ColorPalette.mystic,
            
            // NavigationBar
            "navigationBarBackground": ColorPalette.feijoa,
            
            // Borders
            "tableSeparator": ColorPalette.clear,
            
            // Fonts
            // Fonts
            "backButton": ColorPalette.ming,
            "navigationBar": ColorPalette.balticSea
        ]
    }
    
}
