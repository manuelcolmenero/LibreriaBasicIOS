//
//  DescCustomTableViewCell.swift
//  GigameshBasic
//
//  Created by Manuel Colmenero Navarro on 21/8/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class DescCustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleDescViewCell: UILabel!
    
    
    @IBOutlet weak var descriptionViewCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
