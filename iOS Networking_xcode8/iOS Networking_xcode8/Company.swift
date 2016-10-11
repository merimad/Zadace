//
//  Company.swift
//  iOS Networking_xcode8
//
//  Created by Merima on 10/10/16.
//  Copyright © 2016 Merima. All rights reserved.
//

import UIKit

class Company: NSObject {
    var name: String?
    var catchPhrase: String?
    var bs: String?
    init(name:String, catchPhrase: String, bs: String)
    {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
        
    }
    override init() {
        super.init()    }
}
