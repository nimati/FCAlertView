//
//  ExampleViewController.h
//  FCAlertView
//
//  Created by Nima Tahami on 2016-08-19.
//  Copyright © 2016 Nima Tahami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCAlertView.h"

@interface ExampleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, FCAlertViewDelegate>

// Customizations

@property (strong, nonatomic) NSMutableArray *alertViewOptions;

@property UIColor *redColor;
@property UIColor *greenColor;

@property NSInteger type;
@property NSInteger timer;
@property NSInteger dismissOnOutsideTouch;
@property NSInteger hideDoneButton;
@property NSInteger hideTitle;
@property NSInteger numOfButtons;

@property (retain, nonatomic) NSString *alertTitle;
@property (retain, nonatomic) NSArray *arrayOfButtonTitles;

// Outlets

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *showAlertButton;

// Actions

- (IBAction)showAlert:(id)sender;


@end
