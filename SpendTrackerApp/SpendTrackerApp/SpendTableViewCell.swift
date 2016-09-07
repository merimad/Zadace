//
//  SpendTableViewCell.swift
//  SpendTrackerApp
//
//  Created by Merima on 9/7/16.
//  Copyright © 2016 Merima. All rights reserved.
//

import UIKit

class SpendTableViewCell: UITableViewCell {
    // MARK: Properties
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
