//
//  Address.swift
//  iOS Networking_xcode8
//
//  Created by Merima on 10/10/16.
//  Copyright © 2016 Merima. All rights reserved.
//

import UIKit

class Address: NSObject {
    
    var street: String?
    var suite: String?
    var city: String?
    var zipcode: String?
    var geo: Geo?
    init(street: String, suite: String, city: String, zipcode: String, geo: Geo){
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
    override init() {
        super.init()    }
}
