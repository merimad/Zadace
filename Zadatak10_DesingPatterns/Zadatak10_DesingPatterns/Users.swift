//
//  Users.swift
//  Zadatak10_DesingPatterns
//
//  Created by Merima on 10/12/16.
//  Copyright © 2016 Merima. All rights reserved.
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
