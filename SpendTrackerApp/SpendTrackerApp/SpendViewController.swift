//
//  SpendViewController.swift
//  SpendTrackerApp
//
//  Created by Merima on 9/6/16.
//  Copyright © 2016 Merima. All rights reserved.
//

import UIKit

class SpendViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var amountTextField: UITextField!

    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var selectedDate: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var expense : SpendTracker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultDate()
        // Do any additional setup after loading the view, typically from a nib.
        amountTextField.delegate = self
        descriptionTextField.delegate = self
        
        // Set up views if editing an existing Expense.
        if let exspense = expense {
            navigationItem.title = expense?.date
            amountTextField.text   = expense?.amount
            descriptionTextField.text = expense?.desc
            selectedDate.text = expense?.date
        }
        // Enable the Save button only if the text field has a valid SpendTracker name.
        checkValidMealName()    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.enabled = false
    }
    
    func checkValidMealName() {
        // Disable the Save button if the text field is empty.
        let text = amountTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        //amountTextField.text = amountTextField.text
        //descriptionTextField.text = descriptionTextField.text
        checkValidMealName()
        /*navigationItem.title = textField.text  */  }
    // MARK: Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddExpenseMode = presentingViewController is UINavigationController
        
        if isPresentingInAddExpenseMode {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true)
        }    }
    
    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let amount = amountTextField.text
            let desc = descriptionTextField.text
            let date = selectedDate.text
            // Set the expense to be passed to SpendTableViewController after the unwind segue.
            expense = SpendTracker(amount: amount!, desc: desc!, date: date!)        }
    }
    // Mark: Action
    
    @IBAction func datePickerAction(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        self.selectedDate.text = strDate
    }
    func setDefaultDate (){
        let today = NSDateFormatter()
        today.dateFormat = "dd.MM.yyyy"
        let todaysDate = today.stringFromDate(NSDate())
        self.selectedDate.text = todaysDate
    }
}
