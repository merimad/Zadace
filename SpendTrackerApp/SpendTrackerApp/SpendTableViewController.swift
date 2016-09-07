//
//  SpendTableViewController.swift
//  SpendTrackerApp
//
//  Created by Merima on 9/7/16.
//  Copyright © 2016 Merima. All rights reserved.
//

import UIKit

class SpendTableViewController: UITableViewController {
    // MARK: Properties
    var expenses = [SpendTracker]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem()
            // Load any saved expense, otherwise load sample data.
        if let savedExpenses = loadExpenses() {
            expenses += savedExpenses
        }        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return expenses.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "SpendTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SpendTableViewCell
        // Fetches the appropriate expense for the data source layout.
        let expense = expenses[indexPath.row]
        cell.amountLabel.text = expense.amount
        cell.descriptionLabel.text = expense.desc
        cell.dateLabel.text = expense.date

        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            expenses.removeAtIndex(indexPath.row)
            saveExpenses()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let spendDetailViewController = segue.destinationViewController as! SpendViewController
            // Get the cell that generated this segue.
            if let selectedSpendCell = sender as? SpendTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedSpendCell)!
                let selectedSpend = expenses[indexPath.row]
                spendDetailViewController.expense = selectedSpend            }        }
        else if segue.identifier == "AddItem" {
            print("Adding new expense.")        }
    }
 
    
    @IBAction func unwindToExpenseList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? SpendViewController, expense = sourceViewController.expense { if let selectedIndexPath = tableView.indexPathForSelectedRow {
            // Update an existing expense.
            expenses[selectedIndexPath.row] = expense
            tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)            }
            else {
            // Add a new expense.
            let newIndexPath = NSIndexPath(forRow: expenses.count, inSection: 0)
            expenses.append(expense)
            tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom) }
        saveExpenses()
        }
    }
    // MARK: NSCoding
    func saveExpenses() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(expenses, toFile: SpendTracker.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save expenses...")
        }    }
    func loadExpenses() -> [SpendTracker]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(SpendTracker.ArchiveURL.path!) as? [SpendTracker]    }}
