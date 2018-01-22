//
//  CredentialTest.swift
//  EyeOnBuzzTests
//
//  Created by Weverton Couto Timoteo on 1/22/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import XCTest
@testable import EyeOnBuzz

class CredentialTest: XCTestCase {
    
    let describedClass = Credential.self
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEnvironment() {
        XCTAssertEqual("Debug", describedClass.environment)
    }
    
    func testTheMovieDatabaseAPIKeyIsNotEmpty() {
        XCTAssertTrue(describedClass.theMovieDatabaseAPIKey().count > 0)
    }
    
}
