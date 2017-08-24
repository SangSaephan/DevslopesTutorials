//
//  HttpService.m
//  DevslopesTutorials
//
//  Created by Sang Saephan on 8/24/17.
//  Copyright © 2017 Sang Saephan. All rights reserved.
//

#import "HttpService.h"

@implementation HttpService

+ (id)instance {
    static HttpService *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc] init];
    }
    return sharedInstance;
}

@end
