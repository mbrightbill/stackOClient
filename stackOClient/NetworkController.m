//
//  NetworkController.m
//  stackOClient
//
//  Created by Matthew Brightbill on 11/10/14.
//  Copyright (c) 2014 Matthew Brightbill. All rights reserved.
//

#import "NetworkController.h"
#import "Question.h"

@interface NetworkController()

@property (nonatomic, strong) NSURLSession *urlSession;

@end

@implementation NetworkController

+ (NetworkController *)networkController {
    static NetworkController *networkController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networkController = [[self alloc] init];
    });
    return networkController;
}

- (void) fetchQuestionsUsingSearch:(NSString *)searchPhrase completionHandler: (void (^)(NSMutableArray *))completionHandler {
    
    NSURLSessionConfiguration *configurationSession = [NSURLSessionConfiguration defaultSessionConfiguration];
    [self setUrlSession:[NSURLSession sessionWithConfiguration:configurationSession]];
    
    NSURL *urlString = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"https://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=%@&site=stackoverflow", searchPhrase]];
    
    NSURLSessionDataTask *dataTask = [self.urlSession dataTaskWithURL:urlString completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == 0) {
            NSMutableArray *results = [Question parseJSONIntoQuestions:data];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                completionHandler(results);
            }];
        } else {
            NSLog(@"Oh no, an error occurred while trying to fetch Questions.");
        }
    }];
    [dataTask resume];
}

@end
