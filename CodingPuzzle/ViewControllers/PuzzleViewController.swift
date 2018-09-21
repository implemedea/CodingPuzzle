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
        }
        
    }
    

}
