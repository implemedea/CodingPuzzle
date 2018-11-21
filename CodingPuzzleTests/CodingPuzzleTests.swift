//
//  CodingPuzzleTests.swift
//  CodingPuzzleTests
//
//  Created by Sebastin on 9/18/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import XCTest
@testable import CodingPuzzle

class CodingPuzzleTests: XCTestCase {
    
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
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testWaterTrap(){
        let objRainTrap = TrapRain()
        objRainTrap.waterTrap(aryWaterTank: [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1])
        XCTAssertTrue(Int(objRainTrap.result) == 6, "failed -> [0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]")
        objRainTrap.waterTrap(aryWaterTank: [3,0,0,2,0,4])
        XCTAssertTrue(Int(objRainTrap.result) == 10, "failed -> [3,0,0,2,0,4]")
        objRainTrap.waterTrap(aryWaterTank: [4,1,2,3])
        XCTAssertTrue(Int(objRainTrap.result) == 3, "failed -> [4,1,2,3]")
        objRainTrap.waterTrap(aryWaterTank: [1,2,3,2,1])
        XCTAssertTrue(Int(objRainTrap.result) == 0, "failed -> [1,2,3,2,1]")
        objRainTrap.waterTrap(aryWaterTank: [3,2,1,1,2,3])
        XCTAssertTrue(Int(objRainTrap.result) == 6, "failed -> [3,2,1,1,2,3]")
        objRainTrap.waterTrap(aryWaterTank: [1,0,2,0,3,0,1])
        XCTAssertTrue(Int(objRainTrap.result) == 4, "failed -> [1,0,2,0,3,0,1]")
        objRainTrap.waterTrap(aryWaterTank: [1,0,2,0,3])
        XCTAssertTrue(Int(objRainTrap.result) == 3, "failed -> [1,0,2,0,3]")
        objRainTrap.waterTrap(aryWaterTank: [4,0,3,0,2])
        XCTAssertTrue(Int(objRainTrap.result) == 5, "failed -> [4,0,3,0,2]")
    }
}
