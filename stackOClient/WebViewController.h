//
//  WebViewController.h
//  stackOClient
//
//  Created by Matthew Brightbill on 11/11/14.
//  Copyright (c) 2014 Matthew Brightbill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
