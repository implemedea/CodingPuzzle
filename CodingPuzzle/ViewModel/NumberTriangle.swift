//
//  NumberTriangle.swift
//  CodingPuzzle
//
//  Created by Sebastin on 21/11/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

class NumberTriangle: NSObject {
    
    var result:String = ""
    
    func numberTriangle(number:Int){
        var output = ""
        
        var i = 1
        while i <= number {
            var start = 1
            while start <= i{
                output = output + String(i) + " "
                start+=1
            }
            output = output + "\n"
            i+=1
        }
        print(output)
        self.result = output
    }
}
