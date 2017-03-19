//
//  TracksListRouter.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TracksListRouter.h"
#import "TrackDetailViewController.h"

@implementation TracksListRouter

- (void)navigateToTrackDetailWithId:(NSInteger)trackId {
    TrackDetailViewController *detailVC = [[TrackDetailViewController alloc] initWithTrackId:trackId];
    [self.viewController.navigationController pushViewController:detailVC animated:YES];
}

@end
