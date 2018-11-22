//
//  TrapRain.swift
//  CodingPuzzle
//
//  Created by Sebastin on 21/11/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

class TrapRain: NSObject {

    var result:String = ""
    
    //MARK:- Water trap puzzle
    
    func waterTrap(aryWaterTank:Array<Int>){
        var vesselSpace:Int = 0
        var isFinished:Bool = false
        var aryWaterTank = aryWaterTank
        repeat{
            if(aryWaterTank.count > 2){
                var vessel = self.findMaxValue(input: aryWaterTank)
                if(vessel.endIndex == nil){
                    let reversed = self.reverseArray(input:aryWaterTank)
                    aryWaterTank = reversed
                    if(reversed.count > 0){
                        vessel = self.findMaxValue(input: reversed)
                    }

                    
                }
                if let vesselArray = vessel.vessel, let level = vessel.level, let lastIndex = vessel.endIndex{
                    vesselSpace = self.calculateVolume(vessel: vesselArray, level: level, volume: vesselSpace)
                    let aryRemain = self.remainingArray(index: lastIndex, input: aryWaterTank)
                    if(aryRemain.count == 0){
                        isFinished = true
                    }else{
                        aryWaterTank = aryRemain
                    }
                }
            }else{
                isFinished = true
                break
            }
        }while(!isFinished)
        self.result = String(vesselSpace)
    }
    
    /**       3
     *       2 |
     *     1 | |
     *     | | |
     *     ----------
     */
    fileprivate func findMaxValue(input:Array<Int>)->(level:Int?, endIndex:Int?, vessel:Array<Int>?){
        var endIndex:Int? = nil
        var level:Int? = nil
        var aryBlock:Array<Int> = []
        if(input.count > 0){
            var maxValue:Int? = nil
            for(index, element) in input.enumerated(){
                if(index == 0){
                    level = element
                    maxValue = element
                }else{
                    if(maxValue! <= element){
                        endIndex = index
                        break
                    }
                    aryBlock.append(element)
                }
            }
            return (level:level, endIndex:endIndex, vessel:aryBlock)
        }
        return (level:nil, endIndex:nil, vessel:nil)
    }
    
    fileprivate func calculateVolume(vessel:Array<Int>, level:Int, volume:Int)->Int{
        var volume = volume
        for(_, element) in vessel.enumerated(){
            volume = volume + (level - element)
        }
        return volume
    }
    
    fileprivate func remainingArray(index:Int, input:Array<Int>)->Array<Int>{
        var index = index
        var remainAry:Array<Int> = []
        while index != input.count{
            remainAry.append(input[index])
            index+=1
        }
        return remainAry
    }
    
    fileprivate func reverseArray(input:Array<Int>)->Array<Int>{
        var reversed:Array<Int> = []
        var count = input.count - 1
        repeat{
            reversed.append(input[count])
            count-=1
        }while(count>=0)
        return reversed
    }
    
}
