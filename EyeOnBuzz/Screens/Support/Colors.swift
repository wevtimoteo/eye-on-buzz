//
//  Colors.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/25/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import UIKit

class Colors {
    
    static func byProperty(_ propertyName: String) -> UIColor {
        // TODO: Check if color exist before
        return Skin.colors[propertyName]!
    }
    
    enum Skin {
        struct ColorPalette {
            static let balticSea = UIColor.init(red: 26/255, green: 25/255, blue: 28/255, alpha:1.0)
            static let grape = UIColor.init(red: 80/255, green: 6/255, blue: 146/255, alpha:1.0)
            static let feijoa = UIColor.init(red: 138/255, green: 211/255, blue: 123/255, alpha:1.0)
            static let blue = UIColor.init(red: 41/255, green: 89/255, blue: 148/255, alpha:1.0)
            static let mystic = UIColor.init(red: 222/255, green: 230/255, blue: 237/255, alpha:1.0)
            
            static let black = UIColor.init(red: 37/255, green: 37/255, blue: 37/255, alpha:1.0)
            static let white = UIColor.init(red: 249/255, green: 249/255, blue: 249/255, alpha:1.0)
            static let clear = UIColor.clear
        }
        
        static let colors = [
            // Background
            "tableBackground": ColorPalette.clear,
            "tableViewBackground": ColorPalette.mystic,
            "textFieldBackground": ColorPalette.mystic,
            "commonButtonBackground": ColorPalette.blue,
            
            // --- TableCell
            "tableCellBackground": ColorPalette.white,
            
            // --- UpcomingMovie screen
            "backdropImageContainerBackground": ColorPalette.black,
            
            // --- TagList
            "tagListBackground": ColorPalette.clear,
            "tagBackground": ColorPalette.blue,
            
            // NavigationBar
            "navigationBarBackground": ColorPalette.blue,
            
            // Borders
            "tableSeparator": ColorPalette.mystic,
            "tableSeparatorClear": ColorPalette.clear,
            
            // Fonts
            "activityIndicator": ColorPalette.mystic,
            "backButton": ColorPalette.mystic,
            "navigationBar": ColorPalette.white,
            "titleLabel": ColorPalette.blue,
            "commonLabel": ColorPalette.black,
            "fieldLabel": ColorPalette.balticSea,
            "commonButton": ColorPalette.white,
            "textField": ColorPalette.balticSea
        ]
    }
    
}
