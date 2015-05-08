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
#import <SVProgressHUD/SVProgressHUD.h>
#import <UIView+Shake.h>
#import "NSString+HTML.h"

@interface QuestionsSearchViewController ()

@end

@implementation QuestionsSearchViewController

#pragma mark - Lifecycle methods

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Questions", @"Questions");

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"Search Questions";
}

#pragma mark - Search Bar methods

- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [SVProgressHUD show]; // dependency
    [self.view shake:10   // 10 times
           withDelta:5    // 5 points wide
            andSpeed:0.04
      shakeDirection:ShakeDirectionVertical
     ];
    [[NetworkController networkController] fetchQuestionsUsingSearch:self.searchBar.text completionHandler:^(NSMutableArray *response) {
        self.questions = response;
        [self.tableView reloadData];
    }];
    [SVProgressHUD dismiss];
    [self.searchBar resignFirstResponder];
}

#pragma mark - Table View methods

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
    cell.questionTitle.text = [selectedQuestion.title kv_decodeHTMLCharacterEntities    ];
    return cell;
}

@end
