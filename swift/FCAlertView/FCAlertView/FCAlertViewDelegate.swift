//
//  FCAlertViewDelegate.swift
//  FCAlertView
//
//  Created by Kris Penney on 2016-08-26.
//  Copyright © 2016 Kris Penney. All rights reserved.
//

import Foundation

protocol FCAlertViewDelegate {
  optional func FCAlertView(alertView: FCAlertView, clickedButtonIndex index: Int, buttonTitle title:String)
  
}