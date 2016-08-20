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

// Customizations

@property (strong, nonatomic) NSMutableArray *alertViewOptions;
@property (strong, nonatomic) NSArray *alertViewOptionsOriginal;

@property UIColor *themeColor;
@property UIColor *redColor;
@property UIColor *greenColor;

@property (retain, nonatomic) NSString *alertTitle;
@property (retain, nonatomic) NSArray *arrayOfButtonTitles;

// Outlets

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *showAlertButton;

// Actions

- (IBAction)showAlert:(id)sender;


@end
