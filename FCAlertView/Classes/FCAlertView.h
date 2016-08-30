//
//  FCAlertView.h
//  ShiftRide
//
//  Created by Nima Tahami on 2016-07-10.
//  Copyright © 2016 Nima Tahami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol FCAlertViewDelegate;

@interface FCAlertView : UIView {
    
    // Default UI adjustments
    
    CGFloat defaultHeight;
    CGFloat defaultSpacing;
    
    // AlertView & Contents
    
    UIView *alertView;
    UIView *alertViewContents;
    CAShapeLayer *circleLayer;
    
    // Customizations made to UI
    
    NSMutableArray *alertButtons;
    NSInteger alertViewWithVector;
    NSString *doneTitle;
    UIImage *vectorImage;
    NSString *alertType;
    
}

// Delegate

@property (nonatomic, weak) id<FCAlertViewDelegate> delegate;

// AlertView Title & Subtitle Text

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subTitle;

// AlertView Background

@property (nonatomic, retain) UIView *alertBackground;

// AlertView Customizations

@property NSInteger numberOfButtons;
@property NSInteger autoHideSeconds;
@property CGFloat cornerRadius;

@property BOOL dismissOnOutsideTouch;
@property BOOL hideAllButtons;
@property BOOL hideDoneButton;
@property BOOL avoidCustomImageTint;

// Default Types of Alerts

- (void) makeAlertTypeWarning;
- (void) makeAlertTypeCaution;
- (void) makeAlertTypeSuccess;

// Presenting AlertView

- (void) showAlertInView:(UIViewController *)view withTitle:(NSString *)title withSubtitle:(NSString *)subTitle withCustomImage:(UIImage *)image withDoneButtonTitle:(NSString *)done andButtons:(NSArray *)buttons;

// Dismissing AlertView

- (void) dismissAlertView;

// Alert Action Block Method

typedef void (^FCActionBlock)(void);
@property (nonatomic, copy) FCActionBlock actionBlock;
@property (nonatomic, copy) FCActionBlock doneBlock;
- (void)addButton:(NSString *)title withActionBlock:(nullable FCActionBlock)action;
- (void)doneActionBlock:(nullable FCActionBlock)action;

// Color Schemes

@property (nonatomic, retain) UIColor * __nullable colorScheme;
@property (nonatomic, retain)  UIColor * __nullable titleColor;
@property (nonatomic, retain)  UIColor * __nullable subTitleColor;

// Preset Flat Colors

@property (nonatomic, retain) UIColor * __nullable flatTurquoise;
@property (nonatomic, retain) UIColor * __nullable flatGreen;
@property (nonatomic, retain) UIColor * __nullable flatBlue;
@property (nonatomic, retain) UIColor * __nullable flatMidnight;
@property (nonatomic, retain) UIColor * __nullable flatPurple;
@property (nonatomic, retain) UIColor * __nullable flatOrange;
@property (nonatomic, retain) UIColor * __nullable flatRed;
@property (nonatomic, retain) UIColor * __nullable flatSilver;
@property (nonatomic, retain) UIColor * __nullable flatGray;

@end

@protocol FCAlertViewDelegate <NSObject>
@optional
- (void)FCAlertView:( FCAlertView * _Null_unspecified )alertView clickedButtonIndex:(NSInteger)index buttonTitle:(NSString * _Null_unspecified)title;
- (void)FCAlertViewDismissed:(FCAlertView * _Null_unspecified)alertView;
- (void)FCAlertViewWillAppear:(FCAlertView * _Null_unspecified)alertView;
- (void)FCAlertDoneButtonClicked:(FCAlertView * _Null_unspecified)alertView;

@end
