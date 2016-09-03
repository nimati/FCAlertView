//
//  FCAlertViewDelegate.swift
//  FCAlertView
//
//  Created by Kris Penney on 2016-08-26.
//  Copyright © 2016 Kris Penney. All rights reserved.
//

import Foundation

protocol FCAlertViewDelegate: NSObjectProtocol {
  func alertView(alertView: FCAlertView, clickedButtonIndex index: Int, buttonTitle title:String)
  
  // Optional
  func FCAlertViewDismissed(alertView: FCAlertView)
  func FCAlertViewWillAppear(alertView: FCAlertView)
  func FCAlertDoneButtonClicked(alertView: FCAlertView)
  
}

// Provide default impementation for optional methods
extension FCAlertViewDelegate {
  func FCAlertViewDismissed(alertView: FCAlertView) {
    print("View dismissed")
  }
  func FCAlertViewWillAppear(alertView: FCAlertView) {
    print("View appeared")
  }
  func FCAlertDoneButtonClicked(alertView: FCAlertView) {}
}