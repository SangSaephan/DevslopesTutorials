//
//  VideoCell.h
//  DevslopesTutorials
//
//  Created by Sang Saephan on 8/27/17.
//  Copyright © 2017 Sang Saephan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoCell : UITableViewCell
- (void)updateUI: (nonnull Video*)video;
@end
