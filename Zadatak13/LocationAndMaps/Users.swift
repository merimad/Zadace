//
//  Users.swift
//  LocationAndMaps
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
