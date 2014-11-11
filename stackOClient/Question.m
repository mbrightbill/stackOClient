//
//  Question.m
//  stackOClient
//
//  Created by Matthew Brightbill on 11/10/14.
//  Copyright (c) 2014 Matthew Brightbill. All rights reserved.
//

#import "Question.h"

@implementation Question

- (Question *)init: (NSDictionary *) attributeDictionary {
    if (self = [super init]) {
        self.title = attributeDictionary[@"title"];
        NSDictionary *owner = attributeDictionary[@"owner"];
        self.ownerName = owner[@"display_name"];
    }
    return self;
}

+ (NSMutableArray *)parseJSONIntoQuestions: (NSData *)rawJSONData {
    NSError *error = nil;
    NSMutableArray *questions = [[NSMutableArray alloc] init];
    NSDictionary *JSONDictionary = [NSJSONSerialization JSONObjectWithData:rawJSONData options:0 error:&error];
    NSArray *itemsArray = JSONDictionary[@"items"];
    
    for (NSDictionary *object in itemsArray) {
        Question *newQuestion = [[Question alloc] init: object];
        [questions addObject:newQuestion];
    }
    return questions;
}

@end
