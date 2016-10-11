//
//  Geo.swift
//  iOS Networking_xcode8
//
//  Created by Merima on 10/10/16.
//  Copyright © 2016 Merima. All rights reserved.
//

import UIKit

class Geo: NSObject {
    var lat: String?
    var lng: String?
    init(lat: String, lng: String)
    {
        self.lat = lat
        self.lng = lng
    }
    override init() {
        super.init()    }
}
