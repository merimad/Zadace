//
//  ViewController.swift
//  i OS Networking
//
//  Created by Merima on 10/4/16.
//  Copyright © 2016 Merima. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var users = [User]()
    

    @IBAction func sendRequestForUser(_ sender: UIButton) {
        let url = URL(string:"https://jsonplaceholder.typicode.com/users")!
        URLSession.shared.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: NSError?) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                do {
                    let json = try  JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: AnyObject]]
                    
                    self.users = [User]()
                    
                    for userObjects in json {
                        
                    let user = User()
                        
                    if let id = userObjects["id"] as? Int {
                     user.id = id
                    }
                    if let name = userObjects["name"] as? String {
                        user.name = name
                    }
                    if let username = userObjects["username"] as? String {
                        user.username = username
                    }
                    if let email = userObjects["email"] as? String {
                        user.email = email
                    }
                    if let addressObject = userObjects["address"] as? [String : AnyObject] {
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
                        if let geoObject = addressObject["geo"] as? [String: AnyObject] {
                            let geo = Geo()
                                address.geo = geo
                            if let lat = geoObject["lat"] as? String {
                                geo.lat = lat
                            }
                            if let lng = geoObject["lng"] as? String {
                                geo.lng = lng
                            }
                        }                    }
                        if let companyObject = userObjects["company"] as? [String: AnyObject] {
                            let company = Company()
                            user.company = company
                        if let name = companyObject["name"] as? String {
                            company.name = name
                        }
                        if let catchPhrase = companyObject["catchPhrase"] as? String {
                            company.catchPhrase = catchPhrase
                        }
                            if let bs = companyObject["bs"] as? String {
                                company.bs = bs
                            }
                        }
                   
                        self.users.append(user)
                    }
                    
                    
                        self.tableView.reloadData()
                    
                }
                catch {
                
                }
            }} as! (Data?, URLResponse?, Error?) -> Void)  .resume()
        
                }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let user = users[(indexPath as NSIndexPath).row]
        cell?.textLabel?.text = user.name!
        cell?.detailTextLabel?.text = user.address?.street!
        return cell!
    }
    


}

