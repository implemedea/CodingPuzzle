//
//  ViewController.swift
//  CodingPuzzle
//
//  Created by Sebastin on 9/18/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

class PuzzleListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var aryPuzzleList:Array = [PuzzleType.floydTriangle.rawValue,
                               PuzzleType.numberTriangle.rawValue]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.topItem?.title = "Puzzles"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- tableview datasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.aryPuzzleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "PuzzleListCellId"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        cell?.textLabel?.text = self.aryPuzzleList[indexPath.row]
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vcPuzzle:PuzzleViewController = storyboard.instantiateViewController(withIdentifier: "PuzzleViewController") as! PuzzleViewController
        vcPuzzle.puzzleType = PuzzleType(rawValue: self.aryPuzzleList[indexPath.row])
        self.navigationController?.pushViewController(vcPuzzle, animated: true)
    }

}

