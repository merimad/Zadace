//
//  RatingControl.swift
//  FoodTracker_v1
//
//  Created by Naski on 2016-08-30.
//  Copyright © 2016 Naski. All rights reserved.
//

import UIKit

class RatingControl: UIView {

   // MARK: INITIALIZATION
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.backgroundColor = UIColor.redColor()
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)        
        addSubview(button)
    }
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    // MARK: Button action
    
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
}
