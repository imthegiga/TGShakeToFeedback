# TGShareToFeedback
Library which opens mail composer upong shake gesture. It will prompt with current app screen where user performed the guesture & attach it.


Pod
------
```swift
pod 'TGShakeToFeedback'
```


Usage
------

From your any ViewController customise mailData &amp; feedbackData
e.g.

1. Set mailData properties like mailData.toRecipients = ["user@domain.com"] 
2. feedbackData properties like feedbackData.message = "This feedback loaded from ViewController class. Do you want to proceed?"


Below variables are available for customization

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
