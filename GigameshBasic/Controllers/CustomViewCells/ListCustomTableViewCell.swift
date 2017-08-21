//
//  ListCustomTableViewCell.swift
//  GigameshBasic
//
//  Created by Manuel Colmenero Navarro on 20/8/17.
//  Copyright © 2017 Manuel Colmenero Navarro. All rights reserved.
//

import UIKit

class ListCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageList: UIImageView!
    
    @IBOutlet weak var titleList: UILabel!
    
    @IBOutlet weak var descriptionList: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
