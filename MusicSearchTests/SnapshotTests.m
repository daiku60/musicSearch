//
//  SnapshotTests.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 18/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "SnapshotTestCase.h"
#import "TracksListViewController.h"
#import "TracksListModels.h"

@interface SnapshotTests : SnapshotTestCase

@end

@implementation SnapshotTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTracksListViewController {
    
    NSArray<TracksList_TrackViewModel *> *tracks = [NSArray arrayWithObjects:[[TracksList_TrackViewModel alloc] initWithTrackTitle:@"Thriller" andArtistName:@"Michael Jackson"], [[TracksList_TrackViewModel alloc] initWithTrackTitle:@"Smooth Criminal" andArtistName:@"Michael Jackson"], [[TracksList_TrackViewModel alloc] initWithTrackTitle:@"Man in the Mirror" andArtistName:@"Michael Jackson"], nil];
    TracksList_SearchViewModel *viewModel = [[TracksList_SearchViewModel alloc] initWithTracks:tracks];
    
    TracksListViewController *vc = [[TracksListViewController alloc] initWithViewModel:viewModel];
    [self debugViewController:vc];
}

- (void)testVC {
    [self expectationWithDescription:@"No expectation"];
    UIViewController *vc = [[UIViewController alloc] init];
    [[UIApplication sharedApplication].keyWindow setRootViewController:vc];
    [self waitForExpectationsWithTimeout:1000 handler:^(NSError * _Nullable error) {
        NSLog(@"%@", error);
    }];
}

@end
