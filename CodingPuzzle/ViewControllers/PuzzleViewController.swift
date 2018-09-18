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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func numberTriangle(){
        let input = Int(self.txtFldInput.text!)
        var output = ""
       
        var i = 1
        while i <= input! {
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
        let input = Int(self.txtFldInput.text!)
        var output = ""
        
        var i = 1
        while i <= input! {
            var start = 1
            while start <= i{
                output = output + String(i) + " "
                start+=1
                i+=1
            }
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
        self.floydTriangle()
    }
    

}
