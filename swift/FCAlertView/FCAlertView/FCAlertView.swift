//
//  FCAlertView.swift
//  FCAlertView
//
//  Created by Kris Penney on 2016-08-26.
//  Copyright © 2016 Kris Penney. All rights reserved.
//

import UIKit

class FCAlertView: UIView {
  
  var defaultHeight: CGFloat = 105
  var defaultSpacing: CGFloat = 200
  
  var alertView: UIView
  var alertViewContents: UIView
  var circleLayer: CAShapeLayer
  
  var buttonTitles: [String]
  var alertViewWithVector = 0
  var doneTitle: String?
  var vectorImage: UIImage?
  
  //Delegate
  var delegate: FCAlertViewDelegate
  
  //AlertView Title & Subtitle Text
  var title: String?
  var subTitle: String?
  
  // AlertView Background
  var alertBackground: UIView
  
  // AlertView Customizations
  var numberOfButtons = 0
  var autoHideSeconds = 0
  var cornerRadius: CGFloat = 18
  
  var dismissOnOutsideTouch = false
  var hideAllButtons = false
  var hideDoneButton = false
 
  
  // Default Init
  init() {
    let result = UIScreen.mainScreen().bounds.size
    
    frame = CGRectMake(0, 0, result.width, result.height)
    backgroundColor = .clearColor()
    
//  Setting up Background View
    
    alertBackground = UIView()
    alertBackground.frame = CGRectMake(0, 0, result.width, result.height)
    alertBackground.backgroundColor = UIColor(white: 0, alpha: 0.35)
    addSubview(alertBackground)
    
//  CUSTOMIZATIONS - Setting Default Customization Settings & Checks
//    numberOfButtons = 0
//    autoHideSeconds = 0
//    cornerRadius = 18
//    
//    dismissOnOutsideTouch = false
//    hideAllButtons = false
//    hideDoneButton = false
//    
//    defaultSpacing = 105
//    defaultHeight = 200
    
    checkCustomizationValid()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
// MARK: Customization Data Checkpoint
  private func checkCustomizationValid(){
    if (title == nil || title!.isEmpty) &&
      (subTitle == nil || subTitle!.isEmpty){
      subTitle = "You need to have a title or subtitle to use FCAlertView 😀"
    }
    
    if (doneTitle == nil || doneTitle!.isEmpty){
      doneTitle = "Ok"
    }
    
    if cornerRadius == 0 {
      cornerRadius = 18
    }
    
    if vectorImage != nil {
      alertViewWithVector = 1
    }
  }
  
// MARK: Touch Events
  override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    if let touch = touches.first {
      let touchPoint = touch.locationInView(alertBackground)
      let touchPoint2 = touch.locationInView(alertViewContents)
      
      let isPointInsideBackview = alertBackground.pointInside(touchPoint, withEvent: nil)
      let isPointInsideAlertView = alertViewContents.pointInside(touchPoint2, withEvent: nil)
      
      if dismissOnOutsideTouch && isPointInsideBackview && !isPointInsideAlertView {
        dismissAlertView()
      }
    }
  }
  
// MARK: Drawing AlertView
  override func drawRect(rect: CGRect) {
    let result = UIScreen.mainScreen().bounds.size
    var alertViewFrame: CGRect
    alpha = 0
    
//  Adjusting AlertView Frames
    if alertViewWithVector == 1 {
      alertViewFrame = CGRectMake(self.frame.size.width/2 - ((result.width - defaultSpacing)/2),
                                  self.frame.size.height/2 - (200.0/2),
                                  result.width - defaultSpacing,
                                  defaultHeight)
    }else{
      alertViewFrame = CGRectMake(self.frame.size.width/2 - ((result.width - defaultSpacing)/2),
                                  self.frame.size.height/2 - (170.0/2),
                                  result.width - defaultSpacing,
                                  defaultHeight - 30)
    }
    
//  Frames for when AlertView doesn't contain a title
    if title == nil {
      alertViewFrame = CGRectMake(self.frame.size.width/2 - ((result.width - defaultSpacing)/2),
                 self.frame.size.height/2 - ((alertViewFrame.size.height - 50)/2),
                 result.width - defaultSpacing,
                 alertViewFrame.size.height - 10)
    }
    
//  Frames for when AlertView has hidden all buttons
    if hideAllButtons {
      alertViewFrame = CGRectMake(self.frame.size.width/2 - ((result.width - defaultSpacing)/2),
                                  self.frame.size.height/2 - ((alertViewFrame.size.height - 50)/2), result.width - defaultSpacing,
                                  alertViewFrame.size.height - 45)
    } else{
      
      // Frames for when AlertView has hidden the DONE/DISMISS button
      if hideDoneButton && numberOfButtons == 0 {
        alertViewFrame = CGRectMake(self.frame.size.width/2 - ((result.width - defaultSpacing)/2),
                                    self.frame.size.height/2 - ((alertViewFrame.size.height - 50)/2), result.width - defaultSpacing,
                                    alertViewFrame.size.height - 45)
      }
      
      // Frames for AlertView with 2 added buttons (vertical buttons)
      if !hideDoneButton && numberOfButtons >= 2 {
        alertViewFrame = CGRectMake(self.frame.size.width/2 - ((result.width - defaultSpacing)/2),
                                    self.frame.size.height/2 - ((alertViewFrame.size.height - 50 + 140)/2), result.width - defaultSpacing,
                                    alertViewFrame.size.height - 50 + 140)
      }
    }
    
//  Setting up contents of AlertView
    alertViewContents = UIView(frame: alertViewFrame)
    addSubview(alertViewContents)
    
    alertView = UIView(frame: CGRectMake(0, 0, alertViewFrame.size.width, alertViewFrame.size.height))
    
//  Setting Background Color of AlertView
    if alertViewWithVector == 1 {
      alertView.backgroundColor = .clearColor()
    }else{
      alertView.backgroundColor = .whiteColor()
    }
    
    alertViewContents.addSubview(alertView)
    
    // CREATING ALERTVIEW
    // CUSTOM SHAPING - Displaying Cut out circle for Vector Type Alerts
    
    let radius = alertView.frame.size.width
    let rectPath = UIBezierPath(roundedRect: CGRectMake(0,
                                                        0,
                                                        frame.size.width,
                                                        alertView.frame.size.height),
                                cornerRadius: 0)
    let circlePath = UIBezierPath(roundedRect: CGRectMake(alertViewFrame.size.width/2 - 33.75,
                                                          -33.75,
                                                          67.5,
                                                          67.5),
                                  cornerRadius: radius)
    
    rectPath.appendPath(circlePath)
    rectPath.usesEvenOddFillRule = true
    
    if alertViewWithVector == 1 {
      let fillLayer = CAShapeLayer()
      fillLayer.path = rectPath.CGPath
      fillLayer.fillRule = kCAFillRuleEvenOdd
      fillLayer.fillColor = UIColor.whiteColor().CGColor
      fillLayer.opacity = 1
      
      alertView.layer.addSublayer(fillLayer)
    }
    
//  HEADER VIEW - With Title & Subtitle
    let titleLabel = UILabel(frame: CGRectMake(15.0,
                                               20.0 + CGFloat(alertViewWithVector * 30),
                                               alertViewFrame.size.width - 30.0,
                                               20.0))
    titleLabel.font = UIFont.systemFontOfSize(18, weight: UIFontWeightMedium)
    titleLabel.numberOfLines = 1
    titleLabel.textColor = titleColor
    titleLabel.text = title
    titleLabel.textAlignment = .Center
    
    let descriptionLevel = (title == nil) ? 25 : 45
    
    let descriptionLabel = UILabel(frame: CGRectMake(25.0,
                               CGFloat(descriptionLevel + alertViewWithVector * 30),
                               alertViewFrame.size.width - 50.0,
                               60.0))
    descriptionLabel.font = (title == nil) ? UIFont.systemFontOfSize(16, weight: UIFontWeightRegular) :
      UIFont.systemFontOfSize(15, weight: UIFontWeightLight)
    
    descriptionLabel.numberOfLines = 4
    descriptionLabel.textColor = subTitleColor
    descriptionLabel.text = subTitle
    descriptionLabel.textAlignment = .Center
    descriptionLabel.adjustsFontSizeToFitWidth = true
    
//  Separator Line - Separating Header View with Button View
    
  }
  
  // Default Types of Alerts
  func makeAlertTypeWarning() {
    
  }
  
  func makeAlertTypeCaution() {
    
  }
  
  func makeAlertTypeSuccess(){
    
    
  }
  
  //Presenting AlertView
  
  func showAlertInView(view: UIViewController, withTitle title: String, withSubtitle subTitle: String, withCustomImage image: UIImage, withDonButtonTitle done: String, andButtons buttons: [UIButton]) {
    
  }
  
  // Dismissing AlertView
  func dismissAlertView() {
    
  }
  
  // Color Schemes
  var colorScheme: UIColor
  var titleColor: UIColor
  var subTitleColor: UIColor
}