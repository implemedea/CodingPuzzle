//
//  Sort.swift
//  CodingPuzzle
//
//  Created by Sebastin on 02/06/19.
//  Copyright © 2019 Sebastin. All rights reserved.
//

import UIKit

class Sort {
    var startIndex = 1
    var input1 = [4,3,1,5,2]
    var lastIndex = 0
    var pivotIndex: Int = 0
    
    
    init() {
        self.lastIndex = self.input1.count - 2
        self.pivotIndex = self.input1.count - 1
    }
    
    
    func quickSort(input: inout [Int]){
        pivotIndex = self.sortt(input: &input, startIndex: 0, pivotIndex: pivotIndex, lastIndex: pivotIndex-1)
        pivotIndex = self.sortt(input: &input, startIndex: pivotIndex+1, pivotIndex: pivotIndex, lastIndex: lastIndex)
        print(input)
        self.quickSort(input: &input)
    }
    
    func sortt (input: inout [Int], startIndex: Int, pivotIndex: Int, lastIndex: Int) -> Int {
        var startIndex = startIndex
        var pivotIndex = pivotIndex
        var lastIndex = lastIndex
        while input[startIndex] <= input[pivotIndex] {
            startIndex += 1
        }
        while input[lastIndex] > input[pivotIndex] {
            lastIndex -= 1
        }
        if startIndex >= lastIndex {
            input.swapAt(pivotIndex, lastIndex)
            pivotIndex = lastIndex
        }
        input.swapAt(startIndex, lastIndex)
        return pivotIndex
    }
}





