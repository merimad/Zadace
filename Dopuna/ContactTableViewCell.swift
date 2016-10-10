//
//  ContactTableViewCell.swift
//  Dopuna
//
//  Created by Merima on 9/21/16.
//  Copyright © 2016 Merima & Ena. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
// MARK: Properties
   
    @IBOutlet weak var contactNameLabel: UILabel!
    
    @IBOutlet weak var contactNumberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
