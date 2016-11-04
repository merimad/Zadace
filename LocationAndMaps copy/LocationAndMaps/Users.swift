//
//  Users.swift
//  LocationAndMaps
//
//  Created by Merima on 10/26/16.
//  Copyright © 2016 ena. All rights reserved.
//

import UIKit
// Singleton
class Users: NSObject {
    
    static let shared = Users()
    var users = [User]()
    
    private override init(){
        super.init()
    }
}
