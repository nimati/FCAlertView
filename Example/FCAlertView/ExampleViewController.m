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
    
    _headerHeight = 230;

    // Orientation Detection for Example App
    
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(orientationChanged:)    name:UIDeviceOrientationDidChangeNotification  object:nil];

    // SETTING COLORS OF BUTTONS FOR THIS EXAMPLE VIEWCONTROLLER - Not related to FCAlertView
    
    self.redColor = [UIColor colorWithRed:190.0f/255.0f green:0.0f blue:0.0f alpha:1.0f];
    self.greenColor = [UIColor colorWithRed:42.0f/255.0f green:186.0f/255.0f blue:83.0f/255.0f alpha:1.0f];
    self.themeColor = [UIColor colorWithRed:59.0f/255.0f green:154.0f/255.0f blue:217.0f/255.0f alpha:1.0];
    
    // LIST OF ALL CUSTOMIZATION YOU CAN MAKE - Used For this Example App
    
    _alertViewOptions = [[NSMutableArray alloc] init];
    _alertViewLatestOptions = [[NSMutableArray alloc] init];
    _alertViewAnimationOptions = [[NSMutableArray alloc] init];
    
    _alertViewLatestOptionsOriginal = @[@{@"title" : @"Blur Background",
                                          @"description" : @"Turn on to add a blur effect to your view's background.",
                                          @"setting" : @"Off",
                                          @"status" : @0,
                                          @"customIndicator" : @0,
                                          @"selection" : @[@"Off", @"On"]},
                                        @{@"title" : @"Bounce Animation",
                                          @"description" : @"Turn on to add more natural animations to the alert.",
                                          @"setting" : @"Off",
                                          @"status" : @0,
                                          @"customIndicator" : @0,
                                          @"selection" : @[@"Off", @"On"]},
                                        @{@"title" : @"Text Field",
                                          @"description" : @"Turn on to add a textfield to the alert for input.",
                                          @"setting" : @"Off",
                                          @"status" : @0,
                                          @"customIndicator" : @0,
                                          @"selection" : @[@"Off", @"On"]},
                                        @{@"title" : @"Alert Sound",
                                          @"description" : @"Turn on to play a custom sound when the alert opens.",
                                          @"setting" : @"Off",
                                          @"status" : @0,
                                          @"customIndicator" : @0,
                                          @"selection" : @[@"Off", @"On"]},
                                        @{@"title" : @"Dark Theme",
                                          @"description" : @"Turn the alert into a dark color scheme to match the app.",
                                          @"setting" : @"Off",
                                          @"status" : @0,
                                          @"customIndicator" : @0,
                                          @"selection" : @[@"Off", @"On"]},
                                        @{@"title" : @"Round Buttons",
                                          @"description" : @"Detach Buttons from alert and make them more round.",
                                          @"setting" : @"Off",
                                          @"status" : @0,
                                          @"customIndicator" : @0,
                                          @"selection" : @[@"Off", @"On"]},
                                        @{@"title" : @"Full Circle Custom Image",
                                          @"description" : @"Makes the custom image of the alert full circle if there is one.",
                                          @"setting" : @"Off",
                                          @"status" : @0,
                                          @"customIndicator" : @0,
                                          @"selection" : @[@"Off", @"On"]},
                                        @{@"title" : @"Hide Separator Lines",
                                          @"description" : @"Hides all separator lines of the alert.",
                                          @"setting" : @"Off",
                                          @"status" : @0,
                                          @"customIndicator" : @0,
                                          @"selection" : @[@"Off", @"On"]},
                                        @{@"title" : @"Title Custom Font",
                                          @"description" : @"Specify a different font for the title - such as Avenir!",
                                          @"setting" : @"Off",
                                          @"status" : @0,
                                          @"customIndicator" : @0,
                                          @"selection" : @[@"Off", @"On"]},
                                        @{@"title" : @"Subtitle Custom Font",
                                          @"description" : @"Specify a different font for the subtitle - such as Avenir!",
                                          @"setting" : @"Off",
                                          @"status" : @0,
                                          @"customIndicator" : @0,
                                          @"selection" : @[@"Off", @"On"]},
                                        @{@"title" : @"Title Attributed Text",
                                          @"description" : @"Specify formatted text in the title.",
                                          @"setting" : @"Off",
                                          @"status" : @0,
                                          @"customIndicator" : @0,
                                          @"selection" : @[@"Off", @"On"]},
                                        @{@"title" : @"Title Custom Font",
                                          @"description" : @"Specify formatted text in the subtitle.",
                                          @"setting" : @"Off",
                                          @"status" : @0,
                                          @"customIndicator" : @0,
                                          @"selection" : @[@"Off", @"On"]}];
    
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
                                    @"description" : @"Choose from Pre-Set Success, Warning, Heart Rating and more.",
                                    @"setting" : @"Off",
                                    @"status" : @0,
                                    @"customIndicator" : @0,
                                    @"selection" : @[@"Off", @"Success", @"Caution", @"Warning", @"Progress", @"Hearts", @"Stars"]},
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
                                    @"selection" : @[@"Off", @"On"]},
                                  @{@"title" : @"Avoid Image Tint",
                                    @"description" : @"Turn off image tinting for the custom image.",
                                    @"setting" : @"Off",
                                    @"status" : @0,
                                    @"customIndicator" : @0,
                                    @"selection" : @[@"Off", @"On"]}];
    
    _alertViewAnimationOptionsOriginal = @[@{@"title" : @"Animate In",
                                             @"description" : @"Animate the Alert In from Top, Right, Bottom, or Left.",
                                             @"setting" : @"Off",
                                             @"status" : @0,
                                             @"customIndicator" : @0,
                                             @"selection" : @[@"Off", @"Top", @"Right", @"Bottom", @"Left"]},
                                           @{@"title" : @"Animate Out",
                                             @"description" : @"Animate the Alert Out to Top, Right, Bottom, or Left.",
                                             @"setting" : @"Off",
                                             @"status" : @0,
                                             @"customIndicator" : @0,
                                             @"selection" : @[@"Off", @"Top", @"Right", @"Bottom", @"Left"]}];
    
    _alertViewOptions = [_alertViewOptionsOriginal mutableCopy];
    _alertViewLatestOptions = [_alertViewLatestOptionsOriginal mutableCopy];
    _alertViewAnimationOptions = [_alertViewAnimationOptionsOriginal mutableCopy];
    
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
    
    CGFloat dummyViewHeight = _headerHeight;
    UIView *dummyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, dummyViewHeight)];
    self.tableView.tableHeaderView = dummyView;
    self.tableView.contentInset = UIEdgeInsetsMake(-dummyViewHeight, 0, 0, 0);
    
}

