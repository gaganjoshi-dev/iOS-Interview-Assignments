//
//  ViewController.swift
//  CodingTest
//
//  Created by Gagan joshi on 11/05/17.
//  Copyright © 2017 Gagan joshi. All rights reserved.
//

import UIKit

/*
 
 Create an app which would take dates as  inputs from 3 TextField in DD/MM/YYYY Format
 When you click on a button rearrange the date in ascending order in the text fields
 on clicking it again rearrange them in decending order
 On completion of the sorting show a message if the order is ascending or descending.
 Please provide unit tests and error handling when input values are invalid.
 */

class ViewController: UIViewController  {

    @IBAction func valueChanged(_ sender: Any) {
        
        print(datePicker.date);
        
        
    }
    @IBAction func rearrangeDate(_ sender: Any) {
    }
    @IBAction func submitDate(_ sender: Any) {
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textFieldSecond: UITextField!
    @IBOutlet weak var textFieldFirst: UITextField!
    @IBOutlet weak var textFieldThird: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let datePickerView  : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = .date
        textFieldFirst.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector(("handleDatePicker")), for: .valueChanged)
        
        
        
        
        
        
        textFieldSecond.inputView = datePickerView;
        textFieldThird.inputView = datePickerView;

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

func handleDatePicker(_ sender : UITextView)
{
  
}

