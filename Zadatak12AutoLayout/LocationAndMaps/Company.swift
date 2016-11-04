//
//  Company.swift
//  LocationAndMaps

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