#pragma mark - TableView Datasource Changes

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
        return _alertViewLatestOptions.count;
    else if (section == 1)
        return _alertViewOptions.count;
    else if (section == 2)
        return _alertViewAnimationOptions.count;
    else
        return 0;
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
        
        if (indexPath.section == 0) {
            
            if (![[[_alertViewLatestOptions objectAtIndex:indexPath.row] objectForKey:@"customIndicator"] isEqual:@1]) {
                if ([[[_alertViewLatestOptions objectAtIndex:indexPath.row] objectForKey:@"status"] isEqual:@0])
                    [circleLayer setFillColor:[_redColor CGColor]];
                else
                    [circleLayer setFillColor:[_greenColor CGColor]];
            } else {
                NSString *selectedColor = [[[_alertViewLatestOptions objectAtIndex:indexPath.row] objectForKey:@"selection"]
                                           objectAtIndex:[[[_alertViewLatestOptions objectAtIndex:indexPath.row] objectForKey:@"status"] integerValue]];
                
                [circleLayer setFillColor:[[self checkFlatColors:selectedColor] CGColor]];
                
            }
            
        } else if (indexPath.section == 1) {
            
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
            
        } else if (indexPath.section == 2) {
            
            if (![[[_alertViewAnimationOptions objectAtIndex:indexPath.row] objectForKey:@"customIndicator"] isEqual:@1]) {
                if ([[[_alertViewAnimationOptions objectAtIndex:indexPath.row] objectForKey:@"status"] isEqual:@0])
                    [circleLayer setFillColor:[_redColor CGColor]];
                else
                    [circleLayer setFillColor:[_greenColor CGColor]];
            } else {
                NSString *selectedColor = [[[_alertViewAnimationOptions objectAtIndex:indexPath.row] objectForKey:@"selection"]
                                           objectAtIndex:[[[_alertViewAnimationOptions objectAtIndex:indexPath.row] objectForKey:@"status"] integerValue]];
                
                [circleLayer setFillColor:[[self checkFlatColors:selectedColor] CGColor]];
                
            }
            
        }
        
        // Option Title Label
        
        UILabel *optionTitle = [[UILabel alloc] initWithFrame:CGRectMake(25.0f, 0.0f, self.tableView.frame.size.width - 120.0f, 40.0f)];
        optionTitle.numberOfLines = 1;
        optionTitle.font = [UIFont systemFontOfSize:18.0f weight:UIFontWeightMedium];
        optionTitle.textColor = [UIColor colorWithWhite:80.0f/255.0f alpha:1.0];
        optionTitle.textAlignment = NSTextAlignmentLeft;
        if (indexPath.section == 0)
            optionTitle.text = [[_alertViewLatestOptions objectAtIndex:indexPath.row] objectForKey:@"title"];
        else if (indexPath.section == 1)
            optionTitle.text = [[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"title"];
        else if (indexPath.section == 2)
            optionTitle.text = [[_alertViewAnimationOptions objectAtIndex:indexPath.row] objectForKey:@"title"];

        // Option Description Label
        
        UILabel *optionDesc = [[UILabel alloc] initWithFrame:CGRectMake(25.0f, 25.0f, self.tableView.frame.size.width - 160.0f, 50.0f)];
        optionDesc.numberOfLines = 2;
        optionDesc.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightRegular];
        optionDesc.textColor = [UIColor colorWithWhite:120.0f/255.0f alpha:1.0];
        optionDesc.textAlignment = NSTextAlignmentLeft;
        if (indexPath.section == 0)
            optionDesc.text = [[_alertViewLatestOptions objectAtIndex:indexPath.row] objectForKey:@"description"];
        else if (indexPath.section == 1)
            optionDesc.text = [[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"description"];
        else if (indexPath.section == 2)
            optionDesc.text = [[_alertViewAnimationOptions objectAtIndex:indexPath.row] objectForKey:@"description"];

        // Option Setting Label
        
        NSString *selectedSetting;
        
        if (indexPath.section == 0)
            selectedSetting = [[_alertViewLatestOptions objectAtIndex:indexPath.row] objectForKey:@"setting"];
        else if (indexPath.section == 1)
            selectedSetting = [[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"setting"];
        else if (indexPath.section == 2)
            selectedSetting = [[_alertViewAnimationOptions objectAtIndex:indexPath.row] objectForKey:@"setting"];

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
    
    NSMutableDictionary *selectedCell;
    
    if (indexPath.section == 0)
        selectedCell = [[_alertViewLatestOptions objectAtIndex:indexPath.row] mutableCopy];
    else if (indexPath.section == 1)
        selectedCell = [[_alertViewOptions objectAtIndex:indexPath.row] mutableCopy];
    else if (indexPath.section == 2)
        selectedCell = [[_alertViewAnimationOptions objectAtIndex:indexPath.row] mutableCopy];

    NSInteger status = [[selectedCell objectForKey:@"status"] integerValue];
    NSArray *selection = [selectedCell objectForKey:@"selection"];
    
    status = (status + 1) %(selection.count);
    
    [selectedCell setObject:[NSNumber numberWithInteger:status] forKey:@"status"];
    
    NSString *selectedSetting;
    
    if (indexPath.section == 0)
        selectedSetting = [[[_alertViewLatestOptions objectAtIndex:indexPath.row] objectForKey:@"selection"] objectAtIndex:status];
    else if (indexPath.section == 1)
        selectedSetting = [[[_alertViewOptions objectAtIndex:indexPath.row] objectForKey:@"selection"] objectAtIndex:status];
    else if (indexPath.section == 2)
        selectedSetting = [[[_alertViewAnimationOptions objectAtIndex:indexPath.row] objectForKey:@"selection"] objectAtIndex:status];

    [selectedCell setObject:selectedSetting forKey:@"setting"];
    
    if (indexPath.section == 0)
        [_alertViewLatestOptions replaceObjectAtIndex:indexPath.row withObject:selectedCell];
    else if (indexPath.section == 1)
        [_alertViewOptions replaceObjectAtIndex:indexPath.row withObject:selectedCell];
    else if (indexPath.section == 2)
        [_alertViewAnimationOptions replaceObjectAtIndex:indexPath.row withObject:selectedCell];

    NSLog(@"For: %@ Now Selected: %@", [selectedCell objectForKey:@"title"], [selection objectAtIndex:status]);
    
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(void) handleLongPress: (UIGestureRecognizer *)longPress {
    
    if (longPress.state==UIGestureRecognizerStateBegan) {
        
        CGPoint pressPoint = [longPress locationInView:self.tableView];
        NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:pressPoint];
        
        NSMutableDictionary *selectedCell;
        
        if (indexPath.section == 0) {
            
            selectedCell = [[_alertViewLatestOptions objectAtIndex:indexPath.row] mutableCopy];
            [selectedCell setObject:[[_alertViewLatestOptionsOriginal objectAtIndex:indexPath.row] objectForKey:@"status"] forKey:@"status"];
            [selectedCell setObject:[[_alertViewLatestOptionsOriginal objectAtIndex:indexPath.row] objectForKey:@"setting"] forKey:@"setting"];
            [_alertViewLatestOptions replaceObjectAtIndex:indexPath.row withObject:selectedCell];
            
            NSLog(@"For: %@ Reset to: %@",
                  [selectedCell objectForKey:@"title"],
                  [[_alertViewLatestOptionsOriginal objectAtIndex:indexPath.row] objectForKey:@"setting"]);
            
        } else if (indexPath.section == 1) {
            
            selectedCell = [[_alertViewOptions objectAtIndex:indexPath.row] mutableCopy];
            [selectedCell setObject:[[_alertViewOptionsOriginal objectAtIndex:indexPath.row] objectForKey:@"status"] forKey:@"status"];
            [selectedCell setObject:[[_alertViewOptionsOriginal objectAtIndex:indexPath.row] objectForKey:@"setting"] forKey:@"setting"];
            [_alertViewOptions replaceObjectAtIndex:indexPath.row withObject:selectedCell];
            
            NSLog(@"For: %@ Reset to: %@",
                  [selectedCell objectForKey:@"title"],
                  [[_alertViewOptionsOriginal objectAtIndex:indexPath.row] objectForKey:@"setting"]);
        
        } else if (indexPath.section == 2) {
            
            selectedCell = [[_alertViewAnimationOptions objectAtIndex:indexPath.row] mutableCopy];
            [selectedCell setObject:[[_alertViewAnimationOptionsOriginal objectAtIndex:indexPath.row] objectForKey:@"status"] forKey:@"status"];
            [selectedCell setObject:[[_alertViewAnimationOptionsOriginal objectAtIndex:indexPath.row] objectForKey:@"setting"] forKey:@"setting"];
            [_alertViewAnimationOptions replaceObjectAtIndex:indexPath.row withObject:selectedCell];
            
            NSLog(@"For: %@ Reset to: %@",
                  [selectedCell objectForKey:@"title"],
                  [[_alertViewAnimationOptionsOriginal objectAtIndex:indexPath.row] objectForKey:@"setting"]);
            
        }
        
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationNone];
        
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 120)];
        headerView.backgroundColor = [UIColor colorWithWhite:239.0f/255.0f alpha:1.0];
        
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, headerView.frame.size.width - 60, 20)];
        headerLabel.text = @"NEW FEATURES • V1.2.0+";
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"NEW FEATURES • V1.2.0+"];
        [attributedString addAttribute:NSKernAttributeName
                                 value:@(3.0)
                                 range:NSMakeRange(0, headerLabel.text.length)];
        
        headerLabel.attributedText = attributedString;
        
        headerLabel.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightMedium];
        headerLabel.textColor = [UIColor colorWithWhite:150.0f/255.0f alpha:1.0];
        headerLabel.textAlignment = NSTextAlignmentLeft;
        headerLabel.numberOfLines = 1;
        headerLabel.backgroundColor = [UIColor clearColor];
        
        [headerView addSubview:headerLabel];
        
        return headerView;
     
    }
    
    if (section == 2) {
    
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 120)];
        headerView.backgroundColor = [UIColor colorWithWhite:239.0f/255.0f alpha:1.0];
        
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, headerView.frame.size.width - 60, 20)];
        headerLabel.text = @"ANIMATION OPTIONS";
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"ANIMATION OPTIONS"];
        [attributedString addAttribute:NSKernAttributeName
                                 value:@(3.0)
                                 range:NSMakeRange(0, headerLabel.text.length)];
        
        headerLabel.attributedText = attributedString;
        
        headerLabel.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightMedium];
        headerLabel.textColor = [UIColor colorWithWhite:150.0f/255.0f alpha:1.0];
        headerLabel.textAlignment = NSTextAlignmentLeft;
        headerLabel.numberOfLines = 1;
        headerLabel.backgroundColor = [UIColor clearColor];
        
        [headerView addSubview:headerLabel];
        
        return headerView;
        
    } else {
        
        if (!_suggestionBarClosed) {
            
            UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 120)];
            headerView.backgroundColor = [UIColor colorWithWhite:239.0f/255.0f alpha:1.0];
            
            // Separator Line View
            
            UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 3)];
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
            
            UILabel *headerLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, headerView.frame.size.width - 60, 20)];
            headerLabel2.text = @"ALL CUSTOMIZATIONS";
            
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"ALL CUSTOMIZATIONS"];
            [attributedString addAttribute:NSKernAttributeName
                                     value:@(3.0)
                                     range:NSMakeRange(0, headerLabel2.text.length)];
            
            headerLabel2.attributedText = attributedString;
            
            headerLabel2.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightMedium];
            headerLabel2.textColor = [UIColor colorWithWhite:150.0f/255.0f alpha:1.0];
            headerLabel2.textAlignment = NSTextAlignmentLeft;
            headerLabel2.numberOfLines = 1;
            headerLabel2.backgroundColor = [UIColor clearColor];
            
            [headerView addSubview:headerLabel2];
            
            return headerView;
            
        } else {
            
            UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 120)];
            headerView.backgroundColor = [UIColor colorWithWhite:239.0f/255.0f alpha:1.0];
            
            UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, headerView.frame.size.width - 60, 20)];
            headerLabel.text = @"ALL CUSTOMIZATIONS";
            
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"ALL CUSTOMIZATIONS"];
            [attributedString addAttribute:NSKernAttributeName
                                     value:@(3.0)
                                     range:NSMakeRange(0, headerLabel.text.length)];
            
            headerLabel.attributedText = attributedString;
            
            headerLabel.font = [UIFont systemFontOfSize:14.0f weight:UIFontWeightMedium];
            headerLabel.textColor = [UIColor colorWithWhite:150.0f/255.0f alpha:1.0];
            headerLabel.textAlignment = NSTextAlignmentLeft;
            headerLabel.numberOfLines = 1;
            headerLabel.backgroundColor = [UIColor clearColor];
            
            [headerView addSubview:headerLabel];
            
            return headerView;
            
        }
        
    }
    
}

