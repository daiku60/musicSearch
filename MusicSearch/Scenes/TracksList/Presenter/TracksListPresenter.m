//
//  TracksListPresenter.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TracksListPresenter.h"
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
    //TODO: actually implement this, given the JSON
    return [[TracksList_SearchViewModel alloc] initWithTracks:[NSArray array]];
}

@end
