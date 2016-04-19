//
//  ViewController.swift
//  SendingEmailDemo
//
//  Created by Jovanny Espinal on 4/18/16.
//  Copyright © 2016 Jovanny Espinal. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {
    
    @IBAction func sendEmail()
    {
        let mailComposerVC = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposerVC, animated: true, completion: nil)
        } else {
            print("fail")
        }
    }
   
}

//MARK: MFMailComposeViewController Methods
extension ViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController
    {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["espinaljovanny@icloud.com"])
        mailComposerVC.setMessageBody("<p>Whoa, I'm sending you an email from my iPhone app</p>", isHTML: true)
        
        return mailComposerVC
    }
    
}

