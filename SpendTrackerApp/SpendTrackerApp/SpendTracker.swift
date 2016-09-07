//
//  SpendTracker.swift
//  SpendTrackerApp
//
//  Created by Merima on 9/6/16.
//  Copyright © 2016 Merima. All rights reserved.
//

import UIKit
class SpendTracker: NSObject, NSCoding{
    // MARK: Properties
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("expenses")
    // MARK: Types
    struct PropertyKey {
        static let dateKey = "date"
        static let amountKey = "amount"
        static let descriptionKey = "desc"    }
    var amount: String
    var desc: String
    var date: String
    
    // MARK: Initialization
    
    init?(amount: String, desc: String, date:String){
        
        self.amount = amount
        self.desc = desc
        self.date = date
        super.init()
        
        if amount.isEmpty && desc.isEmpty {
            return nil
        }
    }
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(amount, forKey: PropertyKey.amountKey)
        aCoder.encodeObject(desc, forKey: PropertyKey.descriptionKey)
        aCoder.encodeObject(date,forKey: PropertyKey.dateKey)    }
    required convenience init?(coder aDecoder: NSCoder) {
        let amount = aDecoder.decodeObjectForKey(PropertyKey.amountKey) as! String
        let desc = aDecoder.decodeObjectForKey(PropertyKey.descriptionKey) as! String
        let date = aDecoder.decodeObjectForKey(PropertyKey.dateKey) as! String
        self.init(amount: amount, desc: desc, date: date)
        
    }
}