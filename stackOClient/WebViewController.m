//
//  WebViewController.m
//  stackOClient
//
//  Created by Matthew Brightbill on 11/11/14.
//  Copyright (c) 2014 Matthew Brightbill. All rights reserved.
//

#import "WebViewController.h"
#import "NetworkController.h"

@interface WebViewController ()

@property (nonatomic, strong) NSString *publicKey;
@property (nonatomic, strong) NSString *oAuthDomain;
@property (nonatomic, strong) NSString *clientID;
@property (nonatomic, strong) NSString *oAuthURL;
@property (nonatomic, strong) NSString *loginURLString;
@property (nonatomic, strong) NSURL * loginURL;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.publicKey = @"PXHUNnVg)RYEOhqa7FUOHQ((";
    self.oAuthDomain = @"stackexchange.com/oauth/login_success";
    self.clientID = @"3843";
    self.oAuthURL = @"https://stackexchange.com/oauth/dialog";
    
    self.webView.delegate = self;
    self.loginURLString = [NSString stringWithFormat:@"%@?client_id=%@&redirect_uri=%@&scope=read_inbox", self.oAuthURL, self.clientID, self.oAuthDomain];
    NSURL *loginURL = [[NSURL alloc] initWithString:self.loginURLString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:loginURL];
    [self.webView loadRequest:request];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if (request) {
        NSString *requestString = request.URL.description;
        if ([requestString rangeOfString:@"login_success"].location != NSNotFound) {
            NSLog(@"First if");
            if ([requestString rangeOfString:@"expires"].location != NSNotFound) {
                NSLog(@"Second if");
                NSArray *components = [requestString componentsSeparatedByString:@"="];
                NSArray *tokenComponents = [components[1] componentsSeparatedByString:@"&"];
                [NetworkController networkController].token = tokenComponents[0];
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }
    return true;
}

@end
