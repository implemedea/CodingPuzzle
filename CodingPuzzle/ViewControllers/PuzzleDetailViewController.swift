//
//  PuzzleDetailViewController.swift
//  CodingPuzzle
//
//  Created by Sebastin on 9/21/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

class PuzzleDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - IBAction
    
    @IBAction func closeDetailView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
