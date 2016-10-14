//
//  ServerCommunication.swift
//  Zadatak10_DesingPatterns
//
//  Created by Merima on 10/14/16.
//  Copyright © 2016 Merima. All rights reserved.
//

import UIKit

class ServerCommunication: NSObject {
    static var shared = ServerCommunication()
    override init (){
        super.init()
    }
    var users = [User]()
    func refreshUsers(){
        let url = URL (string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: AnyObject]]
                    
                     Users.shared.users = [User]()
                    for userObject in json {
                        
                        let user = User()
                        
                        if let id = userObject["id"] as? Int {
                            user.id = id
                        }
                        
                        if let name = userObject["name"] as? String {
                            user.name = name
                        }
                        if let username = userObject["username"] as? String {
                            user.username = username
                        }
                        
                        if let email = userObject["email"] as? String {
                            user.email = email
                        }
                        
                        if let addressObject = userObject["address"] as? [String : AnyObject] {
                            let address = Address()
                            user.address = address
                            
                            if let street = addressObject["street"] as? String {
                                address.street = street
                            }
                            
                            if let suite = addressObject["suite"] as? String {
                                address.suite = suite
                            }
                            
                            if let city = addressObject["city"] as? String {
                                address.city = city
                            }
                            
                            if let zipcode = addressObject["zipcode"] as? String {
                                address.zipcode = zipcode
                            }
                            
                            if let geoObject = addressObject["geo"] as? [String: AnyObject] {
                                let geo = Geo ()
                                address.geo = geo
                                
                                if let lat = geoObject["lat"] as? String {
                                    geo.lat = lat
                                }
                                
                                if let lng = geoObject["lng"] as? String {
                                    geo.lng = lng
                                }
                            }
                        }
                        
                        if let companyObject = userObject["company"] as? [String: AnyObject] {
                            let company = Company()
                            user.company = company
                            
                            if let name = companyObject["name"] as? String? {
                                company.name = name
                            }
                            
                            if let catchPhrase = companyObject["catchPhrase"] as? String {
                                company.catchPhrase = catchPhrase
                            }
                            
                            if let bs = companyObject["bs"] as? String {
                                company.bs = bs
                            }
                            
                            
                        }
                        Users.shared.users.append(user)
                        
                    }
                    DispatchQueue.main.sync {
                        NotificationCenter.default.post(name: Notification.Name(rawValue: "UsersRefreshed"),object: nil)
                        
                    }
                    
                } catch {
                    print(error)
                }
            }
            }.resume()

    }

}
