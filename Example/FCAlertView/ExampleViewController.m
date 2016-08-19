//
//  ExampleViewController.m
//  FCAlertView
//
//  Created by Nima Tahami on 2016-08-19.
//  Copyright © 2016 Nima Tahami. All rights reserved.
//

#import "ExampleViewController.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // SETTING COLORS OF BUTTONS FOR THIS EXAMPLE VIEWCONTROLLER - Not related to FCAlertView
    
    self.redColor = [UIColor colorWithRed:190.0f/255.0f green:0.0f blue:0.0f alpha:1.0f];
    self.greenColor = [UIColor colorWithRed:42.0f/255.0f green:186.0f/255.0f blue:83.0f/255.0f alpha:1.0f];
    
    // LIST OF ALL CUSTOMIZATION YOU CAN MAKE
    
    _alertViewOptions = [[NSMutableArray alloc] init];

    NSArray *options = @[@{@"title" : @"Color Scheme",
                           @"description" : @"Choose your own color scheme or from one of included.",
                           @"setting" : @"OFF",
                           @"status" : @0,
                           @"customIndicator" : @1,
                           @"selection" : @[@"OFF", @"Turquoise", @"Green", @"Blue", @"Midnight", @"Purple", @"Orange", @"Red", @"Silver", @"Gray"]},
                         @{@"title" : @"Title Color",
                           @"description" : @"Choose your own color scheme or from one of included.",
                           @"setting" : @"OFF",
                           @"status" : @0,
                           @"customIndicator" : @0},
                         @{@"title" : @"Subtitle Color",
                           @"description" : @"Choose your own color scheme or from one of included.",
                           @"setting" : @"OFF",
                           @"status" : @0,
                           @"customIndicator" : @0},
                         @{@"title" : @"Rounded Corners",
                           @"description" : @"Choose rounding of the alert.",
                           @"setting" : @"18",
                           @"status" : @1,
                           @"customIndicator" : @0},
                         @{@"title" : @"Hide Alert Title",
                           @"description" : @"Show or Hide the alert's title",
                           @"setting" : @"OFF",
                           @"status" : @0,
                           @"customIndicator" : @0},
                         @{@"title" : @"Alert Type",
                           @"description" : @"Choose from Pre-Set Success, Caution, and Warning.",
                           @"setting" : @"OFF",
                           @"status" : @0,
                           @"customIndicator" : @0},
                         @{@"title" : @"Number of Buttons",
                           @"description" : @"You can have upto 2 extra buttons in your alert.",
                           @"setting" : @0,
                           @"status" : @0,
                           @"customIndicator" : @0},
                         @{@"title" : @"Auto-Close",
                           @"description" : @"Alert will hide after a certain time.",
                           @"setting" : @"OFF",
                           @"status" : @0,
                           @"customIndicator" : @0},
                         @{@"title" : @"Outside Touch",
                           @"description" : @"Alert will hide after outside the alert is touched.",
                           @"setting" : @"OFF",
                           @"status" : @0,
                           @"customIndicator" : @0},
                         @{@"title" : @"Hide Done Button",
                           @"description" : @"Hide the Done Button that closes the alert.",
                           @"setting" : @"OFF",
                           @"status" : @0,
                           @"customIndicator" : @0},
                         @{@"title" : @"Hide All Buttons",
                           @"description" : @"Hide all buttons that are in the alert.",
                           @"setting" : @"OFF",
                           @"status" : @0,
                           @"customIndicator" : @0}];
    
    _alertViewOptions = [options mutableCopy];
    
    // NAV BAR SETTINGS
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:59.0f/255.0f green:154.0f/255.0f blue:217.0f/255.0f alpha:1.0]}];
    
    // TABLEVIEW SETTINGS
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}

