//
//  FCAlertView.m
//  ShiftRide
//
//  Created by Nima Tahami on 2016-07-10.
//  Copyright © 2016 Nima Tahami. All rights reserved.
//

#import "FCAlertView.h"

@implementation FCAlertView

- (id)init
{
    self = [super init];
    if (self) {
        
        // INITIALIZATIONS - Setting Up Basic UI Adjustments
        
        CGSize result = [[UIScreen mainScreen] bounds].size;
        
        self.frame = CGRectMake(0,
                                0,
                                result.width,
                                result.height);
        
        self.backgroundColor = [UIColor clearColor];
        
        // ALERTVIEW BACKGROUND - Setting up Background View
        
        _alertBackground = [[UIView alloc] init];
        _alertBackground.frame = CGRectMake(0,
                                            0,
                                            result.width,
                                            result.height);
        _alertBackground.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.35]; // set color as you want.
        
        [self addSubview:_alertBackground];
        
        // PRESET FLAT COLORS - Setting up RGB of Flat Colors - Put in another file? REMOVE
        
        _flatTurquoise = [UIColor colorWithRed:26.0/255.0f green:188.0/255.0f blue:156.0/255.0f alpha:1.0];
        _flatGreen = [UIColor colorWithRed:39.0/255.0f green:174.0/255.0f blue:96.0/255.0f alpha:1.0];
        _flatBlue = [UIColor colorWithRed:41.0/255.0f green:128.0/255.0f blue:185.0/255.0f alpha:1.0];
        _flatMidnight = [UIColor colorWithRed:44.0/255.0f green:62.0/255.0f blue:80.0/255.0f alpha:1.0];
        _flatPurple = [UIColor colorWithRed:142.0/255.0f green:68.0/255.0f blue:173.0/255.0f alpha:1.0];
        _flatOrange = [UIColor colorWithRed:243.0/255.0f green:156.0/255.0f blue:18.0/255.0f alpha:1.0];
        _flatRed = [UIColor colorWithRed:192.0/255.0f green:57.0/255.0f blue:43.0/255.0f alpha:1.0];
        _flatSilver = [UIColor colorWithRed:189.0/255.0f green:195.0/255.0f blue:199.0/255.0f alpha:1.0];
        _flatGray = [UIColor colorWithRed:127.0/255.0f green:140.0/255.0f blue:141.0/255.0f alpha:1.0];
        
        // CUSTOMIZATIONS - Setting Default Customization Settings & Checks
        
        _numberOfButtons = 0;
        _autoHideSeconds = 0;
        _cornerRadius = 18.0f;
        
        _dismissOnOutsideTouch = NO;
        _hideAllButtons = NO;
        _hideDoneButton = NO;
        
        defaultSpacing = 105.0f;
        defaultHeight = 200.0f;
        
        [self checkCustomizationValid];
        
    }
    
    return self;
    
}

#pragma mark - Customization Data Checkpoint

- (void) checkCustomizationValid {
    
    if (_subTitle == nil || [_subTitle isEqualToString:@""])
        if (_title == nil || [_title isEqualToString:@""])
            _subTitle = @"You need to have a title or subtitle to use FCAlertView 😀";
    
    if (doneTitle == nil || [doneTitle isEqualToString:@""]) {
        doneTitle = @"Ok";
    }
    
    if (_cornerRadius == 0.0f)
        _cornerRadius = 18.0f;
    
    if (vectorImage != nil)
        alertViewWithVector = 1;
    
}

#pragma mark - Touch Events

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInView:_alertBackground];
    CGPoint touchPoint2 = [touch locationInView:alertViewContents];
    
    BOOL isPointInsideBackview = [_alertBackground pointInside:touchPoint withEvent:nil];
    BOOL isPointInsideAlertView = [alertViewContents pointInside:touchPoint2 withEvent:nil];
    
    if (_dismissOnOutsideTouch && isPointInsideBackview && !isPointInsideAlertView)
        [self dismissAlertView];
    
}

#pragma mark - Drawing AlertView

