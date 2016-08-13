FCAlertView
============

FCAlertView is a Flat Customizable AlertView, written in Objective C 

[![CI Status](http://img.shields.io/travis/Nima Tahami/FCAlertView.svg?style=flat)](https://travis-ci.org/Nima Tahami/FCAlertView)
[![Version](https://img.shields.io/cocoapods/v/FCAlertView.svg?style=flat)](http://cocoapods.org/pods/FCAlertView)
[![License](https://img.shields.io/cocoapods/l/FCAlertView.svg?style=flat)](http://cocoapods.org/pods/FCAlertView)
[![Platform](https://img.shields.io/cocoapods/p/FCAlertView.svg?style=flat)](http://cocoapods.org/pods/FCAlertView)

Requirements
------------

iOS 8.0+

Installation
------------

### Using CocoaPods

FCAlertView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FCAlertView', '~> 0.0.9'
```

### Manually

Simply drag FCAlertView.m and FCAlertView.h to your Xcode project.

Adding FCAlertView
------------------

Add the following to your desired View Controller:

```Objective-C
#import "FCAlertView.h"
```

## Presenting an FCAlertView

```Objective-C
	FCAlertView *alert = [[FCAlertView alloc] init];
	
    [alert showAlertInView:self
                 withTitle:@"Alert Title"
              withSubtitle:@"This is my alert's subtitle. Keep it short and concise. 😜👌"
           withCustomImage:nil
       withDoneButtonTitle:nil
                andButtons:nil];

```

## Alert Types

### Success

```Objective-C
	[alert makeAlertTypeSuccess];
```

### Caution

```Objective-C
	[alert makeAlertTypeCaution];
```

### Warning

```Objective-C
	[alert makeAlertTypeWarning];
```


About FCAlertView
-----------------

FCAlertView is a fully customizable and beautifully designed AlertView. I designed FCAlertView beacuse I've always wanted to have access to change the different attributes of the default AlertView. Design wise, FCAlertView is similar looking to the default AlertView, however, as you start customizing it for your specific need, you realize it can do a lot more and look very flat and nice. FCAlertView lets you do things such as specify the number of buttons, the color scheme of the view, adding a small image to it, hide the view after a certain time, and more. A full description of how to customize FCAlertView to fit your alert can be found on http://github.com/nimati/FCAlertView
## Author

Nima Tahami

## License

FCAlertView is available under the MIT license. See the LICENSE file for more info.