- (void) closeSuggestionBar {
    
    _suggestionBarClosed = 1;
    
    _headerHeight = 50;
    
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
    
    if (section == 0 || section == 2)
        return 50;
    else
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
    if ([MFMailComposeViewController canSendMail]) {
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
        [mc setToRecipients:toRecipents];
        
        [self presentViewController:mc animated:YES completion:NULL];

    } else {
        
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = @"nima6tahami@gmail.com";
        
        FCAlertView *alert = [[FCAlertView alloc] init];
        [alert showAlertWithTitle:nil withSubtitle:@"Email Copied to Clipboard" withCustomImage:nil withDoneButtonTitle:nil andButtons:nil];
        [alert makeAlertTypeSuccess];
        
    }
    
    
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
    
    //For use with Attributed Text demo
    BOOL useAttributedTitle = NO;
    BOOL useAttributedSubTitle = NO;
    
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
    
    if ([[[_alertViewOptions objectAtIndex:6] objectForKey:@"setting"] isEqual:@"Progress"])
        [alert makeAlertTypeProgress];
    
    if ([[[_alertViewOptions objectAtIndex:6] objectForKey:@"setting"] isEqual:@"Hearts"])
        [alert makeAlertTypeRateHearts:^(NSInteger rating) {
            NSLog(@"Your Rating: %ld", (long)rating); // Use the Rating as you'd like
        }];
    
    if ([[[_alertViewOptions objectAtIndex:6] objectForKey:@"setting"] isEqual:@"Stars"])
        [alert makeAlertTypeRateStars:^(NSInteger rating) {
            NSLog(@"Your Rating: %ld", (long)rating); // Use the Rating as you'd like
        }];
    
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
    
    // Avoiding Custom Image Tint
    
    if (![[[_alertViewOptions objectAtIndex:12] objectForKey:@"setting"] isEqual:@"Off"])
        alert.avoidCustomImageTint = 1;
    else
        alert.avoidCustomImageTint = 0;
    
    // NEW FEATURES SECTION
    // Blur Background Effect
    
    if (![[[_alertViewLatestOptions objectAtIndex:0] objectForKey:@"setting"] isEqual:@"Off"])
        alert.blurBackground = 1;
    else
        alert.blurBackground = 0;
    
    // Bounce Animations Effect
    
    if (![[[_alertViewLatestOptions objectAtIndex:1] objectForKey:@"setting"] isEqual:@"Off"])
        alert.bounceAnimations = 1;
    else
        alert.bounceAnimations = 0;
    
    // Adding TextField
    
    if (![[[_alertViewLatestOptions objectAtIndex:2] objectForKey:@"setting"] isEqual:@"Off"]) {
        [alert addTextFieldWithPlaceholder:@"Email Address" andTextReturnBlock:^(NSString *text) {
            NSLog(@"TextField Returns: %@", text); // Do what you'd like with the text returned from the field
            
        }];
        
        UITextField *testField = [[UITextField alloc] init];
        testField.placeholder = @"I'm Custom!";
        testField.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
        testField.secureTextEntry = 1;
        
        [alert addTextFieldWithCustomTextField:testField andPlaceholder:nil andTextReturnBlock:^(NSString *text) {
            NSLog(@"Custom TextField Returns: %@", text); // Do what you'd like with the text returned from the field
        }];
        
    // Add this in for a second TextField (repeat for up to 4 fields as deired)
        
    /*[alert addTextFieldWithPlaceholder:@"First Name" andTextReturnBlock:^(NSString *text) {
        NSLog(@"TextField Returns: %@", text); // Do what you'd like with the text returned from the field
    }];*/

    }
    
    // Alert Sound
    
    if (![[[_alertViewLatestOptions objectAtIndex:3] objectForKey:@"setting"] isEqual:@"Off"])
        [alert setAlertSoundWithFileName:@"Elevator Ding.mp3"];
    
    // Alert Dark Theme
    
    if (![[[_alertViewLatestOptions objectAtIndex:4] objectForKey:@"setting"] isEqual:@"Off"])
        alert.darkTheme = YES;
    
    // Alert Round/Detach Buttons
    
    if (![[[_alertViewLatestOptions objectAtIndex:5] objectForKey:@"setting"] isEqual:@"Off"])
        alert.detachButtons = YES;
    
    // Alert Full Circle Custom Image
    
    if (![[[_alertViewLatestOptions objectAtIndex:6] objectForKey:@"setting"] isEqual:@"Off"])
        alert.fullCircleCustomImage = YES;
    
    // Hide Alert's Separator Lines
    
    if (![[[_alertViewLatestOptions objectAtIndex:7] objectForKey:@"setting"] isEqual:@"Off"])
        alert.hideSeparatorLineView = YES;
    
    // Set Title Font to Avenir
    
    if (![[[_alertViewLatestOptions objectAtIndex:8] objectForKey:@"setting"] isEqual:@"Off"])
        alert.titleFont = [UIFont fontWithName:@"Avenir" size:18.0];
    
    // Set Subtitle Font to Avenir
    
    if (![[[_alertViewLatestOptions objectAtIndex:9] objectForKey:@"setting"] isEqual:@"Off"])
        alert.subtitleFont = [UIFont fontWithName:@"Avenir" size:15.0];

    // Set Title to Attributed Text
    
    if (![[[_alertViewLatestOptions objectAtIndex:10] objectForKey:@"setting"] isEqual:@"Off"])
        useAttributedTitle = YES;

    // Set Subtitle to Attributed Text
    
    if (![[[_alertViewLatestOptions objectAtIndex:11] objectForKey:@"setting"] isEqual:@"Off"])
        useAttributedSubTitle = YES;

    // ALERT ANIMATIONS SECTION
    // Animate In Options
    
    if ([[[_alertViewAnimationOptions objectAtIndex:0] objectForKey:@"setting"] isEqual:@"Top"]) {
        alert.animateAlertInFromTop = YES;
    }
    
    if ([[[_alertViewAnimationOptions objectAtIndex:0] objectForKey:@"setting"] isEqual:@"Right"]) {
        alert.animateAlertInFromRight = YES;
    }
    
    if ([[[_alertViewAnimationOptions objectAtIndex:0] objectForKey:@"setting"] isEqual:@"Bottom"]) {
        alert.animateAlertInFromBottom = YES;
    }
    
    if ([[[_alertViewAnimationOptions objectAtIndex:0] objectForKey:@"setting"] isEqual:@"Left"]) {
        alert.animateAlertInFromLeft = YES;
    }
    
    // Animate Out Options
        
    if ([[[_alertViewAnimationOptions objectAtIndex:1] objectForKey:@"setting"] isEqual:@"Top"]) {
        alert.animateAlertOutToTop = YES;
    }
    
    if ([[[_alertViewAnimationOptions objectAtIndex:1] objectForKey:@"setting"] isEqual:@"Right"]) {
        alert.animateAlertOutToRight = YES;
    }
    
    if ([[[_alertViewAnimationOptions objectAtIndex:1] objectForKey:@"setting"] isEqual:@"Bottom"]) {
        alert.animateAlertOutToBottom = YES;
    }
    
    if ([[[_alertViewAnimationOptions objectAtIndex:1] objectForKey:@"setting"] isEqual:@"Left"]) {
        alert.animateAlertOutToLeft = YES;
    }
    
    // ***** THIS SECTION IS FOR ADDING BUTTONS TO THE ALERT USING THE BLOCK ACTION METHOD *****
    
    /* USING BLOCK ACTION TO ADD BUTTONS -- Uncomment to Try it out
     
     [alert addButton:@"Block Button" withActionBlock:^{
     NSLog(@"Block Button Clicked");
     // Put your action here
     }];
     
     */
    
    /* USING BLOCK ACTION FOR DONE BUTTON -- Uncomment to Try it out
     
     [alert doneActionBlock:^{
     NSLog(@"Done Action");
     }];
     
     */
    
    // ***** END OF BLOCK ACTION METHOD OF ADDING BUTTONS *****
    
    // PRESENTING THE FCALERTVIEW // 4) Add This to finally present FCAlertView in your view's window
    
    // TITLE: Alert's Title, NSString, Default is Nil/Can be Nil
    // SUBTITLE: Alert's Subtitle, NSString, Shouldn't be Nil
    // CUSTOM IMAGE: Alert's Vector, UIImage, Default is Nil/Can be Nil
    // DONE BUTTON TITLE: Alert's Main Close/Done Button Title, NSString, Default will be "Ok", Can be Nil
    // BUTTONS: Other Alert's Buttons Titles, NSArray of NSStrings, Can be Nil or max of 2 Buttons.
    
    alert.delegate = self; // 5) Add This is You Would like to Use Buttons without Action Blocks
    
    if (useAttributedSubTitle && useAttributedTitle) {
        [alert showAlertWithAttributedTitle:[self getAttributedTitle]
                  withAttributedSubtitle:[self getAttributedSubtitle]
               withCustomImage:_alertImage
           withDoneButtonTitle:nil
                    andButtons:self.arrayOfButtonTitles];
    } else if (useAttributedTitle) {
        [alert showAlertWithAttributedTitle:[self getAttributedTitle]
                  withSubtitle:@"This is my alert's subtitle. Keep it short and concise. 😜"
               withCustomImage:_alertImage
           withDoneButtonTitle:nil
                    andButtons:self.arrayOfButtonTitles];
    } else if (useAttributedSubTitle) {
        [alert showAlertWithTitle:_alertTitle
                  withAttributedSubtitle:[self getAttributedSubtitle]
               withCustomImage:_alertImage
           withDoneButtonTitle:nil
                    andButtons:self.arrayOfButtonTitles];
    } else {
        [alert showAlertInView:self
                     withTitle:_alertTitle
                  withSubtitle:@"This is my alert's subtitle. Keep it short and concise. 😜"
               withCustomImage:_alertImage
           withDoneButtonTitle:nil
                    andButtons:self.arrayOfButtonTitles];
    }
}