- (void)drawRect:(CGRect)rect {
    
    CGSize result = [[UIScreen mainScreen] bounds].size;
    
    CGRect alertViewFrame;
    
    self.alpha = 0;
    
    // Adjusting AlertView Frames
    
    if (alertViewWithVector) // Frames for when AlertView contains an image
        alertViewFrame = CGRectMake(self.frame.size.width/2 - ((result.width - defaultSpacing)/2),
                                    self.frame.size.height/2 - (200.0f/2),
                                    result.width - defaultSpacing,
                                    defaultHeight);
    else
        alertViewFrame = CGRectMake(self.frame.size.width/2 - ((result.width - defaultSpacing)/2),
                                    self.frame.size.height/2 - (170.0f/2),
                                    result.width - defaultSpacing,
                                    defaultHeight - 30);
    
    if (self.title == nil) // Frames for when AlertView doesn't contain a title
        alertViewFrame = CGRectMake(self.frame.size.width/2 - ((result.width - defaultSpacing)/2),
                                    self.frame.size.height/2 - ((alertViewFrame.size.height - 50)/2),
                                    result.width - defaultSpacing,
                                    alertViewFrame.size.height - 10);
    
    if (_hideAllButtons) { // Frames for when AlertView has hidden all buttons
        alertViewFrame = CGRectMake(self.frame.size.width/2 - ((result.width - defaultSpacing)/2),
                                    self.frame.size.height/2 - ((alertViewFrame.size.height - 50)/2),
                                    result.width - defaultSpacing,
                                    alertViewFrame.size.height - 45);
        
    } else {
        if (_hideDoneButton && _numberOfButtons == 0) { // Frames for when AlertView has hidden the DONE/DISMISS button
            alertViewFrame = CGRectMake(self.frame.size.width/2 - ((result.width - defaultSpacing)/2),
                                        self.frame.size.height/2 - ((alertViewFrame.size.height - 50)/2),
                                        result.width - defaultSpacing,
                                        alertViewFrame.size.height - 45);
        }
        if (!_hideDoneButton && _numberOfButtons >= 2) // Frames for AlertView with 2 added buttons (vertical buttons)
            alertViewFrame = CGRectMake(self.frame.size.width/2 - ((result.width - defaultSpacing)/2),
                                        self.frame.size.height/2 - ((alertViewFrame.size.height - 50 + 140)/2),
                                        result.width - defaultSpacing,
                                        alertViewFrame.size.height - 50 + 140);
    }
    
    // Setting Up Contents of AlertView
    
    alertViewContents = [[UIView alloc] initWithFrame:alertViewFrame];
    [self addSubview:alertViewContents];
    
    alertView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                         0,
                                                         alertViewFrame.size.width,
                                                         alertViewFrame.size.height)];
    
    // Setting Background Color of AlertView
    
    if (alertViewWithVector)
        alertView.backgroundColor = [UIColor clearColor];
    else
        alertView.backgroundColor = [UIColor whiteColor];
    
    [alertViewContents addSubview:alertView];
    
    // CREATING ALERTVIEW
    // CUSTOM SHAPING - Displaying Cut out circle for Vector Type Alerts
    
    int radius = alertView.frame.size.width;
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0,
                                                                                0,
                                                                                self.frame.size.width,
                                                                                alertView.bounds.size.height)
                                                        cornerRadius:0];
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(alertViewFrame.size.width/2 - 33.75f,
                                                                                  -33.75f,
                                                                                  67.5f,
                                                                                  67.5f)
                                                          cornerRadius:radius];
    [rectPath appendPath:circlePath];
    [rectPath setUsesEvenOddFillRule:YES];
    
    CAShapeLayer *fillLayer = [CAShapeLayer layer];
    fillLayer.path = rectPath.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    fillLayer.fillColor = [UIColor whiteColor].CGColor;
    fillLayer.opacity = 1.0;
    
    if (alertViewWithVector)
        [alertView.layer addSublayer:fillLayer];
    
    // HEADER VIEW - With Title & Subtitle
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15.0f,
                                                                    20.0f + (alertViewWithVector * 30),
                                                                    alertViewFrame.size.width - 30.0f,
                                                                    20.0f)];
    titleLabel.font = [UIFont systemFontOfSize:18.0f weight:UIFontWeightMedium];
    titleLabel.numberOfLines = 1;
    titleLabel.textColor = self.titleColor;
    titleLabel.text = self.title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    NSInteger descriptionLevel = 45.0f;
    
    if (_title == nil)
        descriptionLevel = 25.0f;
    
    UILabel *descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(25.0f,
                                                                          descriptionLevel + (alertViewWithVector * 30),
                                                                          alertViewFrame.size.width - 50.0f,
                                                                          60.0f)];
    descriptionLabel.font = [UIFont systemFontOfSize:15.0f weight:UIFontWeightLight];
    descriptionLabel.numberOfLines = 4;
    descriptionLabel.textColor = self.subTitleColor;
    descriptionLabel.text = self.subTitle;
    descriptionLabel.textAlignment = NSTextAlignmentCenter;
    descriptionLabel.adjustsFontSizeToFitWidth = YES;
    
    if (_title == nil) {
        descriptionLabel.font = [UIFont systemFontOfSize:16.0f weight:UIFontWeightRegular];
    }
    
    // SEPARATOR LINE - Seperating Header View with Button View
    
    UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                         alertViewFrame.size.height - 47,
                                                                         alertViewFrame.size.width,
                                                                         2)];
    separatorLineView.backgroundColor = [UIColor colorWithWhite:100.0f/255.0f alpha:1.0]; // set color as you want.
    
    // BUTTON(S) VIEW - Section containing all Buttons
    
    if (_numberOfButtons == 0) { // View only contains DONE/DISMISS Button
        
        UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        if (_colorScheme == nil)
            doneButton.backgroundColor = [UIColor whiteColor];
        else
            doneButton.backgroundColor = _colorScheme;
        doneButton.frame = CGRectMake(0,
                                      alertViewFrame.size.height - 45,
                                      alertViewFrame.size.width,
                                      45);
        [doneButton setTitle:doneTitle forState:UIControlStateNormal];
        [doneButton addTarget:self action:@selector(donePressed) forControlEvents:UIControlEventTouchUpInside];
        doneButton.titleLabel.font = [UIFont systemFontOfSize:18.0f weight:UIFontWeightMedium];
        if (_colorScheme != nil)
            doneButton.tintColor = [UIColor whiteColor];
        
        if (!_hideAllButtons && !_hideDoneButton)
            [alertView addSubview:doneButton];
        
    } else if (_numberOfButtons == 1) { // View also contains OTHER (One) Button
        
        UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        if (_colorScheme == nil)
            doneButton.backgroundColor = [UIColor whiteColor];
        else
            doneButton.backgroundColor = _colorScheme;
        doneButton.frame = CGRectMake(alertViewFrame.size.width/2,
                                      alertViewFrame.size.height - 45,
                                      alertViewFrame.size.width/2,
                                      45);
        [doneButton setTitle:doneTitle forState:UIControlStateNormal];
        [doneButton addTarget:self action:@selector(donePressed) forControlEvents:UIControlEventTouchUpInside];
        doneButton.titleLabel.font = [UIFont systemFontOfSize:16.0f weight:UIFontWeightMedium];
        if (_colorScheme != nil)
            doneButton.tintColor = [UIColor whiteColor];
        
        UIButton *otherButton = [UIButton buttonWithType:UIButtonTypeSystem];
        otherButton.backgroundColor = [UIColor whiteColor];
        otherButton.frame = CGRectMake(0,
                                       alertViewFrame.size.height - 45,
                                       alertViewFrame.size.width/2,
                                       45);
        if (_hideDoneButton)
            otherButton.frame = CGRectMake(0,
                                           alertViewFrame.size.height - 45,
                                           alertViewFrame.size.width,
                                           45);
        [otherButton setTitle:[buttonTitles objectAtIndex:0] forState:UIControlStateNormal];
        [otherButton addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
        otherButton.titleLabel.font = [UIFont systemFontOfSize:16.0f weight:UIFontWeightRegular];
        otherButton.tintColor = self.colorScheme;
        otherButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        otherButton.titleLabel.minimumScaleFactor = 0.8;
        
        if (!_hideAllButtons) {
            [alertView addSubview:otherButton];
        }
        
        if (!_hideAllButtons && !_hideDoneButton)
            [alertView addSubview:doneButton];
        
        UIView *horizontalSeparator = [[UIView alloc] initWithFrame:CGRectMake(alertViewFrame.size.width/2 - 1,
                                                                               otherButton.frame.origin.y - 2,
                                                                               2,
                                                                               45)];
        
        horizontalSeparator.backgroundColor = [UIColor colorWithWhite:100.0f/255.0f alpha:1.0]; // set color as you want.
        
        UIVisualEffect *blurEffect;
        blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        
        UIVisualEffectView *visualEffectView3;
        visualEffectView3 = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        visualEffectView3.frame = horizontalSeparator.bounds;
        visualEffectView3.userInteractionEnabled = NO;
        [horizontalSeparator addSubview:visualEffectView3];
        
        if (!_hideAllButtons && !_hideDoneButton) {
            [alertView addSubview:horizontalSeparator];
        }
        
    } else if (_numberOfButtons >= 2) { // View  contains TWO OTHER Buttons - First & Second Button
        
        UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeSystem];
        firstButton.backgroundColor = [UIColor whiteColor];
        firstButton.frame = CGRectMake(0,
                                       alertViewFrame.size.height - 135,
                                       alertViewFrame.size.width,
                                       45);
        if (_hideDoneButton)
            firstButton.frame = CGRectMake(0,
                                           alertViewFrame.size.height - 45,
                                           alertViewFrame.size.width/2,
                                           45);
        [firstButton setTitle:[buttonTitles objectAtIndex:0] forState:UIControlStateNormal];
        [firstButton addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
        firstButton.titleLabel.font = [UIFont systemFontOfSize:16.0f weight:UIFontWeightRegular];
        firstButton.tintColor = self.colorScheme;
        firstButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        firstButton.titleLabel.minimumScaleFactor = 0.8;
        firstButton.tag = 0;
        
        UIButton *secondButton = [UIButton buttonWithType:UIButtonTypeSystem];
        secondButton.backgroundColor = [UIColor whiteColor];
        secondButton.frame = CGRectMake(0,
                                        alertViewFrame.size.height - 90,
                                        alertViewFrame.size.width,
                                        45);
        if (_hideDoneButton)
            secondButton.frame = CGRectMake(alertViewFrame.size.width/2,
                                            alertViewFrame.size.height - 45,
                                            alertViewFrame.size.width/2,
                                            45);
        [secondButton setTitle:[buttonTitles objectAtIndex:1] forState:UIControlStateNormal];
        [secondButton addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
        secondButton.titleLabel.font = [UIFont systemFontOfSize:16.0f weight:UIFontWeightRegular];
        secondButton.tintColor = self.colorScheme;
        secondButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        secondButton.titleLabel.minimumScaleFactor = 0.8;
        secondButton.tag = 0;
        
        UIButton *doneButton = [UIButton buttonWithType:UIButtonTypeSystem];
        if (_colorScheme == nil)
            doneButton.backgroundColor = [UIColor whiteColor];
        else
            doneButton.backgroundColor = _colorScheme;
        doneButton.frame = CGRectMake(0,
                                      alertViewFrame.size.height - 45,
                                      alertViewFrame.size.width,
                                      45);
        [doneButton setTitle:doneTitle forState:UIControlStateNormal];
        [doneButton addTarget:self action:@selector(donePressed) forControlEvents:UIControlEventTouchUpInside];
        doneButton.titleLabel.font = [UIFont systemFontOfSize:18.0f weight:UIFontWeightMedium];
        if (_colorScheme != nil)
            doneButton.tintColor = [UIColor whiteColor];
        
        if (!_hideAllButtons) {
            [alertView addSubview:firstButton];
            [alertView addSubview:secondButton];
        }
        
        if (!_hideAllButtons && !_hideDoneButton)
            [alertView addSubview:doneButton];
        
        UIView *firstSeparator = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                          firstButton.frame.origin.y - 2,
                                                                          alertViewFrame.size.width,
                                                                          2)];
        firstSeparator.backgroundColor = [UIColor colorWithWhite:100.0f/255.0f alpha:1.0]; // set color as you want.
        
        UIView *secondSeparator = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                           secondButton.frame.origin.y - 2,
                                                                           alertViewFrame.size.width,
                                                                           2)];
        if (_hideDoneButton)
            secondSeparator.frame = CGRectMake(alertViewFrame.size.width/2 - 1,
                                               secondButton.frame.origin.y,
                                               2,
                                               45);
        secondSeparator.backgroundColor = [UIColor colorWithWhite:100.0f/255.0f alpha:1.0]; // set color as you want.
        
        UIVisualEffect *blurEffect;
        blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        
        UIVisualEffectView *visualEffectView;
        visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        visualEffectView.frame = firstSeparator.bounds;
        visualEffectView.userInteractionEnabled = NO;
        [firstSeparator addSubview:visualEffectView];
        
        UIVisualEffectView *visualEffectView2;
        visualEffectView2 = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        visualEffectView2.frame = secondSeparator.bounds;
        visualEffectView2.userInteractionEnabled = NO;
        [secondSeparator addSubview:visualEffectView2];
        
        if (!_hideAllButtons) {
            [alertView addSubview:firstSeparator];
            [alertView addSubview:secondSeparator];
        }
        
    }
    
    UIVisualEffect *blurEffect;
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *visualEffectView;
    visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    visualEffectView.frame = separatorLineView.bounds;
    visualEffectView.userInteractionEnabled = NO;
    [separatorLineView addSubview:visualEffectView];
    
    circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(alertViewContents.frame.size.width/2 - 30.0f, -30.0f, 60.0f, 60.0f)] CGPath]];
    [circleLayer setFillColor:[UIColor whiteColor].CGColor];
    
    UIButton *alertViewVector = [UIButton buttonWithType:UIButtonTypeSystem];
    alertViewVector.frame = CGRectMake(alertViewContents.frame.size.width/2 - 15.0f,
                                       -15.0f,
                                       30.0f,
                                       30.0f);
    [alertViewVector setImage:vectorImage forState:UIControlStateNormal];
    alertViewVector.userInteractionEnabled = 0;
    alertViewVector.tintColor = _colorScheme;
    
    // VIEW BORDER - Rounding Corners of AlertView
    
    alertView.layer.cornerRadius = self.cornerRadius;
    alertView.layer.masksToBounds = YES;
    
    // ADDING CONTENTS - Contained in Header and Separator Views
    
    [alertViewContents addSubview:titleLabel];
    [alertViewContents addSubview:descriptionLabel];
    
    if (!_hideAllButtons) {
        if (_numberOfButtons == 1)
            [alertViewContents addSubview:separatorLineView];
        else if (!_hideDoneButton)
            [alertViewContents addSubview:separatorLineView];
    }
    
    if (alertViewWithVector) {
        [alertViewContents.layer addSublayer:circleLayer];
        [alertViewContents addSubview:alertViewVector];
    }
    
    // SCALING ALERTVIEW - Before Animation
    
    alertViewContents.transform = CGAffineTransformMakeScale(1.15, 1.15);
    
    // APPLYING SHADOW
    
    [self.layer setShadowColor:[UIColor blackColor].CGColor];
    [self.layer setShadowOpacity:0.10f];
    [self.layer setShadowRadius:10.0f];
    [self.layer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
    
    [self showAlertView];
    
}

