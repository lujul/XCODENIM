//
//  JeuDeNimTests.swift
//  JeuDeNimTests
//
//  Created by Maxime Britto on 10/11/2016.
//  Copyright © 2016 mbritto. All rights reserved.
//

import XCTest
@testable import JeuDeNim

class JeuDeNimTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let p:Player = Player(name: "toto")
        XCTAssertEqual(p.score, 0)
        p.win()
        XCTAssertEqual(p.score, 10)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
