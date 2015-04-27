//
//  SplitContainerViewController.m
//  stackOClient
//
//  Created by Matthew Brightbill on 11/10/14.
//  Copyright (c) 2014 Matthew Brightbill. All rights reserved.
//

#import "SplitContainerViewController.h"

@interface SplitContainerViewController ()

@end

@implementation SplitContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UISplitViewController *splitVC = self.childViewControllers[0];
    splitVC.delegate = self;
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    return true;
}

@end