+(NSBundle *)getResourcesBundle
{
    NSBundle *bundle = [NSBundle bundleWithURL:[[NSBundle bundleForClass:[self class]] URLForResource:@"FCAlertView" withExtension:@"bundle"]];
    return bundle;
}

-(UIImage *)loadImageFromResourceBundle:(NSString *)imageName
{
    UIImage *icon = [UIImage imageNamed:imageName];
    
    CGImageRef cgref = [icon CGImage];
    CIImage *cim = [icon CIImage];
    
    if (cim == nil && cgref == NULL)
    {
        NSBundle *bundle = [FCAlertView getResourcesBundle];
        NSString *imageFileName = [NSString stringWithFormat:@"%@.png",imageName];
        UIImage *image = [UIImage imageNamed:imageFileName inBundle:bundle compatibleWithTraitCollection:nil];
        return image;
    }
    
    return icon;
}

#pragma  mark - Default Types of Alerts

- (void) makeAlertTypeWarning {
    vectorImage = [self loadImageFromResourceBundle:@"close-round.png"];
    alertViewWithVector = 1;
    self.colorScheme = self.flatRed;
}

- (void) makeAlertTypeCaution {
    vectorImage = [self loadImageFromResourceBundle:@"alert-round.png"];
    alertViewWithVector = 1;
    self.colorScheme = self.flatOrange;
}

