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

#import "TrackDetailViewController.h"
#import "TrackDetailModels.h"

@interface SnapshotTests : SnapshotTestCase

@end

@implementation SnapshotTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.recordMode = NO;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTracksListViewController {
    
    NSArray<TracksList_TrackViewModel *> *tracks = [NSArray arrayWithObjects:[[TracksList_TrackViewModel alloc] initWithTrackId: 1001 andTrackTitle:@"Thriller" andArtistName:@"Michael Jackson"], [[TracksList_TrackViewModel alloc] initWithTrackId: 1002 andTrackTitle:@"Smooth Criminal" andArtistName:@"Michael Jackson"], [[TracksList_TrackViewModel alloc] initWithTrackId: 1001 andTrackTitle:@"Man in the Mirror" andArtistName:@"Michael Jackson"], nil];
    TracksList_SearchViewModel *viewModel = [[TracksList_SearchViewModel alloc] initWithTracks:tracks];
    
    TracksListViewController *vc = [[TracksListViewController alloc] initWithViewModel:viewModel];
    [self presentViewController:vc];
    FBSnapshotVerifyView(self.window, @"TracksList");
}

- (void)testTrackDetailViewController {
    
    TrackDetail_ViewModel *viewModel = [[TrackDetail_ViewModel alloc] initWithName:@"Jack Johnson - Better Together" andAudioPath:@"http://a25.phobos.apple.com/us/r30/Music6/v4/13/22/67/1322678b-e40d-fb4d-8d9b-3268fe03b000/mzaf_8818596367816221008.plus.aac.p.m4a" andImagePath:@"http://is3.mzstatic.com/image/thumb/Music2/v4/a2/66/32/a2663205-663c-8301-eec7-57937c2d0878/source/100x100bb.jpg"];
    
    TrackDetailViewController *vc = [[TrackDetailViewController alloc] initWithViewModel:viewModel];
    [self presentViewController:vc];
    FBSnapshotVerifyView(self.window, @"TrackDetail");
}

@end
