FCAlertView
============

FCAlertView is a Flat Customizable AlertView, written in Objective C 

[![CI Status](http://img.shields.io/travis/Nima Tahami/FCAlertView.svg?style=flat)](https://travis-ci.org/Nima Tahami/FCAlertView)
[![Version](https://img.shields.io/cocoapods/v/FCAlertView.svg?style=flat)](http://cocoapods.org/pods/FCAlertView)
[![License](https://img.shields.io/cocoapods/l/FCAlertView.svg?style=flat)](http://cocoapods.org/pods/FCAlertView)
[![Platform](https://img.shields.io/cocoapods/p/FCAlertView.svg?style=flat)](http://cocoapods.org/pods/FCAlertView)

![Logo](https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/RepoLogo2.png)

![BackgroundImage](https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot.png)
![BackgroundImage](https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot2.png) 
![BackgroundImage](https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot3.png) 
![BackgroundImage](https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot4.png) 
![BackgroundImage](https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot5.png)
![BackgroundImage](https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot6.png)

## Quick Links

[1. Swift](https://github.com/nimati/FCAlertView#swift)<br />
[2. Installation](https://github.com/nimati/FCAlertView#installation)<br />
[3. Example App](https://github.com/nimati/FCAlertView#example)<br />
[4. Adding FCAlertView](https://github.com/nimati/FCAlertView#adding-fcalertview)<br />
[5. Base Customizations](https://github.com/nimati/FCAlertView#base-customizations)<br />
[6. Extra Customizations](https://github.com/nimati/FCAlertView#extra-customizations)<br />
[7. New Customizations (after V1.1.0)](https://github.com/nimati/FCAlertView#new-customizations-after-v110)<br />
[8. Animations](https://github.com/nimati/FCAlertView#animations)<br />
[9. Adding TextFields](https://github.com/nimati/FCAlertView#adding-textfields)<br />
[10. Button Actions](https://github.com/nimati/FCAlertView#button-actions)<br />
[11. Other Helper Methods](https://github.com/nimati/FCAlertView#other-helper-methods)<br />

##Swift

For the swift version of FCAlertView, [Click Here](https://github.com/k9101/FCAlertView). Credits to [Kris Penney](https://github.com/k9101) for writing the swift library.

##Installation

### Using CocoaPods

FCAlertView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FCAlertView'
```

### Manually

Clone or Download this Repo. Then simply drag the folder ```FCAlertView``` to your Xcode project. Please make sure to drag the whole folder, which includes assets needed for some alert types.

## Example

FCAlertView comes with an example app that you can use to try out all of the customizations below. It's recommended that you go through all of the docs before using the example app. To use the example app, clone or download FCAlertView, open and run ```Example/FCAlertView.xcworkspace```.

## Adding FCAlertView

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

### Showing Options

You can also present your FCAlertView using the following:

#### By Selecting a specific UIWindow

```Objective-C
[alert showAlertInWidnow:self.view.window
             withTitle:@"Alert Title"
          withSubtitle:@"This is your alert's subtitle. Keep it short and concise. 😜👌"
       withCustomImage:nil
   withDoneButtonTitle:nil
            andButtons:nil];
```            

#### Using UIApplication Window

This method will also bring your alert to the front so that keyboard or any other element don't cover it.

```Objective-C
[alert showAlertWithTitle:@"Alert Title"
          withSubtitle:@"This is your alert's subtitle. Keep it short and concise. 😜👌"
       withCustomImage:nil
   withDoneButtonTitle:nil
            andButtons:nil];
```    

## Base Customizations 

- **Title (NSString):** You can leave the Title as ```nil``` or Give it an ```NSString```.

- **Subtitle (NSString):** FCAlertView always requires a subtitle, even if you want just a few words, add it here instead of the title (then leave the title as nil). *Take a look at [this screenshot for an example](https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot2.png)*.

-  **CustomImage (UIImage):** You can leave this image as ```nil``` or Give it a ```UIImage``` which will show at the top of the alert. *Take a look at [this screenshot for an example](https://github.com/nimati/FCAlertView/blob/master/Images/ScreenShots/ScreenShot4.png) for an example*. 

- **DoneButtonTitle (NSString):** You can leave this as ```nil``` to show "Ok" as the dismiss button for the AlertView, or Give it an ```NSString```.

- **Buttons (NSArray of NSStrings):** If you want to add buttons to your alert, simply add an array of 1 or 2 button titles as ```NSString``` here, anything more will be ignored as 2 is the max custom buttons you can add (aside from the done button). Read more about buttons and actions further down.

### Adding Buttons With Action Blocks

Alternatively, you can add buttons to FCAlertView with action block like so:

```Objective-C
[alert addButton:@"Button" withActionBlock:^{
    // Put your action here
}];
```

### Action Block for Done Button

```Objective-C
[alert doneActionBlock:^{ 
    // Put your action here
}];
```

## Extra Customizations 

This section includes all the tiny details that you can customize your alert with, which makes FCAlertView very customizable. Or leave it as is and enjoy the simplicity. 

### Color Scheme

By default, FCAlertView doesn't include a color scheme, much like UIAlertView, but you can add one by adding this line:

```Objective-C
alert.colorScheme = [UIColor colorWithRed:150.0f/255.0f green:150.0f/255.0f blue:150.0f/255.0f alpha:1.0];
```

If you add a custom image to your alert, it will be tinted with the color scheme by default. To keep this from happening, add this:

```Objective-C
alert.avoidCustomImageTint = YES; // Off by default
```

FCAlertView also comes with a set of pre-made colors that you can use:

![alt text](https://github.com/nimati/FCAlertView/blob/master/Images/FlatColors.png?raw=true "Flat Colors")

#####*Credit goes to [flatuicolors.com](http://flatuicolors.com) for the Beautiful Palette of Flat Colors*

Simply choose the color you'd like to use for your AlertView, and add:

```Objective-C
alert.colorScheme = alert.flatBlue; // Replace "Blue" with your preferred color from the image above
```

#### Dark Mode

Use this line to apply a beautiful dark theme to your FCAlert:

```Objective-C
alert.darkTheme = YES;
```

#### Title and Subtitle Colors

Change Title Color by Adding

```Objective-C
alert.titleColor = alertView.flatPurple;
```

Change SubTitle Color by Adding

```Objective-C
alert.subTitleColor = alertView.flatBlue;
```

#### Button Colors

Change Title Color of Buttons

```Objective-C
alert.firstButtonTitleColor = [UIColor blueColor];
alert.secondButtonTitleColor = [UIColor blueColor];
```

Change Background Color of Buttons

```Objective-C
alert.firstButtonBackgroundColor = [UIColor whiteColor];
alert.secondButtonBackgroundColor = [UIColor blackColor];
```

### Rounded Corners

Change the Rounding of the FCAlertView's corners as desired using:

```Objective-C
alert.cornerRadius = 4; // Replace 4 with your desired corner radius amount (Set to 0.1 if you don't want rounding)

```

### Alert Types

FCAlertView comes with 6 pre-designed alert types: Success, Caution, Warning, Progress, Rating with Hearts, or Rating with Stars, simply add the one line after initializing FCAlertView.

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

#### Progress

```Objective-C
[alert makeAlertTypeProgress];
```

#### Rating with Hearts

Turns your alert into a rating alert to allow users to rate using hearts.

```Objective-C
[alert makeAlertTypeRateHearts:^(NSInteger rating) {
    NSLog(@"Your Hearts Rating: %ld", (long)rating); // Use the Rating as you'd like
}];
```

#### Rating with Stars

Turns your alert into a rating alert to allow users to rate using stars.

```Objective-C
[alert makeAlertTypeRateStars:^(NSInteger rating) {
    NSLog(@"Your Stars Rating: %ld", (long)rating); // Use the Rating as you'd like
}];
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
alert.autoHideSeconds = 5; // Replace 5 with the number of Seconds you'd like the view to appear for before dismissing itself
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

Please note that hiding Done/Dismiss Button and/or Hiding All Buttons would trigger a safety close mechanism by forcing Close on Outside Touch to stay ON.

## New Customizations (after V1.1.0)

### Blur Background

Simply adds a blur to the background of the window/view behind the alertview:

```Objective-C
alert.blurBackground = YES;
```

### Round Buttons

If you prefer the buttons to be detached from the box of the alert and look more round, use:

```Objective-C
alert.detachButtons = YES;
```

### Full Circle Custom Image

If you prefer the custom image for you alert to be full width of the image circle, use:

```Objective-C
alert.fullCircleCustomImage = YES;
```

### Custom Image Scaling

If you prefer the custom image for you alert to be scaled up or down to a certain size, use:

```Objective-C
alert.customImageScale = 1.5; // Change 1.5 to how big or small you want to scale your custom alert image ranged from 0 to 2
```

### Hiding Separator Lines

To hide the separator lines that appear between the done and custom buttons of the alert, add:

```Objective-C
alert.hideSeparatorLineView = YES;
```

### Sounds

Add the following line to play an audio when the alert opens, simply pass it the name of your audiofile:

```Objective-C
[alert setAlertSoundWithFileName:@"Ding.mp3"];
```

**Note:** Add these Frameworks to your project for this to work: ```AVFoundation``` and ```AudioToolbox```.

## Animations

### Bounce/Natural Animations

Adds more natural animations to the alertview, such as reactive bounce buttons and more. Add this line:

```Objective-C
alert.bounceAnimations = YES;
```

### Animating Alert Into View

Have the alert animate in from different directions when presented, instead of the default appear animation.

```Objective-C
alert.animateAlertInFromTop = YES; // Change "Top" to "Bottom", "Left", or "Right" as you desire
```

### Animating Alert Out of View

Have the alert animate out to different directions when dismissed, instead of the default disappear animation.

```Objective-C
alert.animateAlertOutToTop = YES; // Change "Top" to "Bottom", "Left", or "Right" as you desire
```

## Adding TextFields

Simply add a single textfield to your alert, by adding this line and get the returned text when any of the AlertView's buttons are pressed:

```Objective-C
[alert addTextFieldWithPlaceholder:@"Email Address" andTextReturnBlock:^(NSString *text) {
    NSLog(@"The Email Address is: %@", text); // Do what you'd like with the text returned from the field
}];
```

## Button Actions

To add methods for detecting actions on your buttons, do the following:

First add ```FCAlertViewDelegate``` to your View Controller's ```@interface``` as such:

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
                andButtons:@[@"Button 1", @"Button 2"]]; // Set your button titles here

```

After adding your FCAlertView, you can detect button touches by adding this method to your class:

```Objective-C
- (void) FCAlertView:(FCAlertView *)alertView clickedButtonIndex:(NSInteger)index buttonTitle:(NSString *)title {
    if ([title isEqualToString:@"Button 1"]) { // Change "Button 1" to the title of your first button
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

Make sure to add ```FCAlertViewDelegate``` to your View Controller's ```@interface``` as such:

```Objective-C
#import <UIKit/UIKit.h>
#import "FCAlertView.h"

@interface ViewController : UIViewController <FCAlertViewDelegate>

@end
```

and setting the delegate of your FCAlertView, as such:

```Objective-C
  FCAlertView *alert = [[FCAlertView alloc] init];
  alert.delegate = self;
```

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

## Future Customizations

FCAlertView is an ongoing project with the goal of becoming the most used custom AlertView for iOS. Improvements and changes are on the way, and here are some of the things that are coming soon with it:

- Swift Friendly ✓
- Adding TextFields ✓
- Blur Background ✓
- Frame Customizations ✓
- Alert Sounds ✓
- Landscape Orientation ✓
- More Custom Animations ✓
- More Types of Alerts (including Progress Types) ✓
- iPad Friendly Alerts (tested on all devices) ✓
- Improved Button Highlighting and Customizations ✓
- Something Missing? Create a pull request or issue with your suggestion.

About FCAlertView
-----------------

FCAlertView is a fully customizable and beautifully designed AlertView. I designed FCAlertView because I've always wanted to have access to change the different attributes of the default UIAlertView. In terms of design, FCAlertView looks similar to the default AlertView, however, as you start customizing it for your specific need, you realize it can do a lot more while looking flat and sharp. 

FCAlertView lets you do things such as specify the number of buttons, the color scheme of the view, adding a small image to it, hide the view after a certain time, and more. A full description of how to customize FCAlertView to fit your alert can be found on http://github.com/nimati/FCAlertView.

The Vision for FC Libraries
---------------------------

My goal is to create a set of different libraries, each targetting a certain UI element of iOS, with the goal to improve the design and add more customizations. As such, FCAlertView is a more Flat/Customizable AlertView. With this mindset, I'd like to create more FC libraries, such as FCActionSheet, FCNotification (for quick, in app alerts), FCPopoverView, FCGuideView (for guiding your users around your app). If you also have a suggestion for an FC Library, please open an issue and tell me about it.

Ultimately, FCLibraries is here to improve the look and feel of your app for your end users. So all improvements and suggestions are welcome.

Cheers 🍻

### Author

Created and designed by [Nima Tahami](http://nimatahami.com).

Credits for the Beautiful Color Palette goes to [flatuicolors.com](http://flatuicolors.com).

Credit for the Beautiful Icons go to [ionicons.com](http://ionicons.com).

### License

FCAlertView is available under the MIT license. See the LICENSE file for more info.
