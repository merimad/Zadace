//
//  ViewController.swift
//  Dopuna
//
//  Created by Merima on 9/21/16.
//  Copyright © 2016 Merima & Ena. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    
    @IBOutlet weak var addNewContactBarButton: UIBarButtonItem!
    @IBOutlet weak var contactImage: UIImageView!
    
    @IBOutlet weak var dodajNoviRacun: UIButton!
    @IBOutlet weak var contactName: UITextField!
    @IBOutlet weak var numberImage: UIImageView!
    @IBOutlet weak var stateNumber: UILabel!
    @IBOutlet weak var contactNumber: UITextField!
    /*
     This value is either passed by `ContactTableViewController` in `prepareForSegue(_:sender:)`
     or constructed as part of adding a new meal.
     */
    var contact: Contact?
    
    override func viewDidLoad() {     // ovo ti je za boje i oni dugmici da budu zaobljeni OK
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        contactName.delegate = self
        contactNumber.delegate = self
        stateNumber.layer.borderWidth = 0.0
        //contactName.layer.borderColor = UIColor(Red: 83/255.00f, green: 219/255.00f, blue: 207/255.00,f, alpha: 1.0,f).CGColor
        //contactName.layer.borderColor = UIColor(red:83.0, green: 219.0 , blue: 207.0, alpha: 1.0).CGColor
        //contactName.layer.borderWidth = CGFloat(1.0)
        contactName.layer.borderColor = UIColor(red: 83/255, green: 219/255, blue: 207/255, alpha: 1).cgColor
        contactName.layer.borderWidth = CGFloat(1.0)
        contactNumber.layer.borderColor = UIColor(red: 83/255, green: 219/255, blue: 207/255, alpha: 1).cgColor
        contactNumber.layer.borderWidth = CGFloat(1.0)
        contactName.layer.cornerRadius = 8
        contactNumber.layer.cornerRadius = 8
        dodajNoviRacun.layer.cornerRadius = 6
        // Set up views if editing an existing Contact.
        if let contact = contact {
            contactName.text = contact.name
            contactNumber.text = contact.phoneNumber
        }
    }
    
     // IUTextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: Action:
    

    @IBAction func addNewContactBarButton(_ sender: UIBarButtonItem) {
       addingNewContact()
    }
    @IBAction func addNewContact(_ sender: UIButton) {
       addingNewContact()
    }
  
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddContactMode = presentingViewController is UINavigationController
        
        if isPresentingInAddContactMode {
            dismiss(animated: false, completion: nil)
        }
        else {
            navigationController!.popViewController(animated: true)
        }
    }
    
    // MARK: Navigation
    
    // ovo isto napravi, onaj alert da ti iskoci kad nema broja telefonA, jednostavno je pravo
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard contactNumber.text!.isEmpty else {
            contact = Contact(name:contactName.text, phoneNumber: contactNumber.text!)
            return true
        }
        
        let alertController = UIAlertController(title: "Pažnja", message: "Obavezno je unijeti broj telefona", preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
        return false
    }
    
    
   func addingNewContact() {
     
            contact = Contact(name:contactName.text, phoneNumber: contactNumber.text!)
        }

}
