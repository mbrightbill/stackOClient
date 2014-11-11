//
//  QuestionsSearchViewController.h
//  stackOClient
//
//  Created by Matthew Brightbill on 11/10/14.
//  Copyright (c) 2014 Matthew Brightbill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsSearchViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIApplicationDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end
