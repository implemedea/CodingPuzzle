//
//  FibonacciSeries.swift
//  CodingPuzzle
//
//  Created by Sebastin on 22/11/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

class FibonacciSeries: NSObject {

    var aryFibonacci:[Int] = []
    
    final func findFibonacciSeries(count:Int, ary:[Int]){
        var aryFibonacci:[Int] = ary
        if(aryFibonacci.count >= 2){
            let previousNum:Int = aryFibonacci[aryFibonacci.count - 2]
            let currNum:Int = aryFibonacci.last!
            let futureNum:Int = previousNum + currNum
            aryFibonacci.append(futureNum)
            if(count != aryFibonacci.count){
                findFibonacciSeries(count: count, ary: aryFibonacci)
            }
        }
        self.aryFibonacci = aryFibonacci
    }
    
    
   
}
