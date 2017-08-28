//
//  Video.h
//  DevslopesTutorials
//
//  Created by Sang Saephan on 8/27/17.
//  Copyright © 2017 Sang Saephan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
@property (nonatomic, strong) NSString *videoTitle;
@property (nonatomic, strong) NSString *videoDescription;
@property (nonatomic, strong) NSString *videoIframe;
@property (nonatomic, strong) NSString *thumbnailUrl;
@end
