//
//  Question.h
//  stackOClient
//
//  Created by Matthew Brightbill on 11/10/14.
//  Copyright (c) 2014 Matthew Brightbill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSDictionary *owner;
@property (nonatomic, strong) NSString *ownerName;

@property (nonatomic, strong) NSMutableArray *questions;

+ (NSMutableArray *)parseJSONIntoQuestions:(NSData *)rawJSONData;

@end
