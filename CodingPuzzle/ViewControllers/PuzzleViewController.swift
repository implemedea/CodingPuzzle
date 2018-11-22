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
    
   // MARK: - IBAction
    @IBAction func showOutput(_ sender: Any) {
        switch puzzleType! {
        case .floydTriangle:
            self.floydTriangle()
        case .numberTriangle:
            self.numberTriangle()
        case .watertrap:
            let aryDigit = self.txtFldInput.text?.compactMap{Int(String($0))}
            if let aryDigit = aryDigit{
                if(aryDigit.count > 0){
                    let objTrapRain = TrapRain()
                    objTrapRain.waterTrap(aryWaterTank: aryDigit)
                    self.trapRainResult = objTrapRain.result
                }
            }
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

//MARK:- Extension

extension Int {
    var array: [Int] {
        return String(self).compactMap{ Int(String($0)) }
    }
}
