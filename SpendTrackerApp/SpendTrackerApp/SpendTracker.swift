//
//  SpendTracker.swift
//  SpendTrackerApp
//
//  Created by Merima on 9/6/16.
//  Copyright © 2016 Merima. All rights reserved.
//

import UIKit
class SpendTracker {
    // MARK: Properties
    
    var amount: Double
    var description: String
    var date: UIDatePicker
    
    // MARK: Initialization
    
    init?(amount: Double, description: String, date:UIDatePicker){
        
        self.amount = amount
        self.description = description
        self.date = date
        
        if amount <= 0 && amount.isNaN && description.isEmpty {
            return nil
        }
    }}