#pragma mark - TableView Datasource Changes

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _alertViewOptions.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleDefault];
        
        // Separator Line View
        
        UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 79.0f, self.view.frame.size.width, 2)];
        separatorLineView.backgroundColor = [UIColor colorWithRed:247.0f/255.0f green:247.0f/255.0f blue:247.0f/255.0f alpha:1.0];
        [cell.contentView addSubview:separatorLineView];
        
        CAShapeLayer *circleLayer = [CAShapeLayer layer];
        [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.tableView.frame.size.width - 20, 80/2 - 8/2, 8, 8)] CGPath]];
        
        if (![[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"customIndicator"]) {
        if ([[[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"status"] isEqual:@0])
            [circleLayer setFillColor:[_redColor CGColor]];
        else
            [circleLayer setFillColor:[_greenColor CGColor]];
        } else {
            NSString *selectedColor = [[[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"selection"]
                                       objectAtIndex:[[[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"status"] integerValue]];
            
            [circleLayer setFillColor:[[self checkFlatColors:selectedColor] CGColor]];
            
        }

        // Option Title Label
        
        UILabel *optionTitle = [[UILabel alloc] initWithFrame:CGRectMake(25.0f, 0.0f, self.tableView.frame.size.width - 120.0f, 40.0f)];
        optionTitle.numberOfLines = 1;
        optionTitle.font = [UIFont systemFontOfSize:18.0f weight:UIFontWeightMedium];
        optionTitle.textColor = [UIColor colorWithWhite:80.0f/255.0f alpha:1.0];
        optionTitle.textAlignment = NSTextAlignmentLeft;
        optionTitle.text = [[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"title"];
        
        // Option Description Label
        
        UILabel *optionDesc = [[UILabel alloc] initWithFrame:CGRectMake(25.0f, 25.0f, self.tableView.frame.size.width - 160.0f, 50.0f)];
        optionDesc.numberOfLines = 2;
        optionDesc.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightRegular];
        optionDesc.textColor = [UIColor colorWithWhite:120.0f/255.0f alpha:1.0];
        optionDesc.textAlignment = NSTextAlignmentLeft;
        optionDesc.text = [[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"description"];
        
        // Option Setting Label
        
        NSString *selectedSetting = [[[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"selection"]
                                   objectAtIndex:[[[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"status"] integerValue]];
        
        UILabel *optionSetting = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width - 30.0f, 80.0f)];
        optionSetting.numberOfLines = 1;
        optionSetting.font = [UIFont systemFontOfSize:16.0f weight:UIFontWeightRegular];
        optionSetting.textColor = [UIColor colorWithWhite:80.0f/255.0f alpha:1.0];
        optionSetting.textAlignment = NSTextAlignmentRight;
        optionSetting.text = selectedSetting;

        // Adding Cell Subviews
        
        [[cell.contentView layer] addSublayer:circleLayer];
        [cell.contentView addSubview:optionTitle];
        [cell.contentView addSubview:optionDesc];
        [cell.contentView addSubview:optionSetting];

        
    }
    
    return cell;
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableDictionary *selectedCell = [[_alertViewOptions objectAtIndex:indexPath.row] mutableCopy];
    
    NSInteger status = [[selectedCell objectForKey:@"status"] integerValue];
    NSArray *selection = [selectedCell objectForKey:@"selection"];
    
    status = (status + 1) %(selection.count);
    
    [selectedCell setObject:[NSNumber numberWithInteger:status] forKey:@"status"];
    
    [_alertViewOptions replaceObjectAtIndex:indexPath.row withObject:selectedCell];
    
    NSLog(@"For: %@ Now Selected: %@", [selectedCell objectForKey:@"title"], [selection objectAtIndex:status]);
    
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (UIColor *) checkFlatColors:(NSString *)selectedColor {
    
    FCAlertView *alert = [[FCAlertView alloc] init]; // Ignore This FCAlertView, simply initalized for colors here
    
    UIColor *color;
    
    if ([selectedColor isEqual:@"Turquoise"])
        color = alert.flatTurquoise;
    if ([selectedColor isEqual:@"Green"])
        color = alert.flatGreen;
    if ([selectedColor isEqual:@"Blue"])
        color = alert.flatBlue;
    if ([selectedColor isEqual:@"Midnight"])
        color = alert.flatMidnight;
    if ([selectedColor isEqual:@"Purple"])
        color = alert.flatPurple;
    if ([selectedColor isEqual:@"Orange"])
        color = alert.flatOrange;
    if ([selectedColor isEqual:@"Red"])
        color = alert.flatRed;
    if ([selectedColor isEqual:@"Silver"])
        color = alert.flatSilver;
    if ([selectedColor isEqual:@"Gray"])
        color = alert.flatGray;
    if ([selectedColor isEqual:@"OFF"])
        color = self.redColor;
    
    return color;
    
}

- (IBAction)showAlert:(id)sender {
    
    
//    @property (weak, nonatomic) IBOutlet UIButton *autoCloseButton;
//    @property (weak, nonatomic) IBOutlet UIButton *dismissTouchButton;
//    @property (weak, nonatomic) IBOutlet UIButton *closeButtonToggle;
    
    FCAlertView *alert = [[FCAlertView alloc] init];
    
    // SETTING ALERT COLOR SCHEME
    
    NSString *selectedColor = [[[_alertViewOptions objectAtIndex:0] objectForKey:@"selection"]
                               objectAtIndex:[[[_alertViewOptions objectAtIndex:0] objectForKey:@"status"] integerValue]];
    
    alert.colorScheme = [self checkFlatColors:selectedColor];
    
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

@end
