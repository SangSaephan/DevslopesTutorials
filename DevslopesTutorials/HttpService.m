//
//  HttpService.m
//  DevslopesTutorials
//
//  Created by Sang Saephan on 8/24/17.
//  Copyright © 2017 Sang Saephan. All rights reserved.
//

#import "HttpService.h"

#define URL_BASE "http://localhost:6069"
#define URL_TUTORIALS "/tutorials"

@implementation HttpService

+ (id)instance {
    static HttpService *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc] init];
    }
    return sharedInstance;
}

- (void)getTutorials: (nullable onComplete)completionHandler {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_TUTORIALS]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *err;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                completionHandler(json, nil);
            } else {
                completionHandler(nil, @"Data is corrupt. Please try again.");
            }
        } else {
            NSLog(@"Networ Error: %@", error.debugDescription);
            completionHandler(nil, @"Problem connecting to the server.");
        }
        
    }] resume];
}

@end
