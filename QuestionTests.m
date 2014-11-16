//
//  QuestionTests.m
//  stackOClient
//
//  Created by Matthew Brightbill on 11/15/14.
//  Copyright (c) 2014 Matthew Brightbill. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Question.h"

@interface QuestionTests : XCTestCase

@end

@implementation QuestionTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

-(void)testJSONParsing {
    // reference to local json file, convert to data
    NSString *pathToJSON = [[NSBundle mainBundle] pathForResource:@"exampleQuestion" ofType:@"json"];
    NSData *JSONData = [NSData dataWithContentsOfFile:pathToJSON];
    
    // should be 3 question objects in example file
    NSMutableArray *questionArray = [[NSMutableArray alloc] init];
    questionArray = [Question parseJSONIntoQuestions:JSONData];
    
    XCTAssertEqual(questionArray.count, 3);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
