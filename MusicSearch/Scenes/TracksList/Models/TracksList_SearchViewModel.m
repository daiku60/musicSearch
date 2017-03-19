//
//  TracksList_SearchViewModel.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TracksList_SearchViewModel.h"

@implementation TracksList_TrackViewModel

- (instancetype _Nullable)initWithTrackId:(NSInteger)trackId andTrackTitle:(NSString *)trackTitle andArtistName:(NSString *)artistName {
    if ((self = [super init])) {
        self.trackId = trackId;
        self.trackTitle = trackTitle;
        self.artistName = artistName;
    }
    
    return self;
}

- (id)copyWithZone:(nullable NSZone *)zone {
    TracksList_TrackViewModel *viewModel = [[TracksList_TrackViewModel alloc] init];
    viewModel.trackTitle = self.trackTitle;
    
    return viewModel;
}

@end

@implementation TracksList_SearchViewModel

- (id)copyWithZone:(nullable NSZone *)zone {
    
    NSMutableArray *copiedTracksArray = [self.tracksArray copyWithZone:zone];
    TracksList_SearchViewModel *viewModel = [[TracksList_SearchViewModel alloc] initWithTracks:copiedTracksArray];
    
    return viewModel;
}

- (instancetype)initWithTracks:(NSArray<TracksList_TrackViewModel *> *)tracksArray {
    if ((self = [super init])) {
        self.tracksArray = tracksArray;
    }
    
    return self;
}

@end
