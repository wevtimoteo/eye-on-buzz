//
//  RouterTest.swift
//  EyeOnBuzzTests
//
//  Created by Weverton Couto Timoteo on 1/22/18.
//  Copyright © 2018 Weverton Couto Timoteo. All rights reserved.
//

import XCTest
@testable import EyeOnBuzz

class RouterTest: XCTestCase {
    
    let describedClass = Router.TheMovieDatabaseAPI.self
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTheMovieDatabaseAPIAddress() {
        XCTAssertEqual("https://api.themoviedb.org/3/", describedClass.address)
    }
    
    func testTheMovieDatabaseAPIUpcomingMoviesEndpoint() {
        XCTAssertEqual("https://api.themoviedb.org/3/movie/upcoming", describedClass.upcomingMovies)
    }
    
}
