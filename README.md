# TGShakeToFeedback
Library which opens mail composer upong shake gesture. It will prompt with current app screen where user performed the guesture & attach it.


Pod
------
```swift
pod 'TGShakeToFeedback'
```

Requirements
------
```swift
* iOS 8+
* Swift 3+
```

Usage
------

From your any ```ViewController``` customise ```mailData``` &amp; ```feedbackData```
e.g.
```swift
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    mailData.toRecipients = ["testuser@testdomain.com"]
    mailData.bodyAsAttachment = true //If true the message will be sent as an attachment instead of an email body
    feedbackData.message = "This feedback loaded from ViewController class. Do you want to proceed?"
}
```

Below variables are available for customization. If you don't set anything, the default values will be considered.

For ```mailData``` variable (```MailData``` struct)
* mailNotAvailableText
* subject
* body
* isHTML
* toRecipients
* ccRecipients
* bccRecipients
* bodyAsAttachment


For ```feedbackData``` variable (```FeedbackData``` struct)
* title
* message
* cancelButtonTitle
* defaultButtonTitle

In case you don't want to attach a screenshot, and open only mail composer; you can call ```showMailVC``` function directly

Screenshots
------
|![1](https://github.com/imthegiga/TGShakeToFeedback/blob/master/Screenshots/1.PNG)|![2](https://github.com/imthegiga/TGShakeToFeedback/blob/master/Screenshots/2.PNG)|![3](https://github.com/imthegiga/TGShakeToFeedback/blob/master/Screenshots/3.PNG)|
|:---:|:---:|:---:|


Contact
------
* Email: abhisheksalokhe@gmail.com
* LinkedIn: www.linkedin.com/in/imthegiga
* Twitter: [@imthegiga](https://twitter.com/imthegiga)

Feel free to connect if you need any help :smiley:
