//
//  ReadmeViewController.m
//  FCAlertView
//
//  Created by Nima Tahami on 2016-08-20.
//  Copyright © 2016 Nima Tahami. All rights reserved.
//

#import "ReadmeViewController.h"

@interface ReadmeViewController ()

@end

@implementation ReadmeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NAV BAR SETTINGS
    
    self.title = @"Readme";
    
    // WEBVIEW SETTINGS
    
    self.webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    NSString *urlString = @"https://github.com/nimati/FCAlertView/blob/master/README.md";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    self.webView.backgroundColor = [UIColor whiteColor];
    self.webView.delegate = self;
    
    [self.view addSubview:self.webView];
    
}



@end
