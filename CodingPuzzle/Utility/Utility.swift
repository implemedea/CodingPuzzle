//
//  Utility.swift
//  CodingPuzzle
//
//  Created by Sebastin on 9/21/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

class Utility: NSObject {
    
    static let sharedInstance = Utility()
    
    func showAlert(title:String, message:String, action:String, vc:UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: action, style: .default, handler: nil)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
}
