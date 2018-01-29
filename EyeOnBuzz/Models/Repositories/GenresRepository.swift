//
//  GenresRepository.swift
//  EyeOnBuzz
//
//  Created by Weverton Couto Timoteo on 1/28/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

private class GenresRepositorySetupHelper {
    
    var list = [Int: String]()
    
    init() {}
    
}

final class GenresRepository {
    
    static let sharedInstance = GenresRepository()
    private static let setup = GenresRepositorySetupHelper()
    
    var list = [Int: String]()
    
    class func setup(list: [Int: String]) {
        GenresRepository.setup.list = list
    }
    
    private init() {
        self.list = GenresRepository.setup.list
    }
    
    func nameByIdentifier(_ identifier: Int) -> String {
        return self.list[identifier]!
    }
    
}
