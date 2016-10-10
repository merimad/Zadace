//
//  Contact.swift
//  Dopuna
//
//  Created by Merima on 9/21/16.
//  Copyright © 2016 Merima & Ena. All rights reserved.
//

import UIKit
class Contact: NSObject, NSCoding {
    
    var name: String?
    var phoneNumber: String
    init?(name: String?, phoneNumber: String)
{
    self.name = name
    self.phoneNumber = phoneNumber
    
    super.init()
    
    if phoneNumber.isEmpty {
        return nil
        }
    }
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("contacts")
    
    struct PropertyKey {
        static let nameKey = "name"
        static let numberKey = "phoneNumber"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(phoneNumber, forKey: PropertyKey.numberKey)
    }
    required convenience init? (coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String?
        let phoneNumber = aDecoder.decodeObject(forKey: PropertyKey.numberKey) as! String
        
        self.init (name: name, phoneNumber: phoneNumber)
    }
}
