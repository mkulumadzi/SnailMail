//
//  ChooseDeliveryOptionsViewController.swift
//  Slowpost
//
//  Created by Evan Waters on 8/31/15.
//  Copyright (c) 2015 Evan Waters. All rights reserved.
//

import UIKit

class ChooseDeliveryOptionsViewController: UIViewController {
    
    var toPerson:Person!
    var cardImage:UIImage!
    var content:String!
    var scheduledToArrive:NSDate?
    
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var composeText: UITextView!
    
    @IBOutlet weak var standardButton: TextUIButton!
    @IBOutlet weak var expressButton: TextUIButton!
    @IBOutlet weak var customButton: TextUIButton!
    
    @IBOutlet weak var buttonHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        toLabel.text = toPerson.name
        
        if cardImage != nil {
            imagePreview.image = cardImage
        }
        
        if content != nil {
            composeText.text = content
        }
        
        composeText.addTopBorder()
        composeText.font = UIFont(name: "Opensans-Regular", size: 17)
        
        standardButton.layer.cornerRadius = 5
        expressButton.layer.cornerRadius = 5
        customButton.layer.cornerRadius = 5

        if deviceType == "iPhone 4S" {
            formatForiPhone4S()
        }
        
    }
    
    func formatForiPhone4S() {
        buttonHeight.constant = 30
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func standardDeliveryChosen(sender: AnyObject) {
        self.performSegueWithIdentifier("sendMail", sender: nil)
    }
    
    @IBAction func expressDeliveryChosen(sender: AnyObject) {
        let calendar = NSCalendar.currentCalendar()
        let date = calendar.dateByAddingUnit(.CalendarUnitMinute, value: 10, toDate: NSDate(), options: nil)
        scheduledToArrive = date!
        self.performSegueWithIdentifier("sendMail", sender: nil)
    }
    
    @IBAction func customDeliveryChosen(sender: AnyObject) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "sendMail" {
            let sendingViewController = segue.destinationViewController as? SendingViewController
            sendingViewController!.username = toPerson.username
            sendingViewController!.image = imagePreview.image
            sendingViewController!.content = composeText.text
            
            if scheduledToArrive != nil {
                sendingViewController!.scheduledToArrive = scheduledToArrive!
            }
        }
        
    }
    
    

}
