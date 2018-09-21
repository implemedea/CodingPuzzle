//
//  PuzzleListTableViewCell.swift
//  CodingPuzzle
//
//  Created by Sebastin on 9/21/18.
//  Copyright © 2018 Sebastin. All rights reserved.
//

import UIKit

protocol ProtocolPuzzleDetail:class {
    func showPuzzleDetail()
}

class PuzzleListTableViewCell: UITableViewCell {
    @IBOutlet weak var lblPuzzleName: UILabel!
    @IBOutlet weak var btnPuzzleDetail: UIButton!
    weak var delegate:ProtocolPuzzleDetail? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func puzzleDetail(_ sender: Any) {
        self.delegate?.showPuzzleDetail()
    }
}
