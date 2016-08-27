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
  
  func FCAlertViewDismissed(alertView: FCAlertView)
  func FCAlertViewWillAppear(alertView: FCAlertView)
  func FCAlertDoneButtonClicked(alertView: FCAlertView)
  
}