-(NSAttributedString *)getAttributedTitle {
    NSString *text = @"Alert Title";
    
    NSDictionary *attrib = @{
                             NSForegroundColorAttributeName: [UIColor blackColor],
                             NSFontAttributeName: [UIFont systemFontOfSize:18.0 weight:UIFontWeightRegular]
                             };
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text attributes:attrib];
    
    NSRange nameRange = [text rangeOfString:@"Title"];
    UIFont *italics = [UIFont systemFontOfSize:18.0 weight:UIFontWeightHeavy];
    [str setAttributes:@{NSFontAttributeName:italics} range:nameRange];
    
    return str;
}

-(NSAttributedString *)getAttributedSubtitle {
    NSString *text = @"This is my alert's subtitle. Keep it short and concise. 😜";
    
    NSDictionary *attrib = @{
                             NSForegroundColorAttributeName: [UIColor blackColor],
                             NSFontAttributeName: [UIFont systemFontOfSize:15.0 weight:UIFontWeightRegular]
                             };
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text attributes:attrib];
    
    NSRange nameRange = [text rangeOfString:@"my"];
    UIFont *newFont = [UIFont systemFontOfSize:15.0 weight:UIFontWeightHeavy];
    [str setAttributes:@{NSFontAttributeName:newFont} range:nameRange];

    nameRange = [text rangeOfString:@"short"];
    newFont = [UIFont systemFontOfSize:15.0 weight:UIFontWeightThin];
    [str setAttributes:@{NSFontAttributeName:newFont} range:nameRange];

    nameRange = [text rangeOfString:@"concise"];
    newFont = [UIFont systemFontOfSize:15.0 weight:UIFontWeightHeavy];
    [str setAttributes:@{NSFontAttributeName:newFont} range:nameRange];

    return str;
}

#pragma mark - Handling Orientation Change for Example App

- (void)orientationChanged:(NSNotification *)notification{
    [self adjustViewsForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (void) adjustViewsForOrientation:(UIInterfaceOrientation) orientation {
    
    [self.tableView reloadData];
    
    switch (orientation)
    {
        case UIInterfaceOrientationPortrait:
        case UIInterfaceOrientationPortraitUpsideDown:
        {
        }
            
            break;
        case UIInterfaceOrientationLandscapeLeft:
        case UIInterfaceOrientationLandscapeRight:
        {
        }
            break;
        case UIInterfaceOrientationUnknown:break;
    }
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
