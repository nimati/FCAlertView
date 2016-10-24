//
//  ExampleViewController.h
//  FCAlertView
//
//  Created by Nima Tahami on 2016-08-19.
//  Copyright © 2016 Nima Tahami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCAlertView.h" // 1) Add This to your Project
#import <MessageUI/MessageUI.h>

@interface ExampleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, FCAlertViewDelegate, MFMailComposeViewControllerDelegate>

// Thank You for checking out this example app for FCAlertView!
// TO GET SET UP: Follow Steps 1), 2), 3), 4) and 5) in Example.h and Example.m
// Run the App on the Simulator or Your Device to Get an idea of what you could do with FCAlertView

// Customizations

@property (strong, nonatomic) NSMutableArray *alertViewOptions;
@property (strong, nonatomic) NSMutableArray *alertViewLatestOptions;
@property (strong, nonatomic) NSArray *alertViewOptionsOriginal;
@property (strong, nonatomic) NSArray *alertViewLatestOptionsOriginal;

@property UIColor *themeColor;
@property UIColor *redColor;
@property UIColor *greenColor;
@property NSInteger headerHeight;
@property NSInteger suggestionBarClosed;

@property (retain, nonatomic) UIImage *alertImage;
@property (retain, nonatomic) NSString *alertTitle;
@property (retain, nonatomic) NSArray *arrayOfButtonTitles;

// Outlets

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *showAlertButton;

// Actions

- (IBAction)showAlert:(id)sender;


@end
