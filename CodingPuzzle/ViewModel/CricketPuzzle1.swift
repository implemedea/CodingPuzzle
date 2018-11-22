//
//  CricketPuzzle1.swift
//  CodingPuzzle
//
//  Created by Sebastin on 22/11/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

class CricketPuzzle1: NSObject {
    var score:[String] = []
    var possible:String = ""
    
    func cricketPuzzle1(requiredRun:Int){
        var count:Int = 0
        for ballOne in 0...6 {
            for ballTwo in 0...6 {
                for ballThree in 0...6 {
                    for ballFour in 0...6 {
                        for ballFive in 0...6 {
                            for ballSix in 0...6 {
                                if(ballOne != 5 && ballTwo != 5 && ballThree != 5 && ballFour != 5 && ballFive != 5 && ballSix != 5){
                                    if(ballOne+ballTwo+ballThree+ballFour+ballFive+ballSix == requiredRun){
                                        count += 1
                                        score.append("ballOne = \(ballOne), ballTwo = \(ballTwo), ballThree= \(ballThree), ballFour= \(ballFour), ballFive =\(ballFive), ballSix=\(ballSix)")
                                        possible = "Possible ways = \(count)"
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    }
}
