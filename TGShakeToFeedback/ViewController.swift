//
//  ViewController.swift
//  TGShakeToFeedback
//
//  Created by Abhishek Salokhe on 09/02/2018.
//  Copyright © 2018 Abhishek Salokhe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mailData.toRecipients = ["testuser@testdomain.com"]
        mailData.bodyAsAttachment = true //If true the message will be sent as an attachment instead of an email body
        feedbackData.message = "This feedback loaded from ViewController class. Do you want to proceed?"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

