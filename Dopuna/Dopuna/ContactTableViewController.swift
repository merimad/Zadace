//
//  ContactTableViewController.swift
//  Dopuna
//
//  Created by Merima on 9/21/16.
//  Copyright © 2016 Merima & Ena. All rights reserved.
//

import UIKit


protocol ContactTableViewDelegate {
    func didPressCellWithTitle(_ contact: Contact)
    
}  // ovaj protokol ti treba isto, t ce ti prenijeti celiju selektovanuj , OK dalje je ovo

class ContactTableViewController: UITableViewController {
    // MARK: Properties
    
    var delegate: ContactTableViewDelegate?
    var contacts = [Contact]()
    var selectedContact: Contact? {   // ovo ti treba za taj odabrani kontakt
        didSet {
            if let contact = selectedContact {
                selectedContactIndex = contacts.index(of: contact)!
            }
        }
    }
    var selectedContactIndex: Int? // ovaj index da ti zna index tog odabranog kontakta, u onom index path
    //jesi da ti otvori listu kontakata, ovo gore sve nek ti je isto, to samnasla na netu, OK. STA DALJE

    @IBOutlet weak var selectedContactCell: ContactTableViewCell!
    @IBOutlet weak var editContactButton: UIBarButtonItem!
   /* @IBOutlet weak var editContactButton: UIBarButtonItem! */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedContacts = loadContacts() {
            contacts += savedContacts
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ContactTableViewCell
        let contact = contacts[(indexPath as NSIndexPath).row]
       
        cell.contactNameLabel.text = contact.name
        cell.contactNumberLabel.text = "+387" + contact.phoneNumber
        
        if cell.contactNameLabel.text == "" {
            cell.contactNameLabel.text = "+387" + contact.phoneNumber
            cell.contactNumberLabel.text = ""
        }
        //ovo imam, tj ovo je kad dodaje novi? jeste
        
        cell.contactNumberLabel.textColor = UIColor.gray
        cell.contactNameLabel.textColor = UIColor(red:33/255, green: 129/255, blue: 112/255, alpha: 1)
       
        
        if (indexPath as NSIndexPath).row == selectedContactIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
      //ovo ako stignem
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        
            if let index = selectedContactIndex {
                let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
                cell?.accessoryType = .none
            }
            
            selectedContact = contacts[(indexPath as NSIndexPath).row]
            
            
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
        
            delegate?.didPressCellWithTitle((selectedContact)!)  // odavde saljes kontakt u onu tamo tj.,  u main, OK
        
            _ = self.navigationController?.popViewController(animated: true)  // ovo da se smakne, OK
        
        
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            contacts.remove(at: (indexPath as NSIndexPath).row)
            saveContacts()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
  

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let contactDetailViewController = segue.destination as! ViewController
            // Get the cell that generated this segue.
            if let selectedContactCell = sender as? ContactTableViewCell {
                let indexPath = tableView.indexPath(for: selectedContactCell)!
                let selectedContact = contacts[(indexPath as NSIndexPath).row]
                contactDetailViewController.contact = selectedContact
            }
        }
    }
 // MARK: Action
    
    
    @IBAction func editContact(_ sender: UIBarButtonItem) {
        if (self.tableView.isEditing) {
            editContactButton.title = "Trash"
            self.tableView.setEditing(false, animated: true)
        } else {
            editContactButton.title = "Done"
            self.tableView.setEditing(true, animated: true)
        }    }
  
    
    @IBAction func unwindToContactList(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController, let contact = sourceViewController.contact {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing contact.
                contacts[(selectedIndexPath as NSIndexPath).row] = contact
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                // Add a new contact.
                let newIndexPath = IndexPath(row: contacts.count, section: 0)
                contacts.append(contact)
                tableView.insertRows(at: [newIndexPath], with: .bottom)
                
            }
            saveContacts()
        }
    }
    func saveContacts () {
        
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(contacts, toFile: Contact.ArchiveURL.path)
        if !isSuccessfulSave {
            print("Failed to save contacts...")
        }
    }
    
    func loadContacts() -> [Contact]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Contact.ArchiveURL.path) as? [Contact]
    }
}
