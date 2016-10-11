//
//  Posts.swift
//  iOS Networking_xcode8
//
//  Created by Merima on 10/10/16.
//  Copyright © 2016 Merima. All rights reserved.
//

import UIKit

class Posts: NSObject {
    var userId : Int?
    var id: Int?
    var title: String?
    var body: String?
    
    init(userId: Int,id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
        
        
    }
    override init () {
        super.init ()
    }

}
