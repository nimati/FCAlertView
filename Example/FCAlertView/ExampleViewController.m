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
    
    _headerHeight = 180;
    
    // SETTING COLORS OF BUTTONS FOR THIS EXAMPLE VIEWCONTROLLER - Not related to FCAlertView
    
    self.redColor = [UIColor colorWithRed:190.0f/255.0f green:0.0f blue:0.0f alpha:1.0f];
    self.greenColor = [UIColor colorWithRed:42.0f/255.0f green:186.0f/255.0f blue:83.0f/255.0f alpha:1.0f];
    self.themeColor = [UIColor colorWithRed:59.0f/255.0f green:154.0f/255.0f blue:217.0f/255.0f alpha:1.0];
    
    // LIST OF ALL CUSTOMIZATION YOU CAN MAKE - Used For this Example App
    
    _alertViewOptions = [[NSMutableArray alloc] init];
    
    _alertViewOptionsOriginal = @[@{@"title" : @"Custom Image",
                                    @"description" : @"Add a custom image to your alert.",
                                    @"setting" : @"Off",
                                    @"status" : @0,
                                    @"customIndicator" : @0,
                                    @"selection" : @[@"Off", @"On"]},
                                  @{@"title" : @"Color Scheme",
                                    @"description" : @"Choose your own color scheme or from one of included.",
                                    @"setting" : @"Off",
                                    @"status" : @0,
                                    @"customIndicator" : @1,
                                    @"selection" : @[@"Off", @"Turquoise", @"Green", @"Blue", @"Midnight", @"Purple", @"Orange", @"Red", @"Silver", @"Gray"]},
                                  @{@"title" : @"Title Color",
                                    @"description" : @"Choose your own title color or from one of included.",
                                    @"setting" : @"Off",
                                    @"status" : @0,
                                    @"customIndicator" : @1,
                                    @"selection" : @[@"Off", @"Turquoise", @"Green", @"Blue", @"Midnight", @"Purple", @"Orange", @"Red", @"Silver", @"Gray"]},
                                  @{@"title" : @"Subtitle Color",
                                    @"description" : @"Choose your own subtitle color or from one of included.",
                                    @"setting" : @"Off",
                                    @"status" : @0,
                                    @"customIndicator" : @1,
                                    @"selection" : @[@"Off", @"Turquoise", @"Green", @"Blue", @"Midnight", @"Purple", @"Orange", @"Red", @"Silver", @"Gray"]},
                                  @{@"title" : @"Rounded Corners",
                                    @"description" : @"Choose the rounding of the alert.",
                                    @"setting" : @"18",
                                    @"status" : @18,
                                    @"customIndicator" : @0,
                                    @"selection" : @[@"Off", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25"]},
                                  @{@"title" : @"Show Alert Title",
                                    @"description" : @"Show or Hide the alert's title",
                                    @"setting" : @"On",
                                    @"status" : @1,
                                    @"customIndicator" : @0,
                                    @"selection" : @[@"Off", @"On"]},
                                  @{@"title" : @"Alert Type",
                                    @"description" : @"Choose from Pre-Set Success, Caution, and Warning.",
                                    @"setting" : @"Off",
                                    @"status" : @0,
                                    @"customIndicator" : @0,
                                    @"selection" : @[@"Off", @"Success", @"Caution", @"Warning"]},
                                  @{@"title" : @"Number of Buttons",
                                    @"description" : @"You can have upto 2 extra buttons in your alert.",
                                    @"setting" : @"0",
                                    @"status" : @0,
                                    @"customIndicator" : @0,
                                    @"selection" : @[@"0", @"1", @"2"]},
                                  @{@"title" : @"Auto-Close",
                                    @"description" : @"Alert will hide after a certain number of seconds.",
                                    @"setting" : @"Off",
                                    @"status" : @0,
                                    @"customIndicator" : @0,
                                    @"selection" : @[@"Off", @"1", @"2", @"3", @"4", @"5"]},
                                  @{@"title" : @"Outside Touch",
                                    @"description" : @"Alert will hide after outside the alert is touched.",
                                    @"setting" : @"Off",
                                    @"status" : @0,
                                    @"customIndicator" : @0,
                                    @"selection" : @[@"Off", @"On"]},
                                  @{@"title" : @"Hide Done Button",
                                    @"description" : @"Hide the Done Button that closes the alert.",
                                    @"setting" : @"Off",
                                    @"status" : @0,
                                    @"customIndicator" : @0,
                                    @"selection" : @[@"Off", @"On"]},
                                  @{@"title" : @"Hide All Buttons",
                                    @"description" : @"Hide all buttons that are in the alert.",
                                    @"setting" : @"Off",
                                    @"status" : @0,
                                    @"customIndicator" : @0,
                                    @"selection" : @[@"Off", @"On"]}];
    
    _alertViewOptions = [_alertViewOptionsOriginal mutableCopy];
    
    // NAV BAR SETTINGS
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : self.themeColor}];
    
    UIBarButtonItem *readmeBtn = [[UIBarButtonItem alloc] initWithTitle:@"Readme" style:UIBarButtonItemStylePlain target:self action:@selector(showReadMe)];
    self.navigationItem.rightBarButtonItem = readmeBtn;
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:44.0/255.0f green:62.0/255.0f blue:80.0/255.0f alpha:1.0];
    
    // TABLEVIEW SETTINGS
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    CGFloat dummyViewHeight = 180;
    UIView *dummyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, dummyViewHeight)];
    self.tableView.tableHeaderView = dummyView;
    self.tableView.contentInset = UIEdgeInsetsMake(-dummyViewHeight, 0, 0, 0);
    
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
        
        // Circle Indicator Layer
        
        CAShapeLayer *circleLayer = [CAShapeLayer layer];
        [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.tableView.frame.size.width - 27, 80/2 - 8/2, 8, 8)] CGPath]];
        
        if (![[[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"customIndicator"] isEqual:@1]) {
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
        
        NSString *selectedSetting = [[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"setting"];
        
        UILabel *optionSetting = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.frame.size.width - 35.0f, 80.0f)];
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
        
        // Long Press Gesture for Turning Off Customizations
        
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        [cell addGestureRecognizer:longPress];
        
    }
    
    return cell;
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableDictionary *selectedCell = [[_alertViewOptions objectAtIndex:indexPath.row] mutableCopy];
    
    NSInteger status = [[selectedCell objectForKey:@"status"] integerValue];
    NSArray *selection = [selectedCell objectForKey:@"selection"];
    
    status = (status + 1) %(selection.count);
    
    [selectedCell setObject:[NSNumber numberWithInteger:status] forKey:@"status"];
    
    NSString *selectedSetting = [[[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"selection"] objectAtIndex:status];
    
    [selectedCell setObject:selectedSetting forKey:@"setting"];
    
    [_alertViewOptions replaceObjectAtIndex:indexPath.row withObject:selectedCell];
    
    NSLog(@"For: %@ Now Selected: %@", [selectedCell objectForKey:@"title"], [selection objectAtIndex:status]);
    
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(void) handleLongPress: (UIGestureRecognizer *)longPress {
    
    if (longPress.state==UIGestureRecognizerStateBegan) {
        
        CGPoint pressPoint = [longPress locationInView:self.tableView];
        NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:pressPoint];
        
        NSMutableDictionary *selectedCell = [[_alertViewOptions objectAtIndex:indexPath.row] mutableCopy];
        [selectedCell setObject:[[_alertViewOptionsOriginal objectAtIndex:indexPath.row] objectForKey:@"status"] forKey:@"status"];
        [selectedCell setObject:[[_alertViewOptionsOriginal objectAtIndex:indexPath.row] objectForKey:@"setting"] forKey:@"setting"];
        [_alertViewOptions replaceObjectAtIndex:indexPath.row withObject:selectedCell];
        
        NSLog(@"For: %@ Reset to: %@",
              [selectedCell objectForKey:@"title"],
              [[_alertViewOptionsOriginal objectAtIndex:indexPath.row] objectForKey:@"setting"]);
        
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
        
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 120)];
    headerView.backgroundColor = [UIColor colorWithWhite:239.0f/255.0f alpha:1.0];
    
    // Separator Line View
    
    UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 177, self.view.frame.size.width, 3)];
    separatorLineView.backgroundColor = [UIColor colorWithWhite:225.0f/255.0f alpha:1.0];
    [headerView addSubview:separatorLineView];
    
    // Label for Instructions
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 10, headerView.frame.size.width - 60, headerView.frame.size.height - 10)];
    headerLabel.font = [UIFont systemFontOfSize:16.0f];
    headerLabel.textColor = [UIColor colorWithWhite:40.0f/255.0f alpha:1.0];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.text = @"Tap on cells to Toggle Customizations\n Hold to Reset to Default \n Enjoy!";
    headerLabel.numberOfLines = 4;
    headerLabel.backgroundColor = [UIColor clearColor];
    
    // Suggestion Button
    
    UIButton *suggestionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    suggestionBtn.frame = CGRectMake(tableView.frame.size.width/2 - (tableView.frame.size.width - 140)/2, 118, tableView.frame.size.width - 140, 40);
    suggestionBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [suggestionBtn setTitle:@"Got Suggestions?" forState:UIControlStateNormal];
    [suggestionBtn setTitleColor:self.themeColor forState:UIControlStateNormal];
    suggestionBtn.layer.cornerRadius = 4;
    suggestionBtn.clipsToBounds = YES;
    suggestionBtn.layer.borderWidth = 1.5;
    suggestionBtn.layer.borderColor = suggestionBtn.titleLabel.textColor.CGColor;
    [suggestionBtn addTarget:self action:@selector(sendEmail) forControlEvents:UIControlEventTouchUpInside];
    
    // Close Button

    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    closeBtn.frame = CGRectMake(tableView.frame.size.width - 40, 10, 30, 30);
    closeBtn.tintColor = [UIColor colorWithWhite:120/255.0f alpha:1.0];
    [closeBtn setImage:[UIImage imageNamed:@"closeBtn"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(closeSuggestionBar) forControlEvents:UIControlEventTouchUpInside];
    
    // Adding To HeaderView
    
    [headerView addSubview:headerLabel];
    [headerView addSubview:suggestionBtn];
    [headerView addSubview:closeBtn];
    
    return headerView;
    
}

