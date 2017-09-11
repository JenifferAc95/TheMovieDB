//
//  TheMovieDBTests.swift
//  TheMovieDBTests
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import XCTest
@testable import TheMovieDB

class TheMovieDBTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRetrievePopularMoviesNotNil() {
        
        let expect = expectation(description: "Movie shoold be kind -Movie-")
        
        MovieFacade().retrievePopularMovies(completion: {
            popularMovies in
            
            if let movie = popularMovies as? [Movie] {
                XCTAssertTrue(true)
                expect.fulfill()
            }
        
        })
        
        waitForExpectations(timeout: 30) { (error) in
            XCTAssertNil(error, "Test time out")
        }
    }
    
    
    
    
}
