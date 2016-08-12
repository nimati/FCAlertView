//
//  ViewController.m
//  FCAlertViewExample
//
//  Created by Nima Tahami on 2016-08-07.
//  Copyright © 2016 Nima Tahami. All rights reserved.
//

#import "ViewController.h"
#import "FCAlertView.h"

@interface ViewController () {
    FCAlertView *alert;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // SETTING COLORS OF BUTTONS FOR THIS EXAMPLE VIEWCONTROLLER - Not related to FCAlertView
    
    self.redButtonColor = [UIColor colorWithRed:190.0f/255.0f green:0.0f blue:0.0f alpha:1.0f];
    self.greenButtonColor = [UIColor colorWithRed:42.0f/255.0f green:186.0f/255.0f blue:83.0f/255.0f alpha:1.0f];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    
    alert = [[FCAlertView alloc] init];

    // SETTING ALERT TYPE
    
    if (self.type == 1)
        [alert makeAlertTypeSuccess];
    
    if (self.type == 2)
        [alert makeAlertTypeCaution];
    
    if (self.type == 3)
        [alert makeAlertTypeWarning];
    
    // DISMISS ALERTVIEW ON OUTSIDE TOUCH

    alert.dismissOnOutsideTouch = self.dismissOnOutsideTouch;
    
    // HIDE CLOSE/DONE BUTTON

    alert.hideDoneButton = self.hideDoneButton;
    
    // PRESENTING THE ALERTVIEW
    // Title: Alert's Title, NSString, Default is Nil/Can be Nil
    // Subtitle: Alert's Subtitle, NSString, Shouldn't be Nil
    // Custom Image: Alert's Vector, UIImage, Default is Nil/Can be Nil
    // Done Button Title: Alert's Main Close/Done Button Title, NSString, Default will be "Ok", Can be Nil
    // Buttons: Other Alert's Buttons Titles, NSArray of NSStrings, Can be Nil or max of 2 Buttons.
    
    alert.autoHideSeconds = _timer;
    
    [alert showAlertInView:self
                 withTitle:_alertTitle
              withSubtitle:@"This is my alert's subtitle. Keep it short and concise. 😜👌"
           withCustomImage:nil
       withDoneButtonTitle:nil
                andButtons:self.arrayOfButtonTitles];
    
}

- (IBAction)changeAlertType:(id)sender {
    
    alert = [[FCAlertView alloc] init];

    self.type = (self.type + 1) %4;
    NSLog(@"ALERT TYPE: %ld", (long)self.type);
    
    if (self.type == 0) {
        self.alertTypeButton.backgroundColor = [UIColor colorWithRed:80/255 green:80/255 blue:80/255 alpha:1];
        [self.alertTypeButton setTitle:@"Alert Type: None" forState:UIControlStateNormal];
    }

    if (self.type == 1) {
        self.alertTypeButton.backgroundColor = alert.flatGreen;
        [self.alertTypeButton setTitle:@"Alert Type: Success" forState:UIControlStateNormal];
    }
    
    if (self.type == 2) {
        self.alertTypeButton.backgroundColor = alert.flatOrange;
        [self.alertTypeButton setTitle:@"Alert Type: Caution" forState:UIControlStateNormal];
    }
    
    if (self.type == 3) {
        self.alertTypeButton.backgroundColor = alert.flatRed;
        [self.alertTypeButton setTitle:@"Alert Type: Warning" forState:UIControlStateNormal];
    }
    
}

- (IBAction)changeButtons:(id)sender {
    
    self.numOfButtons = (self.numOfButtons + 1) %3;
    NSLog(@"NUMBER OF BUTTONS: %ld", (long)self.numOfButtons);
    
    [self.numberOfBtnsButton setTitle:[NSString stringWithFormat:@"Buttons: %ld", (long)_numOfButtons] forState:UIControlStateNormal];
    
    if (self.numOfButtons == 0) {
        self.arrayOfButtonTitles = nil;
        self.numberOfBtnsButton.backgroundColor = self.redButtonColor;
    } else {
        self.numberOfBtnsButton.backgroundColor = self.greenButtonColor;
    }

    if (self.numOfButtons == 1)
        self.arrayOfButtonTitles = @[@"One"];
    
    if (self.numOfButtons == 2)
        self.arrayOfButtonTitles = @[@"One", @"Two"];
    
}

- (IBAction)toggleTitle:(id)sender {
    
    self.hideTitle = (self.hideTitle + 1) %2;
    NSLog(@"TITLE SHOWING: %ld", (long)self.hideTitle);

    if (!_hideTitle) {
        [_toggleTitleButton setTitle:@"Title: Showing" forState:UIControlStateNormal];
        _toggleTitleButton.backgroundColor = self.greenButtonColor;
        _alertTitle = @"Alert Title";
    } else {
        [_toggleTitleButton setTitle:@"Title: Hidden" forState:UIControlStateNormal];
        _toggleTitleButton.backgroundColor = self.redButtonColor;
        _alertTitle = nil;
    }
    
}

- (IBAction)setAlertTimer:(id)sender {
    
    self.timer = (self.timer + 1) %6;
    NSLog(@"AUTO CLOSE VIEW IN: %ld Seconds", (long)self.timer);
    
    [_autoCloseButton setTitle:[NSString stringWithFormat:@"Close In: %ld Secs", self.timer] forState:UIControlStateNormal];
    
    if (self.timer == 0)
        _autoCloseButton.backgroundColor = self.redButtonColor;
    else
        _autoCloseButton.backgroundColor = self.greenButtonColor;

}

- (IBAction)toggleDismiss:(id)sender {

    self.dismissOnOutsideTouch = (self.dismissOnOutsideTouch + 1) %2;
    NSLog(@"DISMISS ON OUTSIDE TOUCH: %ld", (long)self.dismissOnOutsideTouch);

    if (self.dismissOnOutsideTouch) {
        [_dismissTouchButton setTitle:@"Dismiss On Touch: ON" forState:UIControlStateNormal];
        _dismissTouchButton.backgroundColor = self.greenButtonColor;
    } else {
        [_dismissTouchButton setTitle:@"Dismiss On Touch: OFF" forState:UIControlStateNormal];
        _dismissTouchButton.backgroundColor = self.redButtonColor;
    }

}

- (IBAction)toggleCloseButton:(id)sender {
    
    self.hideDoneButton = (self.hideDoneButton + 1) %2;
    NSLog(@"HIDE DONE BUTTON: %ld", (long)self.hideDoneButton);

    if (self.hideDoneButton) {
        [_closeButtonToggle setTitle:@"Close Button: Hidden" forState:UIControlStateNormal];
        _closeButtonToggle.backgroundColor = self.redButtonColor;
    } else {
        [_closeButtonToggle setTitle:@"Close Button: Showing" forState:UIControlStateNormal];
        _closeButtonToggle.backgroundColor = self.greenButtonColor;
    }
    
}

@end
