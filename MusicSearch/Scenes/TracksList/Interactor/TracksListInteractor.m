//
//  TracksListInteractor.m
//  MusicSearch
//
//  Created by Jordi Serra i Font on 17/3/17.
//  Copyright © 2017 kudai. All rights reserved.
//

#import "TracksListInteractor.h"
#import "TracksListModels.h"

@implementation TracksListInteractor

- (instancetype _Nullable)initWithFetcher:(id<MusicFetcherType> _Nonnull)fetcher {
    
    if ((self = [super init])) {
        self.fetcher = fetcher;
    }
    
    return self;
}

- (void)searchTracksWithRequest:(TracksList_SearchRequest *)request {
    
    [self.fetcher fetchMusicWithCompletion:^(NSDictionary<NSString *,NSString *> * _Nullable jsonResponse, NSError * _Nullable error) {
        
        if (jsonResponse != nil) {
            TracksList_SearchResponse *response = [[TracksList_SearchResponse alloc] initWithDictionary:jsonResponse];
            [self.output presentSearchWithResponse:response];
        } else {
            [self.output presentSearchWithError:error];
        }
    }];
}

@end
