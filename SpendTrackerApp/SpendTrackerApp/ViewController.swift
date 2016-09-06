//
//  ViewController.swift
//  SpendTrackerApp
//
//  Created by Merima on 9/6/16.
//  Copyright © 2016 Merima. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var amountTextField: UITextField!

    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var selectedDate: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefaultDate()
        // Do any additional setup after loading the view, typically from a nib.
        amountTextField.delegate = self
        descriptionTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(textField: UITextField) {
        amountTextField.text = amountTextField.text
        descriptionTextField.text = descriptionTextField.text
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
