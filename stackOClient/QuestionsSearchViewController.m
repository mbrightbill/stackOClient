//
//  QuestionsSearchViewController.m
//  stackOClient
//
//  Created by Matthew Brightbill on 11/10/14.
//  Copyright (c) 2014 Matthew Brightbill. All rights reserved.
//

#import "QuestionsSearchViewController.h"

@interface QuestionsSearchViewController ()

@end

@implementation QuestionsSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"Search Questions";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QUESTION_CELL" forIndexPath:indexPath];
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
