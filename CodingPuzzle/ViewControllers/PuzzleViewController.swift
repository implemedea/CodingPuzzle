//
//  PuzzleViewController.swift
//  CodingPuzzle
//
//  Created by Sebastin on 9/18/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

class PuzzleViewController: UIViewController, UITextFieldDelegate {
    
    //MARK:- IBOutlet
    @IBOutlet weak var txtViewAnswer: UITextView!
    @IBOutlet weak var txtFldInput: UITextField!
    var puzzleType:PuzzleType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = puzzleType.rawValue
        
    }
    
    func numberTriangle(){
        guard let input = self.txtFldInput.text, !input.isEmpty else {
            Utility.sharedInstance.showAlert(title: "Alert", message: "Please enter number", action: "Ok", vc: self)
            return
        }
        guard let number = Int(input) else{
            Utility.sharedInstance.showAlert(title: "Alert", message: "Please enter number", action: "Ok", vc: self)
            return
        }
        
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
        self.txtViewAnswer.text = output
    }
    
    func floydTriangle(){
        guard let input = self.txtFldInput.text, !input.isEmpty  else {
            Utility.sharedInstance.showAlert(title: "Alert", message: "Please enter number", action: "Ok", vc: self)
            return
        }
        guard let number = Int(input) else{
            Utility.sharedInstance.showAlert(title: "Alert", message: "Please enter number", action: "Ok", vc: self)
            return
        }
        
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
        self.txtViewAnswer.text = output
       
    }
    
    func waterTrap(aryWaterTank:Array<Int>){
        var vesselSpace:Int = 0
        var isFinished:Bool = false
        var aryWaterTank = aryWaterTank
        repeat{
            if(aryWaterTank.count > 2){
                var vessel = self.findMaxValue(input: aryWaterTank)
                if(vessel.endIndex == nil){
//                    vessel = self.findSecondMaxValue(input: aryWaterTank)
                    if let vesselArray = vessel.vessel{
                        let reversed = self.reverseArray(input:vesselArray)
                        aryWaterTank = reversed
                        if(reversed.count > 0){
                            vessel = self.findMaxValue(input: reversed)
                        }
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
        txtViewAnswer.text = String(vesselSpace)
    }
    
    /**       3
    *       2 |
    *     1 | |
    *     | | |
    *     ----------
    */
    func findMaxValue(input:Array<Int>)->(level:Int?, endIndex:Int?, vessel:Array<Int>?){
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
    
    /**    3
     *     | 2
     *     | | 1
     *     | | |
     *     ----------
     */
    func findSecondMaxValue(input:Array<Int>)->(level:Int?, endIndex:Int?, vessel:Array<Int>?){
        var endIndex:Int? = nil
        var level:Int? = nil
        var aryBlock:Array<Int> = []
        if(input.count > 0){
            var maxValue:Int? = nil
            var secondMax:Int = 0
            for(index, element) in input.enumerated(){
                if(index == 0){
                    maxValue = element
                }else{
                    if(maxValue! > element){
                        if(element > secondMax){
                            endIndex = index
                            secondMax = element
                            level = secondMax
                        }
                        aryBlock.append(element)
                    }
                }
            }
            aryBlock.removeLast()
            return (level:level, endIndex:endIndex, vessel:aryBlock)
        }
        return (level:nil, endIndex:nil, vessel:nil)
    }
    
    func calculateVolume(vessel:Array<Int>, level:Int, volume:Int)->Int{
        var volume = volume
        for(_, element) in vessel.enumerated(){
            volume = volume + (level - element)
        }
        return volume
    }
    
    func remainingArray(index:Int, input:Array<Int>)->Array<Int>{
        var index = index
        var remainAry:Array<Int> = []
        while index != input.count{
            remainAry.append(input[index])
            index+=1
        }
        return remainAry
    }
    
    func reverseArray(input:Array<Int>)->Array<Int>{
        var reversed:Array<Int> = []
        var count = input.count - 1
        repeat{
            reversed.append(input[count])
            count-=1
        }while(count>=0)
        return reversed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - IBAction


    @IBAction func showOutput(_ sender: Any) {
        switch puzzleType! {
        case .floydTriangle:
            self.floydTriangle()
        case .numberTriangle:
            self.numberTriangle()
        case .watertrap:
            let array = self.txtFldInput.text.flatMap{Int(String($0))}
            self.waterTrap(aryWaterTank: array)
        }
        
    }
    
    //MARK:- text field delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }

}

extension Int {
    var array: [Int] {
        return String(self).flatMap{ Int(String($0)) }
    }
}
