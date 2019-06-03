//
//  ViewController.swift
//  CodingPuzzle
//
//  Created by Sebastin on 9/18/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

class PuzzleListViewController: UIViewController {
    var aryPuzzleList:Array = [PuzzleType.floydTriangle.rawValue,
                               PuzzleType.numberTriangle.rawValue,
                               PuzzleType.watertrap.rawValue,
                               PuzzleType.fibonacciSeries.rawValue,
                               PuzzleType.cricketpuzzle1.rawValue]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.topItem?.title = "Puzzles"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let objSort = Sort()
        var input = [4,3,1,5,2]
        objSort.quickSort(input: &input)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PuzzleListViewController:UITableViewDelegate, UITableViewDataSource, ProtocolPuzzleDetail{
   
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
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    //MARK:- protocol implementation
    
    func showPuzzleDetail() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vcPuzzleDetail:PuzzleDetailViewController = storyboard.instantiateViewController(withIdentifier: "PuzzleDetailViewController") as! PuzzleDetailViewController
        self.present(vcPuzzleDetail, animated: true, completion: nil)
    }
}
