//
//  PuzzleViewController.swift
//  CodingPuzzle
//
//  Created by Sebastin on 9/18/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

class PuzzleViewController: UIViewController {
    
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
    
    func waterTrap(){
        let aryWaterTank = [3,0,0,2,0,4]
        var volume = 0
        let tank = self.findStartAndEndWall(startIndex: 0, input: aryWaterTank)
        volume = self.calculateVolume(vessel: tank!.space, startNumber: tank!.startNumber, volume: volume)
        var aryRemain = self.remainingArray(index: tank!.endNumber, input: aryWaterTank)
        if(aryRemain.count > 0){
            self.waterTrap()
        }
    }
    
    func repeatFunc(startIndex: Int, aryWaterTank: Array){
        let tank = self.findStartAndEndWall(startIndex: 0, input: aryWaterTank)
        volume = self.calculateVolume(vessel: tank!.space, startNumber: tank!.startNumber, volume: volume)
        var aryRemain = self.remainingArray(index: tank!.endNumber, input: aryWaterTank)
    }
    
    func remainingArray(index:Int, input:Array<Int>)->Array<Int>{
        var remainAry:Array<Int> = []
        while index<input.count{
            remainAry.append(input[index])
        }
        return remainAry
    }
    
    func findStartAndEndWall(startIndex:Int, input:Array<Int>)->(space:Array<Int>, startNumber:Int, endNumber:Int)?{
        var aryBlock:Array<Int> = []
        var startNumber:Int? = nil
        var endNumber:Int? = nil
        if(startIndex < input.count){
            for value in startIndex...input.count{
                print(value)
            }
            
            for(index, element) in input.enumerated(){
                if(index == 0){
                    startNumber = element
                }else{
                    if(startNumber! < element){
                        endNumber = index
                        break
                    }
                    aryBlock.append(element)
                }
            }
            return (aryBlock, startNumber!, endNumber!)
        }
      return nil
    }
    
    func calculateVolume(vessel:Array<Int>, startNumber:Int, volume:Int)->Int{
        var volume = volume
        for(_, element) in vessel.enumerated(){
            volume = volume + (startNumber - element)
        }
        return volume
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
            self.waterTrap()
        }
        
    }
    

}
