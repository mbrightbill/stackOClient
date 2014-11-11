//
//  NetworkController.h
//  stackOClient
//
//  Created by Matthew Brightbill on 11/10/14.
//  Copyright (c) 2014 Matthew Brightbill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkController : NSObject

+ (id)networkController;

@property (nonatomic, strong) NSURLSession *urlSession;

- (void)fetchQuestionsUsingSearch:(NSString *)searchPhrase completionHandler: (void (^)(NSMutableArray *))completionHandler;

@end
