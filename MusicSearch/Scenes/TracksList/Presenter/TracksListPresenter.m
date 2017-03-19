//
//  TracksListPresenter.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TracksListPresenter.h"
#import "TrackModel.h"
#import "TracksListModels.h"

@implementation TracksListPresenter: NSObject

- (void)presentSearchWithResponse:(TracksList_SearchResponse * _Nonnull)response {
    TracksList_SearchViewModel *viewModel = [self viewModelFromResponse:response];
    if (viewModel == nil) {
        NSError *error = [[NSError alloc] initWithDomain:@"TracksList.presenter" code:1001 userInfo:@{ @"message" : NSLocalizedString(@"Error during parsing", @"") }];
        [self.output displaySearchError:error];
    } else {
        [self.output displaySearchResults:viewModel];
    }
}

- (void)presentSearchWithError:(NSError * _Nullable)error {
    if (error != nil) {
        [self.output displaySearchError:error];
    }
}

- (TracksList_SearchViewModel * _Nullable)viewModelFromResponse:(TracksList_SearchResponse * _Nonnull)response {
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (TrackModel *trackModel in response.resultsArray) {
        TracksList_TrackViewModel *trackVM = [[TracksList_TrackViewModel alloc] initWithTrackId:trackModel.trackId andTrackTitle:trackModel.trackName andArtistName:trackModel.artistName andImagePath:trackModel.artworkUrl60];
        [mutableArray addObject:trackVM];
    }
    
    return [[TracksList_SearchViewModel alloc] initWithTracks:[mutableArray copy]];
}

@end
