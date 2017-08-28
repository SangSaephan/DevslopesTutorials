//
//  VideoVC.h
//  DevslopesTutorials
//
//  Created by Sang Saephan on 8/28/17.
//  Copyright © 2017 Sang Saephan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoVC : UIViewController <UIWebViewDelegate>
@property (nonatomic, strong) Video *video;
@end