- (void) closeSuggestionBar {
    
    _headerHeight = 0;
    
    [UIView transitionWithView: self.tableView
                      duration: 0.25f
                       options: UIViewAnimationOptionTransitionCrossDissolve
                    animations: ^(void)
     {
         [self.tableView reloadData];
     }
                    completion: nil];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return  _headerHeight;
}

#pragma mark - FCAlertViewExample Helper Methods

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
    if ([selectedColor isEqual:@"Off"])
        color = self.redColor;
    
    return color;
    
}

- (void) showReadMe {
    
    [self performSegueWithIdentifier:@"showReadmeFile" sender:self];
    
}

#pragma mark - Send Suggestions

- (void) sendEmail {

    NSString *emailTitle = @"FCAlertView Suggestion";
    NSString *messageBody = @"Hey Nima,\n\nI got a suggestion for FCAlertView:\n";
    NSArray *toRecipents = [NSArray arrayWithObject:@"nima6tahami@gmail.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    [self presentViewController:mc animated:YES completion:NULL];
    
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Suggestion Mail Cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Suggestion Mail Saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Suggestion Mail Sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Suggestion Mail Sent Failed: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - IBActions

- (IBAction)showAlert:(id)sender {
    
    // ADDING AND INITIALIZING FCALERTVIEW
    
    FCAlertView *alert = [[FCAlertView alloc] init]; // 2) Add This Where you Want to Create an FCAlertView
    
    // ALL CUSTOMIZATIONS - DON'T COPY THIS TO YOUR CODE // 3) Customize as you need to
    // Go Through README.md or this example to understand how to use these customizations work and how to add them
    // It's best to include these customiztions before PRESENTING THE FCALERTVIEW
    
    // Setting Custom Image
    
    if ([[[_alertViewOptions objectAtIndex:0] objectForKey:@"setting"] isEqual:@"Off"])
        self.alertImage = nil;
    
    if ([[[_alertViewOptions objectAtIndex:0] objectForKey:@"setting"] isEqual:@"On"])
        self.alertImage = [UIImage imageNamed:@"github-icon.png"];
    
    // Setting FCAlertView's Color Scheme
    
    NSString *selectedColor = [[_alertViewOptions objectAtIndex:1] objectForKey:@"setting"];
    
    if (![selectedColor isEqual:@"Off"])
        alert.colorScheme = [self checkFlatColors:selectedColor];
    
    // Setting FCAlertView's Title Color
    
    NSString *titleColor = [[_alertViewOptions objectAtIndex:2] objectForKey:@"setting"];
    
    if (![titleColor isEqual:@"Off"])
        alert.titleColor = [self checkFlatColors:titleColor];
    
    // Setting FCAlertView's Subtitle Color
    
    NSString *subtitleColor = [[_alertViewOptions objectAtIndex:3] objectForKey:@"setting"];
    
    if (![subtitleColor isEqual:@"Off"])
        alert.subTitleColor = [self checkFlatColors:subtitleColor];
    
    // Setting FCAlertView's Rounded Corner Pixels - Use 0.05 to turn Off
    
    if ([[[_alertViewOptions objectAtIndex:4] objectForKey:@"setting"] integerValue] > 0)
        alert.cornerRadius = [[[_alertViewOptions objectAtIndex:4] objectForKey:@"status"] integerValue];
    if ([[[_alertViewOptions objectAtIndex:4] objectForKey:@"setting"] isEqual:@"Off"])
        alert.cornerRadius = 0.05;
    
    // Choosing the Title for FCAlertView
    
    if ([[[_alertViewOptions objectAtIndex:5] objectForKey:@"setting"] isEqual:@"Off"])
        self.alertTitle = nil;
    
    if ([[[_alertViewOptions objectAtIndex:5] objectForKey:@"setting"] isEqual:@"On"])
        self.alertTitle = @"Alert Title";
    
    // Setting FCAlertView's Alert Type
    
    if ([[[_alertViewOptions objectAtIndex:6] objectForKey:@"setting"] isEqual:@"Success"])
        [alert makeAlertTypeSuccess];
    
    if ([[[_alertViewOptions objectAtIndex:6] objectForKey:@"setting"] isEqual:@"Caution"])
        [alert makeAlertTypeCaution];
    
    if ([[[_alertViewOptions objectAtIndex:6] objectForKey:@"setting"] isEqual:@"Warning"])
        [alert makeAlertTypeWarning];
    
    // Adding Buttons to FCAlertView
    
    if ([[[_alertViewOptions objectAtIndex:7] objectForKey:@"setting"] integerValue] == 0)
        self.arrayOfButtonTitles = @[];
    
    if ([[[_alertViewOptions objectAtIndex:7] objectForKey:@"setting"] integerValue] == 1)
        self.arrayOfButtonTitles = @[@"First"];
    
    if ([[[_alertViewOptions objectAtIndex:7] objectForKey:@"setting"] integerValue] == 2)
        self.arrayOfButtonTitles = @[@"First", @"Second"];
    
    // Auto Closing FCAlertView based on time passed after presenting it
    
    if (![[[_alertViewOptions objectAtIndex:8] objectForKey:@"setting"] isEqual:@"Off"])
        alert.autoHideSeconds = [[[_alertViewOptions objectAtIndex:8] objectForKey:@"setting"] integerValue];
    else
        alert.autoHideSeconds = 0;
    
    // Dismissing FCAlertView with touch on outside of view
    
    if (![[[_alertViewOptions objectAtIndex:9] objectForKey:@"setting"] isEqual:@"Off"])
        alert.dismissOnOutsideTouch = 1;
    else
        alert.dismissOnOutsideTouch = 0;
    
    // Hiding Done Button in FCAlertView
    
    if (![[[_alertViewOptions objectAtIndex:10] objectForKey:@"setting"] isEqual:@"Off"])
        alert.hideDoneButton = 1;
    else
        alert.hideDoneButton = 0;
    
    // Hiding All Buttons in FCAlertView
    
    if (![[[_alertViewOptions objectAtIndex:11] objectForKey:@"setting"] isEqual:@"Off"])
        alert.hideAllButtons = 1;
    else
        alert.hideAllButtons = 0;
    
    // PRESENTING THE FCALERTVIEW // 4) Add This to finally present FCAlertView in your view's window
    
    // TITLE: Alert's Title, NSString, Default is Nil/Can be Nil
    // SUBTITLE: Alert's Subtitle, NSString, Shouldn't be Nil
    // CUSTOM IMAGE: Alert's Vector, UIImage, Default is Nil/Can be Nil
    // DONE BUTTON TITLE: Alert's Main Close/Done Button Title, NSString, Default will be "Ok", Can be Nil
    // BUTTONS: Other Alert's Buttons Titles, NSArray of NSStrings, Can be Nil or max of 2 Buttons.
    
    /* USING BLOCK ACTION TO ADD BUTTONS -- Uncomment to Try it out
     
     [alert addButton:@"Block Button" withActionBlock:^{
        NSLog(@"Block Button Clicked");
        // Put your action here
    }];
     
     */
    
    alert.delegate = self;
    
    [alert showAlertInView:self
                 withTitle:_alertTitle
              withSubtitle:@"This is my alert's subtitle. Keep it short and concise. 😜"
           withCustomImage:_alertImage
       withDoneButtonTitle:nil
                andButtons:self.arrayOfButtonTitles];
    
    
    
}

#pragma mark - Helper Methods

- (void)FCAlertView:(FCAlertView *)alertView clickedButtonIndex:(NSInteger)index buttonTitle:(NSString *)title {
    
    NSLog(@"Button Clicked: %ld Title:%@", (long)index, title);
    
}

- (void)FCAlertDoneButtonClicked:(FCAlertView *)alertView {
    
    NSLog(@"Done Button Clicked");
    
}

- (void)FCAlertViewDismissed:(FCAlertView *)alertView {
    
    NSLog(@"Alert Dismissed");

}

- (void)FCAlertViewWillAppear:(FCAlertView *)alertView {
    
    NSLog(@"Alert Will Appear");

}

@end
