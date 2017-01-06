//
//  VariantTableViewCell.swift
//  Zakon
//
//  Created by User on 1/6/17.
//  Copyright © 2017 AA. All rights reserved.
//

import UIKit

class VariantTableViewCell: UITableViewCell {

    @IBOutlet weak var variantText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
