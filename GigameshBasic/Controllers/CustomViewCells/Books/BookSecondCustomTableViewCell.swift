//
//  BookSecondCustomTableViewCell.swift
//  GigameshBasic
//
//  Created by Manuel Colmenero Navarro on 17/8/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class BookSecondCustomTableViewCell: UITableViewCell {
    @IBOutlet weak var literalText: UILabel!
    @IBOutlet weak var dataText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
