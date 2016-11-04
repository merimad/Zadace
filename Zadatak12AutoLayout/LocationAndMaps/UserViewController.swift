//
//  UserViewController.swift
//  LocationAndMaps
//

import UIKit

class UserViewController: UIViewController {
    
    var currentUser = User()

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var webSiteTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameOfTheUserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        topView.backgroundColor = UIColor(red: 87/255, green: 138/255, blue: 163/255, alpha: 1)
        imageView.image = UIImage(named:"Image\(arc4random_uniform(2)+1)")
        nameLabel.text = Users.shared.users.last!.name
        nameTextField.text = Users.shared.users.last!.name
        nameTextField.text = Users.shared.users.last!.name
        usernameTextField.text = Users.shared.users.last!.username
        emailTextField.text = Users.shared.users.last!.email
        addressTextField.text = (Users.shared.users.last?.address?.street)! + " , " + (Users.shared.users.last?.address?.city)!
        phoneTextField.text = Users.shared.users.last?.phone
        webSiteTextField.text = Users.shared.users.last?.website
        companyTextField.text = Users.shared.users.last?.company?.name
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
