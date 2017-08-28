//
//  ViewController.m
//  DevslopesTutorials
//
//  Created by Sang Saephan on 8/24/17.
//  Copyright © 2017 Sang Saephan. All rights reserved.
//

#import "ViewController.h"
#import "HttpService.h"
#import "Video.h"
#import "VideoCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *videoList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.videoList = [[NSArray alloc] init];
    
    [[HttpService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
        if (dataArray) {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            
            for (NSDictionary *dict in dataArray) {
                Video *video = [[Video alloc]init];
                video.videoTitle = [dict objectForKey:@"title"];
                video.videoDescription = [dict objectForKey:@"description"];
                video.videoIframe = [dict objectForKey:@"iframe"];
                video.thumbnailUrl = [dict objectForKey:@"thumbnail"];
                
                [arr addObject:video];
            }
            
            self.videoList = arr;
            [self updateTableData];
            
        } else if (errMessage) {
            // Display alert to user
        }
    }];
}

- (void)updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = (VideoCell*) [tableView dequeueReusableCellWithIdentifier:@"main"];
    
    if (!cell) {
        cell = [[VideoCell alloc]init];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}


@end
