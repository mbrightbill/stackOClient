//
//  QuestionsSearchViewController.m
//  stackOClient
//
//  Created by Matthew Brightbill on 11/10/14.
//  Copyright (c) 2014 Matthew Brightbill. All rights reserved.
//

#import "QuestionsSearchViewController.h"
#import "QuestionCell.h"
#import "NetworkController.h"
#import "Question.h"

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

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [[NetworkController networkController] fetchQuestionsUsingSearch:self.searchBar.text completionHandler:^(NSMutableArray *response) {
        self.questions = response;
        [self.tableView reloadData];
    }];
    [self.searchBar resignFirstResponder];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.questions != 0) {
        return self.questions.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QUESTION_CELL" forIndexPath:indexPath];
    Question *selectedQuestion = self.questions[indexPath.row];
    cell.questionTitle.text = selectedQuestion.title;
    return cell;
}

@end
