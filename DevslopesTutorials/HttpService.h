//
//  HttpService.h
//  DevslopesTutorials
//
//  Created by Sang Saephan on 8/24/17.
//  Copyright © 2017 Sang Saephan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSDictionary * __nullable dataDict, NSString * __nullable errMessage);

@interface HttpService : NSObject

+ (id)instance;
- (void)getTutorials: (nullable onComplete)completionHandler;

@end
