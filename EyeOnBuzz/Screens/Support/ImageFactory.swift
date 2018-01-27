//
//  ImageFactory.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/27/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import UIKit

class TMDBImageFactory {
    
    static let imagePrefix = String(format: "%@/t/p/w", Setting.theMovieDatabaseImagePrefixURL())
    
    class func fromPath(_ imagePath: String?, size: String = "92") -> UIImage? {
        if imagePath == nil {
            return nil
        }
        
        let imageURL = String(format: "%@%@/%@", imagePrefix, size, imagePath!)
        
        if let data = try? Data(contentsOf: URL(string: imageURL)!) {
            return UIImage.init(data: data)
        }
        
        return nil
    }
}
