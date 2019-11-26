//
//  ColourTableViewCell.swift
//  Assignment1_JeanGulapa
//
//  Created by Jean on 2019-09-27.
//  Email: gulapaj@sheridancollege.ca
//  Copyright © 2019 Jean. All rights reserved.
//
//  ColourTableViewCell handles all the outlet needed in the main storyboard. Using this will allow manipulation to all outlets.

import UIKit

class ColourTableViewCell: UITableViewCell {

    //outlet needed for main storyboard
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var decimalValue: UILabel!
    @IBOutlet weak var hexaDecimal: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
