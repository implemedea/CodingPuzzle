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
         self.aryFibonacci = ary
        if(aryFibonacci.count >= 2){
            let previousNum:Int = self.aryFibonacci[self.aryFibonacci.count - 2]
            let currNum:Int = self.aryFibonacci.last!
            let futureNum:Int = previousNum + currNum
            self.aryFibonacci.append(futureNum)
            if(count != self.aryFibonacci.count){
                findFibonacciSeries(count: count, ary: self.aryFibonacci)
            }
        }
    }
    
    
   
}