- (void) makeAlertTypeSuccess {
    vectorImage = [self loadImageFromResourceBundle:@"checkmark-round.png"];
    alertViewWithVector = 1;
    self.colorScheme = self.flatGreen;
}

#pragma  mark - Presenting AlertView

- (void) showAlertInView:(UIViewController *)view withTitle:(NSString *)title withSubtitle:(NSString *)subTitle withCustomImage:(UIImage *)image withDoneButtonTitle:(NSString *)done andButtons:(NSArray *)buttons {
    
    self.title = title;
    self.subTitle = subTitle;
    buttonTitles = buttons;
    _numberOfButtons = buttonTitles.count;
    doneTitle = done;
    
    if (!alertViewWithVector)
        vectorImage = image;
    
    [self checkCustomizationValid];
    
    [view.view.window addSubview:self];
    
}

#pragma  mark - Showing and Hiding AlertView

- (void) showAlertView {
    
    id<FCAlertViewDelegate> strongDelegate = self.delegate;
    
    if ([strongDelegate respondsToSelector:@selector(FCAlertViewWillAppear:)]) {
        [strongDelegate FCAlertViewWillAppear:self];
    }
    
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.alpha = 1;
        alertViewContents.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        if (self.autoHideSeconds != 0) {
            [self performSelector:@selector(dismissAlertView) withObject:nil afterDelay:self.autoHideSeconds];
        }
    }];
    
}

