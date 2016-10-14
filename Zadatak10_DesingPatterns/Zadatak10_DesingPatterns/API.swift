//
//  API.swift
//  Zadatak10_DesingPatterns
//
//  Created by Merima on 10/14/16.
//  Copyright © 2016 Merima. All rights reserved.
//

import UIKit

class API: NSObject {
    static var shared = API()
    private override init (){
    super.init()
    }
    func refreshUsers(){
    var serverComunicationInstance = ServerCommunication()
        serverComunicationInstance.refreshUsers()
    }
}
