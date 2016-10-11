//
//  ViewController.swift
//  iOS Networking_xcode8
//
//  Created by Merima on 10/10/16.
//  Copyright © 2016 Merima. All rights reserved.
//

import UIKit

/*protocol SelectedUserTableViewDelegate {
    func didPressCellWithUser(user: User)
    }*/

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    
    var users = [User]()
    var posts = [Posts]()
    //var selectedUser: User?
    /*var selectedUserIndex: Int?
    var selectedUser : User? {
        didSet {
            if let user = selectedUser {
                selectedUserIndex = users.index(of: user)
            }
        }
    }*/

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SendRequestForUsers(_ sender: UIButton) {
        let url = URL (string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [[String: AnyObject]]
                    
                    self.users = [User]()
                    
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
                        self.users.append(user)
                        
                    }
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print(error)
                }
            }
            }.resume()
        
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
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
            }
 */
// dodati u storyboard naziv za seque ShowUserPosts 
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "ShowUserPosts"){
        var postsForUser = segue.destination as! PostsTableViewController
        let indexPath = self.tableView.indexPathForSelectedRow
        let selectedUser = users[(indexPath?.row)!]
        postsForUser.userIdForPosts = selectedUser.id!
    }
    }
}

