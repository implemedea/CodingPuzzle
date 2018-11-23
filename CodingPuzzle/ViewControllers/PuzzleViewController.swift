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
    
    
    //MARK:- Member variable
    
    var puzzleType:PuzzleType!
    
    
    var trapRainResult:String = ""{
        didSet{
            self.txtViewAnswer.text = trapRainResult
        }
    }
    var numberTriangleResult = ""{
        didSet{
            self.txtViewAnswer.text = numberTriangleResult
        }
    }
    var floydTriangleResult:String = ""{
        didSet{
            self.txtViewAnswer.text = floydTriangleResult
        }
    }
    var fibonacciResult:[Int] = []{
        didSet{
            let aryString:[String] = fibonacciResult.compactMap{String ($0)}
            self.txtViewAnswer.text = aryString.joined(separator: "\n")
        }
    }
    var cricketPuzzle1Result:String = ""{
        didSet{
            self.txtViewAnswer.text = cricketPuzzle1Result
        }
    }
    
    //MARK:- Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = puzzleType.rawValue
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- Number triangle
    
    func numberTriangle(){
        guard let input = self.txtFldInput.text, !input.isEmpty else {
            Utility.sharedInstance.showAlert(title: "Alert", message: "Please enter number", action: "Ok", vc: self)
            return
        }
        guard let number = Int(input) else{
            Utility.sharedInstance.showAlert(title: "Alert", message: "Please enter number", action: "Ok", vc: self)
            return
        }
        let objNumberTriangle = NumberTriangle()
        objNumberTriangle.numberTriangle(number: number)
        self.numberTriangleResult = objNumberTriangle.result
    }
    
    //MARK:- Floyd triangle
    
    func floydTriangle(){
        guard let input = self.txtFldInput.text, !input.isEmpty  else {
            Utility.sharedInstance.showAlert(title: "Alert", message: "Please enter number", action: "Ok", vc: self)
            return
        }
        guard let number = Int(input) else{
            Utility.sharedInstance.showAlert(title: "Alert", message: "Please enter number", action: "Ok", vc: self)
            return
        }
        
        let objFloydTriangle = FloydTriangle()
        objFloydTriangle.floydTriangle(number: number)
        self.floydTriangleResult = objFloydTriangle.result
    }
    
    
    //MARK:- Water trap
    
    func waterTrap(){
        guard let input = self.txtFldInput.text, !input.isEmpty  else {
            Utility.sharedInstance.showAlert(title: "Alert", message: "Please enter number more than 2 digit", action: "Ok", vc: self)
            return
        }
        let aryDigit = self.txtFldInput.text?.compactMap{Int(String($0))}
        if let aryDigit = aryDigit{
            if(aryDigit.count > 0){
                let objTrapRain = TrapRain()
                objTrapRain.waterTrap(aryWaterTank: aryDigit)
                self.trapRainResult = objTrapRain.result
            }
        }
    }
    
    //MARK:- Fibonacci Series
    
    func fibonacciSeries(){
        guard let input = self.txtFldInput.text, !input.isEmpty  else {
            Utility.sharedInstance.showAlert(title: "Alert", message: "Please enter length of fibonacci series", action: "Ok", vc: self)
            return
        }
        guard let number = Int(input), number <= 47 else{
            Utility.sharedInstance.showAlert(title: "Alert", message: "Please enter number less than or equal to 47 which is fit for Integer", action: "Ok", vc: self)
            return
        }
        let objFibonacci = FibonacciSeries()
        objFibonacci.findFibonacciSeries(count: number, ary: [0,1])
        self.fibonacciResult = objFibonacci.aryFibonacci
    }
    
    //MARK:- Cricket puzzle 1
    
    func cricketPuzzle1(){
        guard let input = self.txtFldInput.text, !input.isEmpty  else {
            Utility.sharedInstance.showAlert(title: "Alert", message: "Please enter required run in single over", action: "Ok", vc: self)
            return
        }
        guard let number = Int(input) else{
            Utility.sharedInstance.showAlert(title: "Alert", message: "Please enter number", action: "Ok", vc: self)
            return
        }
        let objCricketPuzzle1 = CricketPuzzle1()
        objCricketPuzzle1.findPossileWayToScore(requiredRunInOneOver: number)
        let score:String = objCricketPuzzle1.score.joined(separator: "\n")
        self.cricketPuzzle1Result = "\n" + objCricketPuzzle1.possible + "\n" + score 
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
        case .fibonacciSeries:
            self.fibonacciSeries()
        case .cricketpuzzle1:
            self.cricketPuzzle1()
        }
        
        
    }
}

//MARK:- Extension

extension Int {
    var array: [Int] {
        return String(self).compactMap{ Int(String($0)) }
    }
}

extension PuzzleViewController: UITextFieldDelegate {
    //MARK:- text field delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
}
