//
//  ViewController.swift
//  CodingPuzzle
//
//  Created by Sebastin on 9/18/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

class PuzzleListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, ProtocolPuzzleDetail {
    var aryPuzzleList:Array = [PuzzleType.floydTriangle.rawValue,
                               PuzzleType.numberTriangle.rawValue,
                               PuzzleType.watertrap.rawValue]
    
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
        let cellId = "PuzzleListTableViewCell"
        let cell:PuzzleListTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId) as! PuzzleListTableViewCell
        cell.delegate = self as ProtocolPuzzleDetail
        cell.lblPuzzleName.text = self.aryPuzzleList[indexPath.row]
        cell.btnPuzzleDetail.isHidden = true
        if(PuzzleType.watertrap.rawValue == self.aryPuzzleList[indexPath.row]){
            cell.btnPuzzleDetail.isHidden = false
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vcPuzzle:PuzzleViewController = storyboard.instantiateViewController(withIdentifier: "PuzzleViewController") as! PuzzleViewController
        vcPuzzle.puzzleType = PuzzleType(rawValue: self.aryPuzzleList[indexPath.row])
        self.navigationController?.pushViewController(vcPuzzle, animated: true)
    }
    
    //MARK:- protocol implementation
    
    func showPuzzleDetail() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vcPuzzleDetail:PuzzleDetailViewController = storyboard.instantiateViewController(withIdentifier: "PuzzleDetailViewController") as! PuzzleDetailViewController
        self.present(vcPuzzleDetail, animated: true, completion: nil)
    }

}

