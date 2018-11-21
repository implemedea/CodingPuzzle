//
//  FloydTriangle.swift
//  CodingPuzzle
//
//  Created by Sebastin on 21/11/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

class FloydTriangle: NSObject {

    var result:String = ""
    
    func floydTriangle(number:Int){
        var output = ""
        var i = 1
        var count = 1
        while i <= number {
            var start = 1
            while start <= count{
                output = output + String(i) + " "
                start+=1
                i+=1
            }
            count+=1
            output = output + "\n"
        }
        print(output)
        self.result = output
    }
}