- (void) dismissAlertView {
    
    [UIView animateWithDuration:0.175 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.alpha = 0;
        alertViewContents.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        
        id<FCAlertViewDelegate> strongDelegate = self.delegate;
        
        if ([strongDelegate respondsToSelector:@selector(FCAlertViewDismissed:)]) {
            [strongDelegate FCAlertViewDismissed:self];
        }
        
        [self removeFromSuperview];
        
    }];
    
}

#pragma  mark - ACTIONS
#pragma mark Button Selection

- (void)handleButton:(id)sender {
    
    id<FCAlertViewDelegate> strongDelegate = self.delegate;
    
    UIButton *clickedButton = (UIButton*)sender;
    
    if ([strongDelegate respondsToSelector:@selector(FCAlertView:clickedButtonIndex:buttonTitle:)]) {
        [strongDelegate FCAlertView:self clickedButtonIndex:[sender tag] buttonTitle:clickedButton.titleLabel.text];
    }
    
    [self dismissAlertView];
    
}

- (void) donePressed {
    
    id<FCAlertViewDelegate> strongDelegate = self.delegate;
    
    if ([strongDelegate respondsToSelector:@selector(FCAlertDoneButtonClicked:)]) {
        [strongDelegate FCAlertDoneButtonClicked:self];
    }
    
    [self dismissAlertView];
    
}

@end
