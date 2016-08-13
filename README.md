FCAlertView
============

FCAlertView is a Flat Customizable AlertView, written in Objective C 

[![CI Status](http://img.shields.io/travis/Nima Tahami/FCAlertView.svg?style=flat)](https://travis-ci.org/Nima Tahami/FCAlertView)
[![Version](https://img.shields.io/cocoapods/v/FCAlertView.svg?style=flat)](http://cocoapods.org/pods/FCAlertView)
[![License](https://img.shields.io/cocoapods/l/FCAlertView.svg?style=flat)](http://cocoapods.org/pods/FCAlertView)
[![Platform](https://img.shields.io/cocoapods/p/FCAlertView.svg?style=flat)](http://cocoapods.org/pods/FCAlertView)

![BackgroundImage](https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot.png)_
![BackgroundImage](https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot2.png) 
![BackgroundImage](https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot3.png)_ 
![BackgroundImage](https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot4.png) 
![BackgroundImage](https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot5.png)_

Installation
------------

### Using CocoaPods

FCAlertView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FCAlertView'
```

### Manually

Simply drag ```FCAlertView.m``` and ```FCAlertView.h``` to your Xcode project.

Adding FCAlertView
------------------

Start by adding the following to your desired View Controller:

```Objective-C
#import "FCAlertView.h"
```

### Presenting an FCAlertView

```Objective-C
	FCAlertView *alert = [[FCAlertView alloc] init];
	
    [alert showAlertInView:self
                 withTitle:@"Alert Title"
              withSubtitle:@"This is your alert's subtitle. Keep it short and concise. 😜👌"
           withCustomImage:nil
       withDoneButtonTitle:nil
                andButtons:nil];

```

## Base Customizations 

- **Title (NSString):** You can leave the Title as ```nil``` or Give it an ```NSString```.

- **Subtitle (NSString):** FCAlertView always requires a subtitle, even if you want just a few words, add it here instead of the title (then leave the title as nil). *Take a look at Screenshot 2 for an example*.

-  **CustomImage (UIImage):** You can leave this image as ```nil``` or Give it a ```UIImage``` which will show at the top of the alert. *Take a look at Screenshot 3 for an example*.

- **DoneButtonTitle (NSString):** You can leave this as ```nil``` to show "Ok" as the dismiss button for the AlertView, or Give it an ```NSString```.

- **Buttons (NSArray of NSStrings):** If you want to add buttons to your alert, simply add an array of 1 or 2 button titles as ```NSString``` here, anything more will be ignored as 2 is the max custom buttons you can add (aside from the done button). Read more about buttons and actions further down.

## Extra Customizations 

This section includes all the tiny details that you can customize your alert with, which makes FCAlertView very customizable. Or leave it as is and enjoy the simplicity. 

### Color Scheme

By default, FCAlertView doesn't include a color scheme, much like UIAlertView, but you can add one by adding this line:

```Objective-C
alert.colorScheme = [UIColor colorWithRed:150.0f/255.0f green:150.0f/255.0f blue:150.0f/255.0f alpha:1.0];
```

FCAlertView also comes with a set of pre-made colors that you can use:

![alt text](https://github.com/nimati/FCAlertView/blob/master/Images/FlatColors.png?raw=true "Flat Colors")

#####*Credit goes to [flatuicolors.com](http://flatuicolors.com) for the Beautiful Palette of Flat Colors*

Simply choose the color you'd like to use for your AlertView, and add:

```Objective-C
alert.colorScheme = alert.flatBlue; // Replace "Blue" with your preferred color from the image above
```

### Alert Types

FCAlertView comes with 3 pre-designed custom alert types. Success, Caution, or Warning, simply add the one line after initializing FCAlertView.

#### Success

```Objective-C
[alert makeAlertTypeSuccess];
```

#### Caution

```Objective-C
[alert makeAlertTypeCaution];
```

#### Warning

```Objective-C
[alert makeAlertTypeWarning];
```

### Dismissing FCAlertView

There are multiple ways you can dismiss an FCAlertView

#### Close on Outside Touch 

When the user taps anywhere outside the alert, you can dismiss it by adding this line:

```Objective-C
alert.dismissOnOutsideTouch = YES;
```

#### Auto-Close the Alert

Dismiss the AlertView when a certain time has elapsed after the AlertView is presented, by adding this line:

```Objective-C
alert.autoHideSeconds = 5; //Change 5 to number of Seconds you'd like the view to appear for before dismissing itself
```

#### Done Button or Any Custom Buttons

All Buttons including the Done/Dismiss Button will make the FCAlertView dismiss.

#### Dismissing it yourself

If you'd like to dismiss the AlertView yourself, simply add the following line to where you need it:

```Objective-C
[alert dismissAlertView];
```

### Hiding Done/Dismiss Button

If you'd like to have no buttons on your AlertView (to simply display a notification or approval of something) or you want all your buttons to be a custom one which you've added yourself. Simply hide the Done buttons by adding this line:

```Objective-C
alert.hideDoneButton = YES;
```

### Hiding All Buttons

If you'd like to simply hide all buttons from your alert, you can do so by adding this line:

```Objective-C
alert.hideAllButtons = YES;
```

## Button Actions

To add actions to your buttons, you have to first delegate your FCAlertView with your view, and then add a helper method which will detect button touches. Here's how you can add an alert with buttons and perform actions:

First add ```FCAlertViewDelegate``` to your View Controller's @interface as such:

```Objective-C
#import <UIKit/UIKit.h>
#import "FCAlertView.h"

@interface ViewController : UIViewController <FCAlertViewDelegate>

@end
```

Now add your FCAlertView with Buttons where you need to present it:

```Objective-C
	FCAlertView *alert = [[FCAlertView alloc] init];
	
	alert.delegate = self;

    [alert showAlertInView:self
                 withTitle:@"Alert Title"
              withSubtitle:@"This is your alert's subtitle. Keep it short and concise. 😜👌"
           withCustomImage:nil
       withDoneButtonTitle:nil
                andButtons:@[@"Button 1", @"Button 2"]];

```

After adding your FCAlertView, you can detect button touches by adding this method to your class:

```Objective-C
- (void) FCAlertView:(FCAlertView *)alertView clickedButtonIndex:(NSInteger)index buttonTitle:(NSString *)title {
    if ([title isEqualToString:@"Button 1"]) {
        // Perform Action for Button 1
    }
    
    if ([title isEqualToString:@"Button 2"]) {
        // Perform Action for Button 2
    }
}
```

#### Done Button Method

If you'd also like to detect button touch for the Done/Dismiss button, simply add this method to your class:

```Objective-C
- (void)FCAlertDoneButtonClicked:(FCAlertView *)alertView {
	// Done Button was Pressed, Perform the Action you'd like here.
}
```

## Other Helper Methods

### Detect when FCAlertView has been dismissed

```Objective-C
- (void)FCAlertViewDismissed:(FCAlertView *)alertView {
	// Your FCAlertView was Dismissed, Perform the Action you'd like here.
}
```

### Detect when FCAlertView is about to present

```Objective-C
- (void)FCAlertViewWillAppear:(FCAlertView *)alertView {	
	// Your FCAlertView will be Presented, Perform the Action you'd like here.
}
```

## More Customizations

FCAlertView is an ongoing project with the goal of becoming the number 1 used custom AlertView for iOS. Improvements and changes are on the way, and here are some of the things that are coming soon to it:

- Adding TextFields
- More Custom Animations
- Blur Background 
- Alert Sounds 
- Big and Beautiful Full Screen Alerts
- Landscape Orientation
- Frame Customizations
- More Types of Alerts (including Progress Types)
- iPad Friendly Alerts
- Send in your suggestion [here](mailto:nimat6462@yahoo.ca)

About FCAlertView
-----------------

FCAlertView is a fully customizable and beautifully designed AlertView. I designed FCAlertView beacuse I've always wanted to have access to change the different attributes of the default AlertView. Design wise, FCAlertView is similar looking to the default AlertView, however, as you start customizing it for your specific need, you realize it can do a lot more and look very flat and nice. FCAlertView lets you do things such as specify the number of buttons, the color scheme of the view, adding a small image to it, hide the view after a certain time, and more. A full description of how to customize FCAlertView to fit your alert can be found on http://github.com/nimati/FCAlertView

### Author

Created and designed by Nima Tahami

### License

FCAlertView is available under the MIT license. See the LICENSE file for more info.
