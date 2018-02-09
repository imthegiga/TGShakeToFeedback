# TGShareToFeedback
Library which opens mail composer upong shake gesture. It will prompt with current app screen where user performed the guesture & attach it.


Pod
------
```swift
pod 'TGShakeToFeedback'
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


For ```feedbackData``` variable (```FeedbackData``` struct)
* title
* message
* cancelButtonTitle
* defaultButtonTitle


Enjoy :smiley:
