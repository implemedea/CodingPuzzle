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
    
    func testNumberTriangle(){
        let objNumberTriangle = NumberTriangle()
        objNumberTriangle.numberTriangle(number: 4)
        XCTAssertTrue(objNumberTriangle.result == "1 \n2 2 \n3 3 3 \n4 4 4 4 \n", "failed -> number triangle")
        
    }
    
    func testFloydTriangle(){
        let objFloydTriangle = FloydTriangle()
        objFloydTriangle.floydTriangle(number: 5)
        XCTAssertTrue(objFloydTriangle.result == "1 \n2 3 \n4 5 6 \n", "failed -> testFloydTriangle")
        
    }
    
    func testFibonacciSeries(){
        let objFiboSeries = FibonacciSeries()
        objFiboSeries.findFibonacciSeries(count: 10, ary: [0,1])
        XCTAssertTrue(objFiboSeries.aryFibonacci == [0,1,1,2,3,5,8,13,21,34] && objFiboSeries.aryFibonacci.count == 10, "fibonacci series failed")
    }
    
    func testCricketPuzzle1(){
        let objCricket = CricketPuzzle1()
        objCricket.findPossileWayToScore(requiredRunInOneOver: 1)
        XCTAssertTrue(objCricket.possible == "Possible ways = 6", "possible ways failed")
        XCTAssertTrue(objCricket.score.count == 6, "score found error")
    }
}

