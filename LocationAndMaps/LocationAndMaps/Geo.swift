//
//  Geo.swift
//  LocationAndMaps

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
            super.init()
        }
    }

