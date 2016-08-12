//
//  ViewController.h
//  FCAlertViewExample
//
//  Created by Nima Tahami on 2016-08-07.
//  Copyright © 2016 Nima Tahami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// Customizations

@property UIColor *redButtonColor;
@property UIColor *greenButtonColor;

@property NSInteger type;
@property NSInteger timer;
@property NSInteger dismissOnOutsideTouch;
@property NSInteger hideDoneButton;
@property NSInteger hideTitle;
@property NSInteger numOfButtons;

@property (retain, nonatomic) NSString *alertTitle;
@property (retain, nonatomic) NSArray *arrayOfButtonTitles;

// UI Outlets

@property (weak, nonatomic) IBOutlet UIButton *showAlertButton;
@property (weak, nonatomic) IBOutlet UIButton *alertTypeButton;
@property (weak, nonatomic) IBOutlet UIButton *numberOfBtnsButton;
@property (weak, nonatomic) IBOutlet UIButton *toggleTitleButton;
@property (weak, nonatomic) IBOutlet UIButton *autoCloseButton;
@property (weak, nonatomic) IBOutlet UIButton *dismissTouchButton;
@property (weak, nonatomic) IBOutlet UIButton *closeButtonToggle;

// IB Actions

- (IBAction)showAlert:(id)sender;
- (IBAction)changeAlertType:(id)sender;
- (IBAction)changeButtons:(id)sender;
- (IBAction)toggleTitle:(id)sender;
- (IBAction)setAlertTimer:(id)sender;
- (IBAction)toggleDismiss:(id)sender;
- (IBAction)toggleCloseButton:(id)sender;

@end

