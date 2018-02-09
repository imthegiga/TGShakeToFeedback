//
//  ShakeToFeedback.swift
//  TGShakeToFeedback
//
//  Created by Abhishek Salokhe on 09/02/2018.
//  Copyright © 2018 Abhishek Salokhe. All rights reserved.
//

import Foundation
import MessageUI
import AudioToolbox

struct MailData {
    
    var mailNotAvailableText = "Sorry seems you device does not support Mail feature"
    var subject = "iOS Mobile App Feedback or Report"
    var body = "I detected issue in the app. Attached the screen for reference."
    var isHTML = false
    var toRecipients = [""]
    var ccRecipients = [""]
    var bccRecipients = [""]
}

struct FeedbackData {
    
    var title = "Feedback"
    var message = "Do you want to report an issue? it will help us to improve"
    var cancelButtonTitle = "Cancel"
    var defaultButtonTitle = "Yes"
}

protocol PropertyStoring {
    
    associatedtype U
    associatedtype V
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: U) -> U
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: V) -> V
}

extension PropertyStoring {
    
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: U) -> U {
        guard let value = objc_getAssociatedObject(self, key) as? U else {
            return defaultValue
        }
        return value
    }
    func getAssociatedObject(_ key: UnsafeRawPointer!, defaultValue: V) -> V {
        guard let value = objc_getAssociatedObject(self, key) as? V else {
            return defaultValue
        }
        return value
    }
}

extension UIViewController: MFMailComposeViewControllerDelegate, PropertyStoring {
    
    internal typealias U = MailData
    internal typealias V = FeedbackData
    fileprivate struct MailProperty {
        static var mailData = MailData.init()
    }
    fileprivate struct FeedbackProperty {
        static var feedbackData = FeedbackData.init()
    }
    var mailData: MailData {
        get { return getAssociatedObject(&MailProperty.mailData, defaultValue: MailProperty.mailData) }
        set { return objc_setAssociatedObject(self, &MailProperty.mailData, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
    var feedbackData: FeedbackData {
        get { return getAssociatedObject(&FeedbackProperty.feedbackData, defaultValue: FeedbackProperty.feedbackData) }
        set { return objc_setAssociatedObject(self, &FeedbackProperty.feedbackData, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
    
    open override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if(AppDelegate.shared().shouldShowPopup) {
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                showReportAlert()
                AppDelegate.shared().toggleStatus()
            }
        }
    }
    
    fileprivate func showMailVC(screenshort:UIImage? = nil) {
        let mailComposeViewController = configuredMailComposeViewController()
        if let image = screenshort {
            mailComposeViewController.addAttachmentData(UIImageJPEGRepresentation(image, 1.0)!, mimeType: "image/jpeg", fileName:  "attachment.jpeg")
        }
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showAlert(withMessage: mailData.mailNotAvailableText)
        }
    }
    
    private func showAlert(withMessage message: String) {
        
        let alert = UIAlertController.init(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (action:UIAlertAction) in
            AppDelegate.shared().toggleStatus()
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func configuredMailComposeViewController() -> MFMailComposeViewController {
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(mailData.toRecipients)
        mailComposerVC.setCcRecipients(mailData.ccRecipients)
        mailComposerVC.setBccRecipients(mailData.bccRecipients)
        mailComposerVC.setSubject(mailData.subject)
        mailComposerVC.setMessageBody(mailData.body, isHTML: mailData.isHTML)
        
        return mailComposerVC
    }
    
    fileprivate func showReportAlert() {
        
        let alert = UIAlertController.init(title: feedbackData.title, message: feedbackData.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: feedbackData.cancelButtonTitle, style: .cancel, handler: { (action:UIAlertAction) in
            AppDelegate.shared().toggleStatus()
        }))
        alert.addAction(UIAlertAction.init(title: feedbackData.defaultButtonTitle, style: .default, handler: { (action:UIAlertAction) in
            self.showMailVC(screenshort: self.getFullScreenshot())
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    fileprivate func getFullScreenshot() -> UIImage {
        
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        layer.render(in:UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return screenshot!
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    open func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        AppDelegate.shared().toggleStatus()
        controller.dismiss(animated: true, completion: nil)
    }
}
